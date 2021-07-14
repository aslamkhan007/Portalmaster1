Imports System.Data
Imports System.Data.SqlClient
Partial Class Payroll_JCT_Payroll_EmplooyeeWise_Attendance_Report
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim SqlPass As String

    Protected Sub txtefffrm_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim origDT As DateTime = Convert.ToDateTime(txtefffrm.Text)
        Dim lastDate As DateTime = New DateTime(origDT.Year, origDT.Month, 1).AddMonths(1).AddDays(-1)
        txteffto_CalendarExtender.SelectedDate = lastDate
    End Sub

    Protected Sub lnksave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles lnksave.Click
        Try

            'Dim sql As String = "JCT_Payroll_EmplooyeeWise_Attendance_Report"
            Dim sql As String = "JCT_Payroll_EmplooyeeWise_Attendance_Report_Teamwise"
            Dim cmd As SqlCommand = New SqlCommand(sql, Obj.Connection())
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandTimeout = 0
            cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = DrpLvStatus.SelectedItem.Value
            'cmd1.Parameters.Add("@Area", SqlDbType.VarChar, 20).Value = DrpLvStatus.SelectedItem.Value;
            'cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = "9000000537"
            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txtefffrm.Text)
            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = Convert.ToDateTime(txteffto.Text)
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
            Locationbind()
        End If
    End Sub

    Public Sub Locationbind()
        Dim sql As String = "JCT_Payroll_EmplooyeeWise_Attendance_Report_sha_Hierarchy"
        Dim cmd As SqlCommand = New SqlCommand(sql, Obj.Connection())
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandTimeout = 0
        cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
        cmd.ExecuteNonQuery()
        Dim Da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds)
        DrpLvStatus.Items.Clear()
        DrpLvStatus.DataSource = ds
        DrpLvStatus.DataTextField = "ReqEmpName"
        DrpLvStatus.DataValueField = "RequsterCode"
        DrpLvStatus.DataBind()
    End Sub

    Public Sub AttendenceDate()
        'Dim origDT As DateTime = Convert.ToDateTime(System.DateTime.Now.ToShortDateString())
        'origDT = New DateTime(origDT.Year, origDT.Month, 1).AddMonths(-1)
        'txtefffrm.Text = Convert.ToDateTime(origDT).ToShortDateString()
        Dim origDT As DateTime = Convert.ToDateTime(System.DateTime.Now.ToShortDateString())
        txtefffrm.Text = New DateTime(origDT.Year, origDT.Month, 1)
        Dim lastDate As DateTime = New DateTime(origDT.Year, origDT.Month, 1).AddMonths(1).AddDays(-1)
        txteffto_CalendarExtender.SelectedDate = lastDate
    End Sub

End Class

