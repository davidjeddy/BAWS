Imports System.Net
Imports System.IO
Imports System.Net.Mail
'namespace to be imported

Partial Class contact
    Inherits System.Web.UI.Page

    'We will need to pass a query string as well do we know what panels to hide/show.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim emailPostBack As String = Request.QueryString("Email")
        Dim newsPostBack As String = Request.QueryString("Newsletter")

        If emailPostBack = "1" Then
            pnlemailForm.Visible = False
            pnlemailDone.Visible = True
            pnlSignUp.Visible = True
            pnlDone.Visible = False
        End If

        If newsPostBack = "1" Then
            pnlemailForm.Visible = True
            pnlemailDone.Visible = False
            pnlSignUp.Visible = False
            pnlDone.Visible = True
        End If

    End Sub

    Protected Sub emailSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles emailSubmit.Click

        'chkbxlstEmailSubject.Items("0").Selected = True = Joining
        'chkbxlstEmailSubject.Items("1").Selected = True = Sponsoring
        'chkbxlstEmailSubject.Items("2").Selected = True = More Info

        If ((chkbxlstEmailSubject.Items("0").Selected = False) And (chkbxlstEmailSubject.Items("2").Selected = False) And (chkbxlstEmailSubject.Items("1").Selected = False)) Then
            lblErrorEmlFrm.Visible = True
            lblErrorEmlFrm.ForeColor = Drawing.Color.Red
            lblErrorEmlFrm.Text = "Must selected one option."
        ElseIf ((Page.IsValid = True) And ((chkbxlstEmailSubject.Items("0").Selected = True) Or (chkbxlstEmailSubject.Items("2").Selected = True) Or (chkbxlstEmailSubject.Items("1").Selected = True))) Then
            'see what they want
            If chkbxlstEmailSubject.Items("0").Selected = True Then
                Dim SMTP As New SmtpClient
                Dim MailMsg As New MailMessage
                Dim MailTo As New MailAddress("info@tampabaysoftball.org")
                Dim MailFrom As New MailAddress("info@tampabaysoftball.org")
                MailMsg.Headers.Add("Reply-To", "" + Me.txtbxemailAddy.Text + "")
                Dim HostServer As String = "relay-hosting.secureserver.net"


                MailMsg.To.Add(MailTo)
                MailMsg.From = MailFrom
                MailMsg.Subject = "" + Me.txtbxemailName.Text + " would like to join BAWS."
                MailMsg.Body = "Someone would like to join BAWS! " + Me.txtbxemailName.Text + " in the " + Me.txtbxemailAddy.Text + " area would like to join  the BAWS league.<br /> Message: " + Me.txtbxemailBody.Text + "<br /> Contact information: Phone: " + Me.txtbxemailPhone.Text + " , Email: " + Me.txtbxEmail.Text + "."
                MailMsg.IsBodyHtml = True
                MailMsg.Priority = MailPriority.Normal
                SMTP.Host = HostServer
                SMTP.Send(MailMsg)
            End If

            If chkbxlstEmailSubject.Items("1").Selected = True Then
                Dim SMTP As New SmtpClient
                Dim MailMsg As New MailMessage
                Dim MailTo As New MailAddress("info@tampabaysoftball.org")
                Dim MailFrom As New MailAddress("info@tampabaysoftball.org")
                MailMsg.Headers.Add("Reply-To", "" + Me.txtbxemailAddy.Text + "")
                Dim HostServer As String = "relay-hosting.secureserver.net"


                MailMsg.To.Add(MailTo)
                MailMsg.From = MailFrom
                MailMsg.Subject = "" + Me.txtbxemailName.Text + " would like information about sponsoring BAWS."
                MailMsg.Body = "Someone would like to Sponsor BAWS! " + Me.txtbxemailName.Text + " in the " + Me.txtbxemailAddy.Text + " area would like information on sponsoring a BAWS.<br /> Message: " + Me.txtbxemailBody.Text + "<br /> Contact information: Phone: " + Me.txtbxemailPhone.Text + " , Email: " + Me.txtbxEmail.Text + "."
                MailMsg.IsBodyHtml = True
                MailMsg.Priority = MailPriority.Normal
                SMTP.Host = HostServer
                SMTP.Send(MailMsg)
            End If

            If chkbxlstEmailSubject.Items("2").Selected = True Then
                'SendEmail(EmailFrom_I, EmailSubject_I, EmailBody_I)
                Dim SMTP As New SmtpClient
                Dim MailMsg As New MailMessage
                Dim MailTo As New MailAddress("info@tampabaysoftball.org")
                Dim MailFrom As New MailAddress("info@tampabaysoftball.org")
                MailMsg.Headers.Add("Reply-To", "" + Me.txtbxemailAddy.Text + "")
                Dim HostServer As String = "relay-hosting.secureserver.net"


                MailMsg.To.Add(MailTo)
                MailMsg.From = MailFrom
                MailMsg.Subject = "" + Me.txtbxemailName.Text + " would like more information about BAWS."
                MailMsg.Body = "Someone would like more information on BAWS! " + Me.txtbxemailName.Text + " in the " + Me.txtbxemailAddy.Text + " area would like more information about the BAWS league.<br /> Message: " + Me.txtbxemailBody.Text + "<br /> Contact information: Phone: " + Me.txtbxemailPhone.Text + " , Email: " + Me.txtbxEmail.Text + "."
                MailMsg.IsBodyHtml = True
                MailMsg.Priority = MailPriority.Normal
                SMTP.Host = HostServer
                SMTP.Send(MailMsg)
            End If
            Response.Redirect("contact.aspx?Email=1")
        End If
    End Sub

    Protected Sub bttnAddToList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnAddToList.Click
        If Page.IsValid = True Then
            Try
                'setup your variables
                Dim sUsername As String = "info@tampabaysoftball.org"
                Dim sPassword As String = "PASSWORD"

                Dim sUri As String = "https://api.constantcontact.com/ws/customers/" & sUsername & "/activities"

                'If you have more than one list, change this number to whichever list you're targeting
                Dim sListUri As String = "http://api.constantcontact.com/ws/customers/" & sUsername & "/lists/3"
                Dim sAPIKey As String = "KEY"

                'Setup an HttpWebRequest to send the data
                Dim address As New Uri(sUri)

                Dim request As HttpWebRequest = TryCast(WebRequest.Create(address), HttpWebRequest)
                request.Credentials = New NetworkCredential((sAPIKey & "%" & sUsername), sPassword)
                request.Method = "POST"
                request.ContentType = "application/x-www-form-urlencoded"

                'Build an encoded string of the data to pass to Constant Contact

                'More info on this can be found at http://developer.constantcontact.com/doc/activities
                Dim data As New StringBuilder()
                data.Append("activityType=" + HttpUtility.UrlEncode("SV_ADD", Encoding.UTF8))
                data.Append("&data=" + HttpUtility.UrlEncode(("Email Address,Email Type,First Name,Last Name,Company Name" & Chr(10)), Encoding.UTF8))

                data.Append(HttpUtility.UrlEncode((txtEmail.Text & ",HTML," & txtFirstName.Text & "," & txtLastName.Text & "," & txtOrganization.Text), Encoding.UTF8))

                data.Append("&lists=" + HttpUtility.UrlEncode(sListUri))

                'The "guts" of the code to execute the request and return a response
                'The response (returned as 'strResponse') will be XML.  You can parse this for status messages if you like, or just ignore it.
                Dim byteData As Byte() = UTF8Encoding.UTF8.GetBytes(data.ToString())

                Dim st As String = String.Empty

                request.ContentLength = byteData.Length
                Using postStream As Stream = request.GetRequestStream()
                    postStream.Write(byteData, 0, byteData.Length)
                End Using

                Using response As HttpWebResponse = TryCast(request.GetResponse(), HttpWebResponse)
                    Dim reader As New StreamReader(response.GetResponseStream())
                    st = reader.ReadToEnd()
                End Using
                Response.Redirect("contact.aspx?Newsletter=1")
            Catch
                lblError.ForeColor = Drawing.Color.Purple
                lblError.Text = "Opps, we had a problem. Let us know so we can fix it."
            End Try
        End If
    End Sub

    Protected Sub emailClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles emailClear.Click
        chkbxlstEmailSubject.Items("0").Selected = False
        chkbxlstEmailSubject.Items("2").Selected = False
        chkbxlstEmailSubject.Items("1").Selected = False
        txtbxemailAddy.Text = ""
        txtbxemailBody.Text = ""
        txtbxemailName.Text = ""
        txtbxemailPhone.Text = ""
    End Sub

    Protected Sub bttnAddClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnAddClear.Click
        txtFirstName.Text = ""
        txtLastName.Text = ""
        txtOrganization.Text = ""
        txtEmail.Text = ""
    End Sub
End Class


