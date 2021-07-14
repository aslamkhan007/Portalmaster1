
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Dim objfun As Functions = New Functions
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblDateTime.Text = DateTime.Today.ToString("dddd, dd-MMMM-yyyy")


            If Not Session("Empcode") = "" Then
                Dim sql As String = "select FullName from jctdev..jct_epor_master_employee where status = 'A' and emp_code ='" & Session("Empcode").ToString & "' union select empname from jct_login_emp where active = 'Y' and empcode ='" & Session("Empcode").ToString & "'"
                Session("Empname") = objfun.FetchValue(sql)
                'FetchValue(sql)
                lblGreeting.Text = objfun.Greet()
                lblUser.Text = IIf(Session("Empname") Is DBNull.Value, "User", Session("Empname"))
                lnkMyArea.Visible = True
                lnkLogin.Text = "Sign Out"

            Else
                lblUser.Text = "JCTians"
                lnkMyArea.Visible = False
                lnkLogin.Text = "Sign In"
            End If

            '--Init Greet and Username
            lblGreeting.Text = objfun.Greet()
            lblUser.Text += "!"
        End If
    End Sub


    Protected Sub lnkLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogin.Click
        If Not Session("Empcode") = "" Then
            Session("Empcode") = ""
            Session("Companycode") = ""
        End If
        Response.Redirect("Login.aspx")

    End Sub
End Class
