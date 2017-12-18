Imports System.Data
Imports System.Data.SqlClient
Imports System.Web

Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub bttnEnter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnEnter.Click

        Dim connStrLgnBx As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
        Dim varUsername As String = txtbxUsername.Text
        Dim varPassword As String = txtbxPassword.Text
        Dim varUSerID As Integer


        Dim sqlCommGetUsers As New SqlCommand("SELECT * FROM tbl_admins WHERE admin_usrnm = '" + varUsername + "' AND admin_psswrd = '" + varPassword + "'", connStrLgnBx)

        connStrLgnBx.Open()

        'get count
        Dim readerGetCount As SqlDataReader = sqlCommGetUsers.ExecuteReader
        While readerGetCount.Read()
            Dim varUsernameTest As String
            Dim varPasswordTest As String
            'reading from the datareader
            varUSerID = readerGetCount(0)
            varUsernameTest = readerGetCount(1)
            varPasswordTest = readerGetCount(2)

            If ((varUsername = varUsernameTest) And (varPassword = varPasswordTest)) Then
                Session("LoggedIn") = 1
                Session("UserID") = varUSerID
                Session("Username") = varUsernameTest
                Response.Redirect("admin/Default.aspx")
            End If
        End While
        readerGetCount.Close()

        connStrLgnBx.Close()
        connStrLgnBx = Nothing

    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = True Then
            lblError.ForeColor = Drawing.Color.Red
            lblError.Text = "Username or password incorrect."
        End If
    End Sub
End Class
