
Partial Class EmpGateway_ReviewAppraisalYearly
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("ReviewAppraisal.aspx?YR=" & cboYear.Text & "&ECode=" & txtEmpCode.Text)
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If (Session("empcode").ToString <> "") Then
            'empcode = Session("empcode")
        Else
            Response.Redirect("~/login.aspx")
        End If
    End Sub
End Class
