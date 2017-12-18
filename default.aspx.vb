Imports System.Data.SqlClient

Partial Class _default
    Inherits System.Web.UI.Page

    'Comment Cancel clear
    Sub cancalcomment()
        txtbxComment1Name.Text = ""
        txtbxComment1Comment.Text = ""
        regExComment1ValA.Text = ""
        regExComment1ValB.Text = ""
        txtbxComment2Name.Text = ""
        txtbxComment2Comment.Text = ""
        regExComment2ValA.Text = ""
        regExComment2ValB.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'dim vars
        Dim varblog1ID As String = ""
        Dim varblog2ID As String = ""
        'dim Conn-Strings
        Dim connBAWS As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)

        Try

            Dim rd As New Random()
            Dim url As String = "http://tampabaysoftball.org/eventImages/sm_" + rd.[Next](1, 5).ToString() + ".jpg"
            upCommingImage.Attributes.Add("src", "" + url + "")



            'Dim Conn-Instruction
            Dim sqlBlog1 As New SqlCommand("SELECT TOP (2) tbl_blog.blog_id, tbl_blog.blog_date, tbl_blog.blog_title, tbl_blog.blog_body, tbl_admins.admin_usrnm FROM tbl_admins INNER JOIN tbl_blog ON tbl_admins.admin_id = tbl_blog.blog_author_id ORDER BY tbl_blog.blog_date DESC", connBAWS)
            'Open Conn to DB just once.
            connBAWS.Open()

            'Dim Reader
            Dim readerBlog1 As SqlDataReader = sqlBlog1.ExecuteReader
            'Start Reader
            Dim blogNumber As Integer
            blogNumber = 1
            While readerBlog1.Read()
                'First loop via the Reader
                If (blogNumber = 1) Then
                    blog1ID.Text = ""
                    blog1ID.Text += readerBlog1(0).ToString
                    varblog1ID = readerBlog1(0).ToString
                    blog1Date.Text = ""
                    blog1Date.Text += readerBlog1(1)
                    blog1Title.Text = ""
                    blog1Title.Text += readerBlog1(2)
                    blog1Body.Text = ""
                    blog1Body.Text += readerBlog1(3)
                    blog1Author.Text = ""
                    blog1Author.Text += readerBlog1(4)
                    'Second loop via Reader
                    blogNumber = 2
                ElseIf (blogNumber = 2) Then
                    blog2ID.Text = ""
                    blog2ID.Text += readerBlog1(0).ToString
                    varblog2ID = readerBlog1(0).ToString
                    blog2Date.Text = ""
                    blog2Date.Text += readerBlog1(1)
                    blog2Title.Text = ""
                    blog2Title.Text += readerBlog1(2)
                    blog2Body.Text = ""
                    blog2Body.Text += readerBlog1(3)
                    blog2Author.Text = ""
                    blog2Author.Text += readerBlog1(4)
                    blogNumber = 3
                ElseIf (blogNumber = 3) Then
                    'Whatever we want to do with the third blog posting
                End If
            End While
            readerBlog1.Close()
        Catch ex As Exception
            blog1ID.Text = ""
            blog1Date.Text = ""
            blog1Title.Text = ""
            blog1Body.Text = ""
            blog1Author.Text = ""
            'Second loop via Reader
            blog2ID.Text = ""
            blog2Date.Text = ""
            blog2Title.Text = ""
            blog2Body.Text = ""
            blog2Author.Text = ""
        End Try

        Try
            'Event
            Dim sqlEventComments As New SqlCommand("SELECT TOP (1) event_date, event_title, event_body FROM tbl_event ORDER BY event_date DESC", connBAWS)
            'SELECT TOP (1) event_date, event_title, event_body FROM tbl_event ORDER BY event_date
            'Dim Reader
            Dim readerEventComment As SqlDataReader = sqlEventComments.ExecuteReader
            Dim EventCommentString As String = ""
            While readerEventComment.Read()
                'title
                EventCommentString += "<font class='blogtitle'>" + readerEventComment(1).ToString + "</font>"
                EventCommentString += "<font class='blogPosting'>" + readerEventComment(2).ToString + "</font>"

            End While
            lblEventComment.Text = EventCommentString.ToString
            readerEventComment.Close()
        Catch ex As Exception
            lblEventComment.Text = "<font class='blogtitle'>We had an error getting the events, sorry, please trya gain later. </font>"
        End Try

        Dim blog1CommentString As String = ""
        Try
            'Get blog1comments.
            Dim sqlBlog1Comments As New SqlCommand("SELECT TOP (5) tbl_comments.commentTitle, tbl_comments.commentAuthor, tbl_comments.commentDate, tbl_comments.commentBody FROM tbl_blog INNER JOIN tbl_comments ON tbl_blog.blog_id = tbl_comments.commentBlogID WHERE (tbl_comments.commentBlogID = " + varblog1ID + ") ORDER BY tbl_comments.commentDate ASC", connBAWS)
            'Dim Reader
            Dim readerBlog1Comment As SqlDataReader = sqlBlog1Comments.ExecuteReader

            While readerBlog1Comment.Read()
                'title
                blog1CommentString += "<font class='commentHeader'>" + readerBlog1Comment(0).ToString + "</font>"
                'author and time
                blog1CommentString += "<font class='commentBody'>" + readerBlog1Comment(1).ToString + " at " + readerBlog1Comment(2).ToString + "</font>"
                'body
                blog1CommentString += "<font class='commentBody'>" + readerBlog1Comment(3).ToString + "</font>"
            End While
            lblblog1Comment.Text = blog1CommentString.ToString
            readerBlog1Comment.Close()
        Catch
            blog1CommentString = "<font class='commentBody'>No Comments Yet!</font>"
        End Try



        Dim blog2CommentString As String = ""
        Try
            'Get blog2comments.
            Dim sqlBlog2Comments As New SqlCommand("SELECT TOP (5) tbl_comments.commentTitle, tbl_comments.commentAuthor, tbl_comments.commentDate, tbl_comments.commentBody FROM tbl_blog INNER JOIN tbl_comments ON tbl_blog.blog_id = tbl_comments.commentBlogID WHERE (tbl_comments.commentBlogID = " + varblog2ID + ") ORDER BY tbl_comments.commentDate ASC", connBAWS)
            'Dim Reader
            Dim readerBlog2Comment As SqlDataReader = sqlBlog2Comments.ExecuteReader


            While readerBlog2Comment.Read()
                'title
                blog2CommentString += "<font class='commentHeader'>" + readerBlog2Comment(0).ToString + "</font>"
                'author and time
                blog2CommentString += "<font class='commentBody'>" + readerBlog2Comment(1).ToString + " at " + readerBlog2Comment(2).ToString + "</font>"
                'body
                blog2CommentString += "<font class='commentBody'>" + readerBlog2Comment(3).ToString + "</font>"
                lblblog2Comment.Text = blog2CommentString.ToString
                readerBlog2Comment.Close()
            End While
        Catch
            blog2CommentString = "<font class='commentBody'>No Comments Yet!</font>"
        End Try

        connBAWS.Close()
        connBAWS = Nothing

    End Sub



    'Comment Submit
    Protected Sub bttnComment1Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnComment1Submit.Click
        'Submit comments to comment tbl using the ID in 'blog1ID'

        'Dim Conn
        Dim connBAWS As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        'commentBlogID() commentAuthor() commentDate() commentTitle() commentBody()

        Dim blog1ID As Integer = Me.blog1ID.Text
        Dim blog1Name As String = Me.txtbxComment1Name.Text
        Dim blog1Date As DateTime = DateTime.Now
        Dim blog1Title As String = Me.txtbxComment1Title.Text
        Dim blog1Comment As String = Me.txtbxComment1Comment.Text

        Dim sqlBlog1CommentAdd As New SqlCommand("INSERT INTO tbl_comments (commentBlogID, commentAuthor, commentDate, commentTitle, commentBody) VALUES ('" & blog1ID & "','" & blog1Name & "','" & blog1Date & "','" & blog1Title & "','" & blog1Comment & "')", connBAWS)

        connBAWS.Open()
        sqlBlog1CommentAdd.ExecuteNonQuery()
        connBAWS.Close()
        connBAWS = Nothing

        Response.Redirect("default.aspx")
    End Sub
    'Comment Cancal
    Protected Sub bttnComment1Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnComment1Clear.Click
        cancalcomment()
    End Sub



    Protected Sub bttnComment2Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnComment2Submit.Click
        'Submit comments to comment tbl using the ID in 'blog2ID'

        'Dim Conn
        Dim connBAWS As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        'commentBlogID() commentAuthor() commentDate() commentTitle() commentBody()

        Dim blog2ID As Integer = Me.blog2ID.Text
        Dim blog2Name As String = Me.txtbxComment2Name.Text
        Dim blog2Date As DateTime = DateTime.Now
        Dim blog2Title As String = Me.txtbxComment2Title.Text
        Dim blog2Comment As String = Me.txtbxComment2Comment.Text

        Dim sqlBlog2CommentAdd As New SqlCommand("INSERT INTO tbl_comments (commentBlogID, commentAuthor, commentDate, commentTitle, commentBody) VALUES ('" & blog2ID & "','" & blog2Name & "','" & blog2Date & "','" & blog2Title & "','" & blog2Comment & "')", connBAWS)

        connBAWS.Open()
        sqlBlog2CommentAdd.ExecuteNonQuery()
        connBAWS.Close()
        connBAWS = Nothing

        Response.Redirect("default.aspx")
    End Sub
    Protected Sub bttnComment2Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnComment2Clear.Click
        cancalcomment()
    End Sub



End Class