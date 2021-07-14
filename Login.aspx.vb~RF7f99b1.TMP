Imports System.Data
Imports System.Data.SqlClient
Partial Class Login
    Inherits System.Web.UI.Page
    Public Name, Login As String
    Dim Obj As Connection = New Connection
    Dim Fun As Functions = New Functions
    Dim sqlpass As String
    Dim SqlPass1 As String
    Public cmd As New SqlCommand
    Public ob As New HelpDeskClass
    Public qry As String
    Dim PageL As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Fun.FillList(ddlCompany, "select CompanyName, CompanyName from hspdev..jct_company_master")
        'Fun.FillList(ddlLocation, "select Location, Location from hspdev..jct_company_master")

        ui_login_password.Attributes.Add("onkeypress", "return clickButton(event,'" + LinkButton1.ClientID + "')")
        ui_login_username.Focus()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

        Dim cookie As New HttpCookie("UserName")
        cookie.Value = Trim(ui_login_username.Text)
        cookie.Expires = Now.AddHours(1)
        Response.Cookies.Add(cookie)
        Dim dt As DataTable = New DataTable

        Dim auth As Integer = Fun.AuthenticateUserAtLogin(Trim(ui_login_username.Text), Trim(ui_login_password.Text))

        Dim Host_IP As String
        Host_IP = Request.ServerVariables("REMOTE_ADDR")

        If auth = 2 Then
            Session("Empcode") = UCase(ui_login_username.Text)
            'GetEmpDet()
            Fun.RegAppHit("JCT00LTD", ui_login_username.Text, "PayRollPortal", Host_IP)
            Host_IP = Request.UserHostName
            If Session("empcode") = "9901" Or Session("empcode") = "9902" Then
                Response.Redirect("testgrid.aspx")
            End If
            Get_Popup_Pages()

            Response.Redirect("Jct_Payroll_Employee_Personal_Info.aspx")
        ElseIf auth = 1 Then
            'lblError.Text = "Invalid Password"
            myerrormsg.InnerHtml = "Invalid Password"
            ui_login_password.Focus()
        ElseIf auth = 0 Then
            myerrormsg.InnerHtml = "Invalid Username"
            'lblError.Text = "Invalid Username"
            ui_login_username.Focus()
        End If

    End Sub

    'Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate, CustomValidator2.ServerValidate

    '    If AuthenticateUserAtLogin(Trim(ui_login_username.Text), Trim(ui_login_password.Text)) Then
    '        args.IsValid = True
    '    Else
    '        args.IsValid = False
    '    End If

    'End Sub

    Protected Sub Get_Popup_Pages()
        ' ----------------------------Salary pages----------------------
        Dim SqlPass = "select * from jct_login_emp_payrollportal where empcode='" & Trim(Me.ui_login_username.Text) & "' and flag = 'Y' and new_pass is null  "
        Dim Dr As SqlDataReader = Obj.FetchReader(SqlPass)
        Try
            If Dr.HasRows = False Then
                Dr.Close()
                Obj.ConClose()
                PageL = 1
                Exit Try
            Else
                Dr.Read()
                If Dr.Item(0) Is System.DBNull.Value Then
                    PageL = 1
                Else
                    PageL = 2
                End If
            End If
            Dr.Close()
        Catch ex As Exception
            Response.Write("<script>alert(ex.ToString())</script>")
        Finally
            Obj.ConClose()
        End Try
        '----------------------------------------------------------------------------------------------------

        ob.opencn()
        qry = "select *, case when byear_flag1 <> year(getdate()) and byear_flag2 <> year(getdate()) then 1 when byear_flag1 = year(getdate()) and byear_flag2 <> year(getdate()) then 2 else 0 end as Bflag from jct_empmast_base  where  ((Month(dob) = Month(getdate()) and day(dob)=day(getdate())) or (Month(dob) = Month(getdate()-1) and day(dob)=day(getdate()-1)))  and empcode='" & Session("Empcode") & "' and active='y' and (BYear_Flag1 <> year(getdate()) or BYear_Flag2 <> year(getdate())) "
        cmd = New SqlCommand(qry, ob.cn)
        Dr = cmd.ExecuteReader
        If Dr.HasRows = True Then
            Session("Birth_Flag") = 1
            Dr.Read()
            Session("Bflag") = Dr.Item("bflag")
        Else
            Session("Birth_Flag") = 0
        End If
        Dr.Close()
        ob.closecn()


        If PageL = 1 Then

            If Session("Birth_Flag") = 1 Then
                Response.Redirect("Birthday_Card.aspx")
            Else
                'Response.Redirect("frminternet_connection.aspx")
                Response.Redirect("default.aspx")
            End If
        ElseIf PageL = 2 Then

            If Session("Birth_Flag") = 1 Then
                Response.Redirect("Birthday_Card.aspx")
                ' Response.Redirect("frminternet_connection.aspx")
            End If
        End If
    End Sub

    Protected Sub CheckSystem()

        Dim ofn As Functions = New Functions

        Dim Host_IP As String = Request.ServerVariables("REMOTE_ADDR")


        Dim sql As String = "select HOST_NAME() "
        Dim Host_name As String = ofn.FetchValue(sql)

        Dim sqlstr As String = "JCT_LOGIN_ALERT"
        Dim cn As New Connection
        Dim cmd As SqlCommand = New SqlCommand(sqlstr, cn.Connection)

        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.Add("@UserCode", SqlDbType.VarChar, 16)
        cmd.Parameters("@UserCode").Value = Session("Empcode")

        cmd.Parameters.Add("@HName", SqlDbType.VarChar, 16)
        cmd.Parameters("@HName").Value = Host_name

        cmd.Parameters.Add("@HIp", SqlDbType.VarChar, 16)
        cmd.Parameters("@HIp").Value = Host_IP

        cn.ConOpen()
        cmd.ExecuteNonQuery()
        cn.ConClose()

    End Sub


    Public Function GetEmpDet() As Integer
        Dim SqlPass1 As String = "select top 1 a.deptcode,house_no,cardno,b.deptname,a.Empcode,empname,dob,replace(replace(desg,'<',''),'>','') as desg,Mr_Mrs  from jct_empmast_base a, deptmast b  where a.deptcode=b.deptcode and  a.empcode='" & Trim(Me.ui_login_username.Text) & "' and  a.Company_Code='" & Session("Location") & " ' and b.Company_Code='" & Session("Location") & " '"
        Dim Dr1 As SqlDataReader = Obj.FetchReader(SqlPass1)
        Try


            If Dr1.HasRows = True Then
                While Dr1.Read()
                    Session("cardno") = Dr1.Item("cardno")
                    Session("Empname") = Dr1.Item("EmpName")
                    Session("Empcode") = Dr1.Item("Empcode")
                    Session("Desg") = Dr1.Item("Desg")
                    Session("Dob") = Dr1.Item("Dob")
                    Session("Deptname") = Dr1.Item("DeptName")
                    'Session("Company") = ddlCompany.Text
                    'Session("Loc") = Me.ddlLocation.Text

                    If Dr1.Item("Mr_Mrs") Is System.DBNull.Value Then
                        Session("Mr_Mrs") = ""
                    Else
                        Session("Mr_Mrs") = Dr1.Item("Mr_Mrs")
                    End If

                    If Dr1.Item("house_no") Is System.DBNull.Value Then
                        Session("housetype") = ""
                    Else
                        Session("housetype") = Dr1.Item("house_no")
                    End If
                    Session("deptcode") = Dr1.Item("deptcode")

                End While
            End If

        Catch ex As Exception

        Finally
            Dr1.Close()
            Obj.ConClose()
        End Try
    End Function

    Private Sub Login_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        Obj.Connection.Dispose()
    End Sub

End Class
