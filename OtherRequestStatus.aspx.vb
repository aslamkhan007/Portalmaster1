Imports System.Data
Imports System.Data.SqlClient
Partial Class OtherRequestStatus
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim objFun As Functions = New Functions
    Dim SqlPass As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        If (Session("empcode").ToString <> "") Then
            'empcode = Session("empcode")
        Else
            Response.Redirect("~/login.aspx")
        End If
        If Not (Page.IsPostBack) Then
   objFun.FillList(ddlCatg, "SELECT DISTINCT 'Pending' AS NAME ,'Pending' AS Val  UNION Select DISTINCT 'Authorized' AS NAME,'Authorized' AS Val  UNION Select DISTINCT 'Cancel' AS NAME,'Cancel' AS Val ")
            ddlCatg_SelectedIndexChanged(sender, e)
            BindData1()
        End If
    End Sub

    Private Sub ddlCatg_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlCatg.SelectedIndexChanged
        BindData1()
    End Sub

    Public Sub BindData1()
        Dim script As String
        Dim SqlPass As String = Nothing
        Try
            Dim Cmd As SqlCommand = New SqlCommand()
            SqlPass = "Jct_Payroll_Leave_Reimbursment_Status"
            Cmd = New SqlCommand(SqlPass, Obj.Connection())
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
            Cmd.Parameters.Add("@Param", SqlDbType.VarChar, 10).Value = ddlCatg.SelectedItem.Value            
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
        GC.Collect()
        GC.WaitForPendingFinalizers()
    End Sub
End Class



