Imports System.Data.SqlClient
Partial Class Jct_Payroll_Change_Pass
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim SqlPass As String
    Dim Dr As SqlDataReader
    Public ob As New HelpDeskClass
    Public cmd As New SqlCommand
    Public qry As String
    Protected Sub cmdApply_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdApply.Click
        If Trim(Me.txtcurrpwd.Text) = "" Then
            Me.lblMessage.Visible = True
            Me.lblMessage.Text = "Please Specify Your Current Password!!"
            Exit Sub
        End If
        If Trim(Me.txtNewpwd.Text) = "" Then
            Me.lblNew.Visible = True
            'Me.lblNew.Text = "Please Specify Your Current Password!!"
            Exit Sub
        End If
        SqlPass = "SELECT  empname FROM jct_login_emp_payrollportal WHERE   empcode = '" & Session("Empcode") & "' AND flag = 'Y' AND ( ( CONVERT(VARCHAR(8), dateofbirth, 112) = '" & Trim(Me.txtcurrpwd.Text) & " ' AND new_pass IS NULL) OR ( new_pass IS NOT NULL AND new_pass = CONVERT(VARCHAR(30), CONVERT(VARBINARY, '" & Trim(Me.txtcurrpwd.Text) & " ')) )) "
        Dr = Obj.FetchReader(SqlPass)

        Try
            Dr.Read()
            If Dr.HasRows = False Then
                'While Dr.Read()
                Me.lblMessage.Visible = True
                Me.lblMessage.Text = "Incorrect Password!!"
                Exit Sub
                'End While
            End If
            Dr.Close()
            SqlPass = "exec Jct_PR_UPD_PWD '" & Session("Empcode") & "','" & Trim(Me.txtNewpwd.Text) & "'"
            'SqlPass = "update jctdev..jct_login_emp_payrollportal set new_pass=convert(varbinary,'" & Trim(Me.txtNewpwd.Text) & "') where empcode='" & Session("Empcode") & "' and empname= '" & Session("Empname") & "'"
            ob.opencn()
            cmd = New SqlCommand(SqlPass, ob.cn)
            cmd.ExecuteNonQuery()
            ob.closecn()
            'Response.Write("<script>alert('Password Changed Successfully!!')</script>")
            ClientScript.RegisterClientScriptBlock(Me.GetType, "Por", "<script language = javascript>alert('Password Changed Successfully.')</script>")
            'Response.Redirect("default.aspx")
        Catch ex As Exception
            Dim str As String = String.Empty
            str = "Ahh!!! Something went wrong.. " + ex.Message.ToString()
            ClientScript.RegisterClientScriptBlock(Me.GetType, "Por", "<script language = javascript>alert('" + str + "')</script>")
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetExpires(Now.AddSeconds(-1))
        Response.Cache.SetNoStore()
        Response.AppendHeader("Pragma", "no-cache")
        If (Session("Empcode").ToString <> "") Then
            'empcode = Session("Empcode")
        Else
            Response.Redirect("~/login.aspx")
        End If
        If Not IsPostBack Then
            Me.cmdCancel.Visible = False
            Me.lblMessage.Visible = False
            Me.lblNew.Visible = False
        End If

    End Sub

    Protected Sub cmdCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
        Response.Redirect("Jct_Payroll_Change_Pass.aspx")
    End Sub
End Class
