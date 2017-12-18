Imports System.Data.SqlClient
Imports TwitterVB2

Partial Class admin_Default
    Inherits System.Web.UI.Page

    'conn string
    Public connBAWS As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)

    'reused subs
    Sub cancalPWreset()
        txtbxNewName.Text = ""
        txtbxNewEmail1.Text = ""
        txtbxNewEmail2.Text = ""
        txtbxOldPW.Text = ""
        txtbxNewPW1.Text = ""
        txtbxNewPW2.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.txtbxEventName.Text = Session("Username")
        Me.txtbxPostBlogName.Text = Session("Username")
        Me.txtbxAdvertAdmin.Text = Session("Username")
        Me.lblusername.Text = Session("Username")
    End Sub

    Protected Sub posttoTwitter(ByVal Body As String)
        Dim ConsumerKey As String = ""
        Dim ConsumerKeySecret As String = ""
        Dim oauthtoken As String = ""
        Dim tokensecret As String = ""
        Dim connTwitter As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        Dim sqlTwitterSubmit As New SqlCommand("SELECT * FROM tbl_twitterData", connTwitter)


        'Open com
        connTwitter.Open()
        'Dim Reader
        Dim readertwitterData As SqlDataReader = sqlTwitterSubmit.ExecuteReader
        'Start Reader
        While readertwitterData.Read()
            ConsumerKey = readertwitterData(0).ToString
            ConsumerKeySecret = readertwitterData(1).ToString
            oauthtoken = readertwitterData(2).ToString
            tokensecret = readertwitterData(3).ToString
        End While
        readertwitterData.Close()
        connTwitter.Close()
        connTwitter = Nothing

        'Dim tw As New TwitterAPI

        'tw.AuthenticateWith(ConsumerKey, ConsumerKeySecret, oauthtoken, tokensecret)
        'tw.Update(Body)
    End Sub

    'Account functions
    Protected Sub bttmUpdateUsername_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttmUpdateUsername.Click
        Dim varNewUsrnm As String = txtbxNewName.Text

        Dim doit As Integer

        Dim connAdminUpdate As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        Dim sqlUsrnmUpdate As New SqlCommand("UPDATE tbl_admins Set admin_usrnm='" + varNewUsrnm + "' Where admin_usrnm='" + Session("Username") + "' ", connAdminUpdate)

        'you need to provide password for sql server
        connAdminUpdate.Open()

        doit = sqlUsrnmUpdate.ExecuteNonQuery()
        Session("Username") = varNewUsrnm

        connAdminUpdate.Close()
        connAdminUpdate = Nothing


        Response.Redirect("default.aspx")
    End Sub

    Protected Sub bttnUpdateEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnUpdateEmail.Click
        Dim varNewEmail As String = txtbxNewEmail2.Text
        Dim doit As Integer

        Dim connAdminUpdate As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        Dim sqlUpdateEmail As New SqlCommand("UPDATE tbl_admins Set admin_email='" + varNewEmail + "' Where admin_usrnm='" + Session("Username") + "' ", connAdminUpdate)

        'you need to provide password for sql server
        connAdminUpdate.Open()

        doit = sqlUpdateEmail.ExecuteNonQuery()

        connAdminUpdate.Close()
        connAdminUpdate = Nothing

        Response.Redirect("default.aspx")
    End Sub

    Protected Sub bttnUpdatePW_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnUpdatePW.Click
        Dim varOldPW As String = txtbxOldPW.Text
        Dim varNewPW As String = txtbxNewPW2.Text
        Dim doit As Integer

        Dim connAdminUpdate As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        Dim sqlAdvertAdd As New SqlCommand("UPDATE tbl_admins Set admin_psswrd='" + varNewPW + "' Where admin_psswrd='" + varOldPW + "' ", connAdminUpdate)

        'you need to provide password for sql server
        connAdminUpdate.Open()

        doit = sqlAdvertAdd.ExecuteNonQuery()

        connAdminUpdate.Close()
        connAdminUpdate = Nothing

        Response.Redirect("default.aspx")
    End Sub

    Protected Sub bttnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnClear.Click
        cancalPWreset()
    End Sub

    'Post Events
    Protected Sub bttnEventSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnEventSubmit.Click
        If Page.IsValid Then
            'Submit comments to comment tbl using the ID in 'blog2ID'
            'event_date() event_title() event_body() event_author_id()

            Dim EventAuthor As Integer = Session("UserID")
            Dim EventDate As DateTime = DateTime.Now
            Dim EventTitle As String = Me.txtbxEventTitle.Text
            Dim EventBody As String = Me.txtbxEventEvent.Text

            Dim sqlBlog2CommentAdd As New SqlCommand("INSERT INTO tbl_event (event_date, event_title, event_body, event_author_id) VALUES ('" & EventDate & "','" & EventTitle & "','" & EventBody & "','" & EventAuthor & "')", connBAWS)

            connBAWS.Open()
            sqlBlog2CommentAdd.ExecuteNonQuery()
            connBAWS.Close()
            connBAWS = Nothing

            'GoTo Post on twitter
            posttoTwitter(EventBody)

            Response.Redirect("default.aspx")
        End If
    End Sub

    'Clear Events
    Protected Sub bttnEventClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnEventClear.Click
        Response.Redirect("default.aspx#event")
    End Sub

    'Post Blog2
    Protected Sub bttnPostBlogSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnPostBlogSubmit.Click
        If Page.IsValid Then
            'blog_id() blog_date() blog_title() blog_body() blog_author_id()

            Dim PostBlogAuthor As Integer = Session("UserID")
            Dim PostBlogDate As DateTime = DateTime.Now
            Dim PostBlogTitle As String = Me.txtbxPostBlogTitle.Text
            Dim PostBlogBody As String = Me.txtbxPostBlogEvent.Text

            Dim sqlBlog2CommentAdd As New SqlCommand("INSERT INTO tbl_blog (blog_date, blog_title, blog_body, blog_author_id) VALUES ('" & PostBlogDate & "','" & PostBlogTitle & "','" & PostBlogBody & "','" & PostBlogAuthor & "')", connBAWS)

            connBAWS.Open()
            sqlBlog2CommentAdd.ExecuteNonQuery()
            connBAWS.Close()
            connBAWS = Nothing

            'GoTo Post on twitter
            posttoTwitter(PostBlogBody)

            'reload the page
            Response.Redirect("default.aspx")
        End If
    End Sub
    Protected Sub bttnPostBlogClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnPostBlogClear.Click
        Response.Redirect("default.aspx#blog")
    End Sub

    'Add advertiser
    Protected Sub UploadButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadButton.Click
        Dim imgpathcarry As String = ""
        'Get all the new advert data

        ' Specify the path on the server to
        ' save the uploaded file to.
        Dim savePath As String = "C:\inetpub\wwwroot\IIS\BAWS\advertsBanners\"

        ' Before attempting to perform operations
        ' on the the file, verify that the FileUpload 
        ' control contains a file.
        If (advertImgUpload.HasFile) Then

            ' Append the name of the file to upload to the path.
            savePath += advertImgUpload.FileName
            imgpathcarry += advertImgUpload.FileName

            ' Call the SaveAs method to save the 
            ' uploaded file to the specified path.
            ' This example does not perform all
            ' the necessary error checking.               
            ' If a file with the same name
            ' already exists in the specified path,  
            ' the uploaded file overwrites it.
            advertImgUpload.SaveAs(savePath)

            ' Notify the user that the file was uploaded successfully.
            UploadStatusLabel.Text = "Your file was uploaded successfully."

        Else
            ' Notify the user that a file was not uploaded.
            UploadStatusLabel.Text = "You did not specify a file to upload."
        End If

        'Prep SQL INSERT

        'Insert Data
        Dim advertName As String = Me.txtbxAdvertName.Text
        Dim advertSDate As Date = Me.txtbxAdvertSDate.Text
        Dim advertEDate As Date = Me.txtbxAdvertEDate.Text
        Dim advertPaid As Integer = Me.txtbxAdvertPaid.Text
        Dim advertPath As String = "http://ssd.servehttp.com/IIS/BAWS/advertsBanners/" + imgpathcarry.ToString
        Dim advertURL As String = Me.txtbxAdvertURL.Text
        Dim AdvertAuthor As Integer = Session("UserID")

        Dim connAddAdvert As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)

        Dim sqlAdvertAdd As New SqlCommand("INSERT INTO tbl_adverts (advert_name, advert_SDate, advert_EDate, advert_Paid, advert_img_path, advert_url, advert_admin) VALUES ('" & advertName & "','" & advertSDate & "','" & advertEDate & "','" & advertPaid & "','" & advertPath & "','" & advertURL & "','" & AdvertAuthor & "')", connAddAdvert)

        connAddAdvert.Open()
        sqlAdvertAdd.ExecuteNonQuery()
        connAddAdvert.Close()
        connAddAdvert = Nothing

        'reload the page
        Response.Redirect("advertAdded.aspx")

    End Sub

    Protected Sub bttnLogOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnLogOut.Click
        Session.Remove("Username")
        Session.Remove("LoggedIn")
        Session.Remove("UserID")
        Response.Redirect("../default.aspx")
    End Sub


End Class
