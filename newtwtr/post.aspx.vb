Imports System
Imports System.Web
Imports System.Web.UI
Imports Twitterizer

Partial Class newtwtr_post
    Inherits System.Web.UI.Page

    Dim Key As String = "vTZsxGOKZJ6u0z3kmeH0Qg"
    Dim Secret As String = "1LwrcMxrV3Z2Yx6APJLanCCStS8cGkm6nNEnS4kcCs"
    Dim Token As String = "CQG9rjFauaUlZPw2PXKBQq1K6y3t4gGFEcOiXfKf5k"
    Dim TokenSecret As String = "pJmEwoI6umMdDHyDfWoJOQ6NfnljeWmDdMdYjxY11I"

    Protected Sub bttnAddtoTwitter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnAddtoTwitter.Click
        Dim tweet As String
        tweet = "This is a test..."

        Dim accessToken As New OAuthTokens()
        accessToken.AccessToken = Token
        accessToken.AccessTokenSecret = TokenSecret
        accessToken.ConsumerKey = Key
        accessToken.ConsumerSecret = Secret

        'Dim TweetStatus As New TwitterStatus(accessToken)
        Dim TweetStatus As New TwitterStatus()

        TwitterStatus.Update(accessToken, tweet)

        Me.lblTest2.Text = "accessToken Data:<br />"
        Me.lblTest2.Text += "AccessToken: " + accessToken.AccessToken.ToString + "<br />"
        Me.lblTest2.Text += "TokenSecret: " + accessToken.AccessTokenSecret.ToString + "<br />"
        Me.lblTest2.Text += "ConsumerKey: " + accessToken.ConsumerKey + "<br />"
        Me.lblTest2.Text += "ConsumerSecret: " + accessToken.ConsumerSecret + "<br />"
        Me.lblTest2.Text += "Tweet: " + tweet

    End Sub
End Class
