
Partial Class Coming_Soon
    Inherits System.Web.UI.Page

    Private Sub Coming_Soon_Unload(sender As Object, e As EventArgs) Handles Me.Unload

    End Sub

    Private Sub ComingSoon_m_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then


            If (Session("empcode").ToString <> "") Then
                'empcode = Session("empcode")
            Else
                Response.Redirect("~/login.aspx")
            End If
            ' Dim Obj As Connection = New Connection
            'Dim Objfun As Functions = New Functions
            'If Objfun.fBrowserIsMobile() Then
            ' Response.Redirect("ComingSoon_m.aspx")
            'End If
            'Obj.ConClose()
        End If
    End Sub
End Class
