Imports System.IO
Imports Microsoft.VisualBasic
Imports System
Imports System.Web
Imports System.Net
Imports System.Net.Mail
'namespace to be imported

Partial Class test_contact
    Inherits System.Web.UI.Page

    Private Function SendMail() As Boolean
        'Try
        Dim SMTP As New SmtpClient
        Dim MailMsg As New MailMessage
        Dim MailTo As New MailAddress("info@tampabaysoftball.org")
        Dim MailFrom As New MailAddress("info@tampabaysoftball.org")
        Dim MailReplyTo As New MailAddress("info@wsj.com")
        Dim HostServer As String = "relay-hosting.secureserver.net"

        MailMsg.To.Add(MailTo)
        MailMsg.From = MailFrom
        MailMsg.ReplyTo = MailReplyTo
        MailMsg.Subject = "Subject of the Test"
        MailMsg.Body = "This is a test to see if this works."
        MailMsg.IsBodyHtml = True
        MailMsg.Priority = MailPriority.High
        SMTP.Host = HostServer
        SMTP.Send(MailMsg)
        SendMail = True
        'Catch ex As Exception
        'SendMail = False
        'End Try

        Return SendMail

    End Function

    Protected Sub emailSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles emailSubmit.Click
        SendMail()
    End Sub
End Class