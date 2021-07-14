Imports System.Web

Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Net.Mail

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class SendMail
     Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function


    <WebMethod()> _
    Public Sub SendMail(ByVal sendTo As String, ByVal sendFrom As String, ByVal subject As String, ByVal text As String)



        '    Dim MailSmpt As New Mail.MailMessage
        '    Dim strMessage As String = text
        '        With MailSmpt
        '            .BodyFormat = Mail.MailFormat.Html
        '            .Subject = subject
        '            .Body = strMessage.ToString
        '            .From = sendFrom
        '            .To = sendTo
        '            .Bcc = "ashish@jctltd.com"

        '        End With
        '    Mail.SmtpMail.SmtpServer = "90.0.1.247"
        '        Mail.SmtpMail.Send(MailSmpt)
        '    Catch ex As Exception

        '    End Try


        ' Dim strMessage As String = text
        Dim message As New MailMessage()
        message.From = New MailAddress(sendFrom)
        message.[To].Add(New MailAddress(sendTo))
        message.BCC.Add(New MailAddress("ashish@jctltd.com"))
        'message.BCC.Add(New MailAddress("it.helpdesk@jctltd.com"))
        message.Subject = subject
        message.Body = text
        message.IsBodyHtml = True
        Dim mail As MailMessage = New MailMessage(sendFrom, sendTo, subject, text)
        Dim client As New SmtpClient("exchange2K7", 25)
        client.Credentials = New System.Net.NetworkCredential("noreply", "nrp@123")
        client.Send(message)
    End Sub



    '<WebMethod()> _
    'Public Sub SendMail(ByVal sendTo As String, ByVal sendFrom As String, ByVal subject As String, ByVal text As String)
    '    Try


    '    Dim MailSmpt As New Mail.MailMessage
    '    Dim strMessage As String = text
    '        With MailSmpt
    '            .BodyFormat = Mail.MailFormat.Html
    '            .Subject = subject
    '            .Body = strMessage.ToString
    '            .From = sendFrom
    '            .To = sendTo
    '            .Bcc = "ashish@jctltd.com"

    '        End With
    '    Mail.SmtpMail.SmtpServer = "90.0.1.247"
    '        Mail.SmtpMail.Send(MailSmpt)
    '    Catch ex As Exception

    '    End Try

    'End Sub

    <WebMethod()> _
    Public Function SendEMail(ByVal sendTo As String, ByVal sendFrom As String, ByVal subject As String, ByVal text As String) As String
        Dim MailSmpt As New Mail.MailMessage
        Dim strMessage As String = text
        With MailSmpt
            .BodyFormat = Mail.MailFormat.Html
            .Subject = subject
            .Body = strMessage.ToString
            .From = sendFrom
            .To = sendTo
            '.Cc = cc

        End With
        Mail.SmtpMail.SmtpServer = "90.0.1.247"
        Mail.SmtpMail.Send(MailSmpt)
        Return "Success"

    End Function

    <WebMethod()> _
    Public Function SendSMS(ByVal companycode As String, ByVal sender As String, ByVal contacts As String, ByVal message As String, ByVal Subject As String) As String
        Dim client As New smscountry.Service
        Dim ofn As New Functions
        Dim result As String = ""
        Dim sql As String = ""
        result = client.SendTextSMS("JCTLTD", "jct@158", contacts, message, "JCTLTD")
        sql = "insert jct_sms_sentsms_log (CompanyCode,SMSID,Sender,Content,SMSTo,SMSDate,Subject) " & _
                "values ('" & companycode & "','" & result & "','" & sender & "','" & message & "','" & contacts & "',getdate(),'" & Subject & "')"
        ofn.InsertRecord(sql)
        Return result

    End Function

    <WebMethod()> _
    Public Function GetDeliveryStatus(ByVal smsid As String) As String
        Dim client As New smscountry.Service
        Dim status As String = client.GetDeliveryReport("JCTLTD", "jct@158", smsid)
        Return status

    End Function

    <WebMethod()> _
    Public Function SendMAILSMS(ByVal contacts As String, ByVal message As String) As String
        Dim client As New smscountry.Service
        'Dim ofn As New Functions
        Dim result As String = ""
        'Dim sql As String = ""
        result = client.SendTextSMS("JCTLTD", "jct@258", contacts, message, "JCTLTD")

        'sql = "insert jct_sms_sentsms_log (CompanyCode,SMSID,Sender,Content,SMSTo,SMSDate,Subject) " & _
        '        "values ('" & companycode & "','" & result & "','" & sender & "','" & message & "','" & contacts & "',getdate(),'" & Subject & "')"
        'ofn.InsertRecord(sql)
        Return result

    End Function

End Class
