Imports System.Data
Imports System.Data.SqlClient
Partial Class CoStatus
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim SqlPass As String

    Protected Sub AttendenceDate()
        Try
            Dim sql As String = "JCT_Payroll_Compensatory_Portal_Report"
            Dim cmd As SqlCommand = New SqlCommand(sql, Obj.Connection())
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandTimeout = 0
            cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
            'cmd.Parameters.Add("@EmployeeCode", SqlDbType.VarChar, 10).Value = "9000000337"
            cmd.ExecuteNonQuery()
            Dim Da As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim ds As DataSet = New DataSet()
            Da.Fill(ds)
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()
            If ds.Tables(0).Rows.Count = 0 Then
                Dim script As String = "alert('No Record Found');"
                ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
                Return
            End If

        Catch ex As Exception
            Dim script2 As String = "alert('" & ex.Message & "');"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script2, True)
            Return
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
            'BindData()
            AttendenceDate()
        End If
    End Sub

End Class


