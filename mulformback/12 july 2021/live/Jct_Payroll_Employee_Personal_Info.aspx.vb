Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text
Imports System.Security.Cryptography

Partial Class Payroll_Jct_Payroll_Employee_Personal_Info
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim SqlPass As String
    Dim empcode As String
    'DataTable Menus = New DataTable()
    Dim Dt_EmpData As DataTable
    Dim Objfun As Functions = New Functions()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetExpires(Now.AddSeconds(-1))
        Response.Cache.SetNoStore()
        Response.AppendHeader("Pragma", "no-cache")

        If (Session("empcode").ToString <> "") Then
            empcode = Session("empcode")

            ' If (empcode = "9000000537" Or empcode = "9000000334" Or empcode = "9000000443") Then
                ' lnkRedirectbtn.Visible = True
            ' End If

        Else
            Response.Redirect("~/login.aspx")
        End If
        modalPopup.Modal = True
        modalPopup.CenterIfModal = True

        modalPopup.Left = 100 ' Convert.ToInt32(lblHeading.Width)

        '    modalPopup.Left = Unit.Empty


        modalPopup.Top = 50 'Convert.ToInt32(rntbTop.Value)

        '    modalPopup.Top = Unit.Empty

        modalPopup.OpenerElementID = cmdreporticon.ClientID 'rbShowDialog.ClientID

        If Not (Page.IsPostBack) Then
            SqlPass = "Select isnull(Cast_Catg,'n') as Cast_Catg from JCT_payroll_employees_master where NewEmployeeCode='" & Session("EmpCode") & "' AND STATUS='A' "
            'AND Cast_Catg IS NULL
            ' If Objfun.CheckRecordExistInTransaction(SqlPass) = True Then
            Dim dr As SqlDataReader
            dr = Objfun.FetchReader(SqlPass)
            dr.Read()
            If dr.Item(0).ToString() = "n" Then

                cmdreporticon_Click(sender, e)
                modalPopup.VisibleOnPageLoad = False
                Dim script As String = "function f(){$find(""" + modalPopup.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)
            Else

                lblSubmittedVal.Text = "--> Your Selection -- " & dr.Item(0).ToString()
                lblInfo.Text = "You Have Already Submitted Information Required"
                cmdreporticon.Enabled = False
                cmdSubmit.Enabled = False

                cmdreporticon.ToolTip = "You Have Already Submitted Information Required"
            End If


            BindMenu()

        End If
    End Sub


    Private Sub BindMenu()
        'Dt_EmpData = GetData("Jct_Payroll_Birthday_Portal_Report  '" & Session("EmpCode") & "'")
        Dt_EmpData = GetData("Jct_Payroll_Employee_Personal_Info_A   '" & Session("EmpCode") & "'")
        Dim view As DataView = New DataView(Dt_EmpData)

        Me.dlstEmp.DataSource = view
        Me.dlstEmp.DataBind()

        If DataList1.Items.Count = 0 Then
            Label4.Visible = False
            lnkLink.Visible = False
        End If

    End Sub

    Private Function GetData(ByVal query As String) As DataTable

        Dim con As SqlConnection = New SqlConnection(Obj.Connection.ConnectionString)
        Dim dt As DataTable = New DataTable
        Dim cmd As SqlCommand = New SqlCommand(query)
        Dim sda As SqlDataAdapter = New SqlDataAdapter
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        sda.SelectCommand = cmd
        sda.Fill(dt)
        Return dt
    End Function

    Private Sub Payroll_Jct_Payroll_Employee_Personal_Info_Unload(sender As Object, e As EventArgs) Handles Me.Unload

        Obj.Connection.Dispose()
        '        GC.Collect();
        'GC.WaitForPendingFinalizers();
        GC.Collect()
        GC.WaitForPendingFinalizers()

    End Sub

    Protected Sub lnkLink_Click(sender As Object, e As EventArgs) Handles lnkLink.Click
        Response.Redirect("ActionArea.aspx")
    End Sub

    Protected Sub cmdreporticon_Click(sender As Object, e As System.EventArgs) Handles cmdreporticon.Click
        Dim script As String = "function f(){$find(""" + modalPopup.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)
    End Sub

    Protected Sub cmdSubmit_Click(sender As Object, e As System.EventArgs) Handles cmdSubmit.Click
        Dim Script As String = String.Empty

        Try
            SqlPass = "exec Jct_Portal_Emp_CastCatg_Update '" & Session("EmpCode") & "','" & ddlCatgList.SelectedItem.Text & "'"
            objFun.InsertRecord_WithOutTrans(SqlPass)
            Script = "alert('Record Saved....');"

        Catch ex As Exception
            Script = "alert('" & ex.Message & "');"

        Finally
            ScriptManager.RegisterStartupScript(Me, [GetType](), "ServerControlScript", Script, True)
            Response.Redirect("Jct_Payroll_Employee_Personal_Info.aspx")
        End Try
    End Sub

    'Protected Sub Submit(sender As Object, e As EventArgs)
        'Dim name As String = HttpUtility.UrlEncode(Encrypt(Session("EmpCode").Trim()))
        'Dim pageurl As String = "Jct_Payroll_User_Detail.aspx?name=" & name
        'Response.Write("<script> window.open( '" & pageurl & "','_blank' ); </script>")

        'Dim nameCookie As New HttpCookie("Name")
        'nameCookie.Values("Name") = Session("EmpCode")
        'nameCookie.Expires = DateTime.Now.AddMinutes(5)
        'Response.Cookies.Add(nameCookie)
        'Response.Redirect("Jct_Payroll_User_Detail.aspx")

    'End Sub

    Private Function Encrypt(clearText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
             &H65, &H64, &H76, &H65, &H64, &H65, _
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                    cs.Write(clearBytes, 0, clearBytes.Length)
                    cs.Close()
                End Using
                clearText = Convert.ToBase64String(ms.ToArray())
            End Using
        End Using
        Return clearText
    End Function

End Class
