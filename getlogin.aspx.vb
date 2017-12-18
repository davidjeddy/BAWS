Imports Microsoft.VisualBasic
Imports System
Imports System.Web
Imports System.Net
Imports System.Net.Mail
'namespace to be imported

Imports System.Data.SqlClient

Partial Class Default2
    Inherits System.Web.UI.Page
    'Modify the below values to suit your web application
    Public MyUserName As String = "info@tampabaysoftball.org"
    Public MyPassword As String = "PASSWORD"
    Public MyDisplayName As String = "BAWS website customer."
    Public ToFields As String
    Public Subject As String = "Login information to BAWS website."

    Public Priority As System.Net.Mail.MailPriority = MailPriority.Normal
    Public ReplyTo As String
    Public MyEmailAddress As String
    Public Html As Boolean = False
    Public Body As String
    Public ToItem As String


    Public Function SendEmail() As Boolean
        Dim Complate As Boolean = False
        Dim message As New MailMessage()

        message.From = New MailAddress(MyEmailAddress, MyDisplayName)
        'For Each ToItem As String In ToFields
        message.To.Add(New MailAddress(ToItem))
        'Next

        message.Body = Body
        message.Subject = Subject
        message.IsBodyHtml = Html

        message.Priority = Priority
        Dim client As New SmtpClient()
        client.Host = "relay-hosting.secureserver.net"
        client.UseDefaultCredentials = False
        Dim cred As New NetworkCredential
        cred.UserName = MyUserName
        cred.Password = MyPassword
        client.Credentials = cred
        Try
            client.Send(message)
            Complate = True
            clearFields()
        Catch ex As Exception
            Complate = False

        End Try
        SendEmail = Complate
    End Function

    Public Sub clearFields()
        'Instead of clearing field we will hide the fields.
        txtbxEmail.Text = ""
    End Sub


    Protected Sub bttnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnSubmit.Click
        MyEmailAddress = txtbxEmail.Text
        Dim accountUsername As String = Nothing
        Dim accountPassword As String = Nothing
        Dim accountEmail As String = Nothing
        Dim emailToCheck As String = Me.txtbxEmail.Text

        'cdim conn
        Dim connBAWS As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)

        Try
            'Dim Conn-Instruction
            'WHERE (tbl_comments.commentBlogID = " + varblog1ID + ")
            Dim sqlAccoutnInfo As New SqlCommand("SELECT admin_usrnm, admin_psswrd, admin_email FROM tbl_admins WHERE (admin_email = '" + emailToCheck + "')", connBAWS)
            'Dim sqlAccoutnInfo As New SqlCommand("SELECT admin_usrnm, admin_psswrd, admin_email FROM tbl_admins WHERE (admin_email = 'test@test.com')", connBAWS)
            'Open Conn to DB just once.
            connBAWS.Open()

            'Reader
            Dim readerAccount As SqlDataReader = sqlAccoutnInfo.ExecuteReader

            While readerAccount.Read()
                accountUsername = readerAccount(0).ToString
                accountPassword = readerAccount(1).ToString
                accountEmail = readerAccount(2).ToString
            End While

            readerAccount.Close()
            connBAWS.Close()
            connBAWS = Nothing


            'The body will be the meial body and username and password.
            Body = "This is your log in information to Tampa Bay Area Women's Softball website. Username: " + accountUsername + ", and the Passowrd is: " + accountPassword + ". Please remeber to change your password once you log in. -BAWS."
            ToItem = accountEmail
            'Sending email
            SendEmail()

            'finish up showing the user it has been done
            pnlGetLogInForm.Visible = False
            pnlGetLogInDone.Visible = True
        Catch
            lblError.ForeColor = Drawing.Color.Red
            lblError.Text = "Sorry, we could not find that email adress."
        End Try

    End Sub
End Class