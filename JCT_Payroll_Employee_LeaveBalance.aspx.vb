Imports System.Data
Imports System.Data.SqlClient
Partial Class Payroll_JCT_Payroll_Employee_LeaveBalance
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim objFun As Functions = New Functions
    Dim SqlPass As String

    Public Sub BindData()
        Dim script As String
        Try
            Dim SqlPass As String = Nothing
            Dim Cmd As SqlCommand = New SqlCommand()
            SqlPass = "JCT_Payroll_Employee_LeaveBalance"
            'SqlPass = "dels"
            Cmd = New SqlCommand(SqlPass, Obj.Connection())
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = Session("EmpCode")            
            Cmd.Parameters.Add("@LYEAR", SqlDbType.Int).Value = ddlyear.SelectedItem.Value
            'Cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = "9000000537"
            Dim Da As SqlDataAdapter = New SqlDataAdapter(Cmd)
            Dim ds As DataSet = New DataSet()
            Da.Fill(ds)
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()



            If ds.Tables(0).Rows.Count = 0 Then
                script = "alert('No Record Found');"
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
                Return
            End If



            GridView1.UseAccessibleHeader = True
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader
            '// grdDetail.HeaderRow.CssClass = "gridh1";

            GridView1.FooterRow.TableSection = TableRowSection.TableFooter
            Dim cells As TableCellCollection
            cells = GridView1.HeaderRow.Cells

            cells(0).Attributes.Add("data-class", "expand")
            cells(4).Attributes.Add("data-hide", "phone,tablet")
            cells(5).Attributes.Add("data-hide", "phone,tablet")
            cells(6).Attributes.Add("data-hide", "phone,tablet")
            cells(7).Attributes.Add("data-hide", "phone,tablet")
            cells(8).Attributes.Add("data-hide", "phone,tablet")
            cells(9).Attributes.Add("data-hide", "phone,tablet")
            cells(10).Attributes.Add("data-hide", "phone,tablet")
            cells(11).Attributes.Add("data-hide", "phone,tablet")
            cells(12).Attributes.Add("data-hide", "phone,tablet")
            cells(13).Attributes.Add("data-hide", "phone,tablet")
            cells(14).Attributes.Add("data-hide", "phone,tablet")
            cells(15).Attributes.Add("data-hide", "phone,tablet")
            '//cells([4].Attributes.Add("data-hide", "phone,tablet")


            If ds.Tables(0).Rows.Count = 0 Then
                script = "alert('No Record Found');"
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
                Return
            End If
        Catch ex As Exception
            script = "alert('Something Went Wrong....'" + ex.Message.ToString() + "');"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
        Finally
            Obj.ConClose()
        End Try
    End Sub




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        If (Session("empcode").ToString <> "") Then
            'empcode = Session("empcode")
        Else
            Response.Redirect("~/login.aspx")
        End If
        If Not (Page.IsPostBack) Then
            '  objFun.FillList(ddlCatg, "SELECT DISTINCT 'Pending' AS NAME ,'Pending' AS Val  UNION Select DISTINCT 'Authorized' AS NAME,'Authorized' AS Val ")
            objFun.FillList(ddlCatg, "Select DISTINCT 'Authorized' AS NAME,'Authorized' AS Val UNION SELECT DISTINCT 'Pending' AS NAME ,'Pending' AS Val  UNION SELECT DISTINCT 'Cancel' AS NAME ,'Cancel' AS Val  ")
            ddlCatg_SelectedIndexChanged(sender, e)
            BindData()
        End If
    End Sub

    Private Sub ddlCatg_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlCatg.SelectedIndexChanged
        BindData1()
    End Sub

    Private Sub ddlyear_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlyear.SelectedIndexChanged
        BindData()
    End Sub

    Public Sub BindData1()
        Dim script As String
        Dim SqlPass As String = Nothing
        Try

            Dim Cmd As SqlCommand = New SqlCommand()
            SqlPass = "Jct_Payroll_Leave_Current_Status"
            Cmd = New SqlCommand(SqlPass, Obj.Connection())
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
            Cmd.Parameters.Add("@Param", SqlDbType.VarChar, 10).Value = ddlCatg.SelectedItem.Value
            'Cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = "9000000537"
            Dim Da As SqlDataAdapter = New SqlDataAdapter(Cmd)
            Dim ds As DataSet = New DataSet()
            Da.Fill(ds)
            GridView2.DataSource = ds.Tables(0)
            GridView2.DataBind()
            Obj.ConClose()
            If ds.Tables(0).Rows.Count = 0 Then
                script = "alert('No Record Found');"
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
                Return
            End If



            GridView2.UseAccessibleHeader = True
            GridView2.HeaderRow.TableSection = TableRowSection.TableHeader
            '// grdDetail.HeaderRow.CssClass = "gridh1";

            GridView2.FooterRow.TableSection = TableRowSection.TableFooter
            Dim cells As TableCellCollection
            cells = GridView2.HeaderRow.Cells

            cells(0).Attributes.Add("data-class", "expand")
            cells(4).Attributes.Add("data-hide", "phone,tablet")
            cells(5).Attributes.Add("data-hide", "phone,tablet")
            cells(6).Attributes.Add("data-hide", "phone,tablet")
            cells(7).Attributes.Add("data-hide", "phone,tablet")


            If ds.Tables(0).Rows.Count = 0 Then
                script = "alert('No Record Found');"
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
                Return
            End If
        Catch ex As Exception
            script = "alert('Something went wrong...'" + ex.Message.ToString() + "');"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
        Finally
            Obj.ConClose()
        End Try
    End Sub

    Private Sub Payroll_JCT_Payroll_Employee_LeaveBalance_Unload(sender As Object, e As EventArgs) Handles Me.Unload


        Obj.Connection.Dispose()
        '        GC.Collect();
        'GC.WaitForPendingFinalizers();
        GC.Collect()
        GC.WaitForPendingFinalizers()


    End Sub
End Class


