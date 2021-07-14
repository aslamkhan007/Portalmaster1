﻿Imports System.Data
Imports System.Data.SqlClient
Partial Class Payroll_Jct_Payroll_SocietyLoan
    Inherits System.Web.UI.Page
    Dim Obj As Connection = New Connection
    Dim SqlPass As String

    Public Sub BindData()
        'Dim SqlPass = "select LOANNO as [Loan Account No.],LOAN as [Loan Amount],INST1 as [Instalment Left],Loan_twcc1 as [Per Month Deduction],LOAN_LEFT as [Balance Amount] from jctdev..TWCCLOAN  where empcode='" & Session("Empcode") & "'"
        'Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
        'Dim Da As SqlDataAdapter = New SqlDataAdapter(SqlPass, Obj.Connection())
        Dim Script As String
        SqlPass = "Jct_Payroll_Society_Loan_Report"
        Dim cmd As SqlCommand = New SqlCommand(SqlPass, Obj.Connection())
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@employeecode", SqlDbType.VarChar, 10).Value = Session("EmpCode")
        'Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
        Dim Dr As SqlDataReader
        Dr = cmd.ExecuteReader
        Dim Da As SqlDataAdapter = New SqlDataAdapter(cmd)

        Try
            If Dr.HasRows = True Then
                Dr.Close()
                Dim ds As DataSet = New DataSet()
                ds.Clear()
                Da.Fill(ds)
                DetailsView1.DataSource = ds
                DetailsView1.DataBind()
                Dr.Close()
            Else
                Page.RegisterClientScriptBlock("scr", "<script language = javascript>alert('You have not taken Society Loan')</script>")
            End If
        Catch ex As Exception
            Script = "alert('Something went wrong...!!!');"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "ServerControlScript", Script, True)
        Finally
            Obj.ConClose()
        End Try

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetExpires(Now.AddSeconds(-1))
        Response.Cache.SetNoStore()
        Response.AppendHeader("Pragma", "no-cache")
        If Not (Page.IsPostBack) Then
            BindData()
        End If
    End Sub
End Class
