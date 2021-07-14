Imports System.Data
Imports System.Data.SqlClient
Partial Class LeaveAuthMailFormat
    Inherits System.Web.UI.Page
    Dim ofn As New Functions
    Dim Obj As Connection = New Connection
    Dim lID As String
    Dim lID1 As String
    'Dim lID As String = "1000000"
    'Dim lID1 As String = "9000000334"
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        'Dim sqlstr As String = "exec Jct_Payroll_Leave_Auth_mailFormat '" & Convert.ToInt32(lID) & "' , '" & lID1 & "'"
        'Dim dr As SqlDataReader
        Try
            '    dr = ofn.FetchReader(sqlstr)
            '    If dr.HasRows() Then
            'Dr.Read()
            '        lblLeaveId.Text = dr("LeaveID")
            '        lblStatus.Text = dr("CurrentStatus")
            '        lblSessionCode.Text = lID1
            BindData()
            'End If

        Catch ex As Exception

        End Try

    End Sub

    Public Sub BindData()
        Dim script As String
        Try
            lID = Request.QueryString("id")
            lID1 = Request.QueryString("Code")
            Dim SqlPass As String = Nothing
            Dim Cmd As SqlCommand = New SqlCommand()
            SqlPass = "Jct_Payroll_Leave_Auth_mailFormat"
            Cmd = New SqlCommand(SqlPass, Obj.Connection())
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.Parameters.Add("@AutoId", SqlDbType.Int).Value = Convert.ToInt32(lID)
            Cmd.Parameters.Add("@AuthBycode", SqlDbType.Char, 10).Value = lID1
            Dim Da As SqlDataAdapter = New SqlDataAdapter(Cmd)
            Dim ds As DataSet = New DataSet()
            Da.Fill(ds)
            GridView6.DataSource = ds.Tables(0)
            GridView6.DataBind()
            If ds.Tables(0).Rows.Count >= 1 Then
                lblLeaveId.Text = Convert.ToInt32(lID) '--Dr("LeaveID")
                'lblStatus.Text = ds.Tables(0).Columns("PendingAt").ToString() 'Dr("CurrentStatus")
                lblStatus.Text = ds.Tables(0).Rows(0).Item("CurrentStatus").ToString() 'Dr("CurrentStatus")
                lblSessionCode.Text = lID1
            End If
        Catch ex As Exception
            script = "alert('Something went wrong...!!!');"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", script, True)
        Finally
            Obj.ConClose()
        End Try
    End Sub

End Class
