Imports System.Data
Imports System.Data.SqlClient
Partial Class OtherInfo
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim objFun As Functions = New Functions
    Dim SqlPass As String
    Dim empcode As String
    'DataTable Menus = New DataTable()
    Dim Dt_EmpData As DataTable

    Private Function GetData(ByVal query As String) As DataTable

        Dim con As SqlConnection = New SqlConnection(Obj.Connection.ConnectionString)
        Dim dt As DataTable = New DataTable
        Dim cmd As SqlCommand = New SqlCommand(query)
        Dim sda As SqlDataAdapter = New SqlDataAdapter
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        sda.SelectCommand = cmd
        sda.Fill(dt)
        con.Close()
        Return dt

    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetExpires(Now.AddSeconds(-1))
        Response.Cache.SetNoStore()
        Response.AppendHeader("Pragma", "no-cache")
    End Sub

    Protected Sub lnksave_Click(sender As Object, e As System.EventArgs) Handles lnksave.Click
        BindMenu()
        If dlstEmp.Items.Count = 0 Then
            dlstEmp.ShowFooter = True
        Else
            dlstEmp.ShowFooter = False
            Labeltxt.Text = "Closing Status As On : " & objFun.FetchValue("select closing_month from pf4www    WHERE [UAN ] = '" & txtUANNO.Text & "'")
            '"Closing Status As On (March-2019) :"
        End If
        'GetData(
    End Sub

    Private Sub BindMenu()
        Dt_EmpData = GetData("EXEC PF4WWW_Balances  '" & txtUANNO.Text & "'")

        Dim view As DataView = New DataView(Dt_EmpData)

        Me.dlstEmp.DataSource = view
        Me.dlstEmp.DataBind()

    End Sub
End Class
