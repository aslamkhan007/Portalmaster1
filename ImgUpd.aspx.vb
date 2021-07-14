Imports System.Data
Partial Class ImgUpd
    Inherits System.Web.UI.Page
    Dim objfun As Functions = New Functions
    Dim cardNo As String = String.Empty

    Private Sub ImgUpd_Load(sender As Object, e As EventArgs) Handles Me.Load

        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        If (Session("empcode").ToString <> "") Then
            cardNo = objfun.FetchValue("SELECT CardNo FROM dbo.JCT_payroll_employees_master WHERE NewEmployeeCode='" & Session("Empcode") & "' AND STATUS='a' AND Active='Y'")
            Image5.ImageUrl = "Emp_Images\" + cardNo & ".jpg"
        
        End If

    End Sub

    Private Sub lnksave_Click(sender As Object, e As EventArgs) Handles lnksave.Click

        If FileUpload1.HasFile Then
            Try
                Dim ext As String
                Dim filepath As String

                Dim st As String = StrReverse(FileUpload1.FileName.ToString()) '.Reverse
                ext = StrReverse(st.Substring(0, 3))

                If ext.ToLower() <> "jpg" Then
                    Throw New System.Exception("Invalid file type. Please select JPG file Only")
                End If

                cardNo = objfun.FetchValue("SELECT CardNo FROM dbo.JCT_payroll_employees_master WHERE NewEmployeeCode='" & Session("Empcode") & "' AND STATUS='a' AND Active='Y'")

                filepath = Server.MapPath("Emp_Images\\") + cardNo & "." & ext
                FileUpload1.PostedFile.SaveAs(filepath)


                Image5.ImageUrl = "\Emp_Images\" + cardNo & "." & ext
            Catch ex As Exception
                objfun.Alert("" & ex.Message)

            End Try
        End If
    End Sub
End Class
