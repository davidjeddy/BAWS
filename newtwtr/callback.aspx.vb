Imports System
Imports System.Web
Imports System.Web.UI
Imports Twitterizer

Partial Class newtwtr_callback
    Inherits System.Web.UI.Page

    'Me
    Dim Key As String = "vTZsxGOKZJ6u0z3kmeH0Qg"
    Dim Secret As String = "1LwrcMxrV3Z2Yx6APJLanCCStS8cGkm6nNEnS4kcCs"
    Dim Token As String = "CQG9rjFauaUlZPw2PXKBQq1K6y3t4gGFEcOiXfKf5k"
    Dim TokenSecret As String = "pJmEwoI6umMdDHyDfWoJOQ6NfnljeWmDdMdYjxY11I"
    'oauth_token=CQG9rjFauaUlZPw2PXKBQq1K6y3t4gGFEcOiXfKf5k&oauth_verifier=pJmEwoI6umMdDHyDfWoJOQ6NfnljeWmDdMdYjxY11I

    'BAWS
    'Dim Key As String = "i47mci8AQrTJDM7rcpzRQ"
    'Dim Secret As String = "aLpzs6RKyd765y88xwyjHFxTVeLM5woxjgTfZaOdak"
    'Dim Token As String = "89219072-3vKvfJyfZoyMzWzHrB1Rt2DNRovcQ6dZcfzxJBGk"
    'Dim TokenSecret As String = "9gx9oGNvNlds4yzRtkRf2NbxArs0wU6PnRWZdf8EC4"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Token = Request.QueryString("oauth_token")
        'TokenSecret = Request.QueryString("oauth_verifier")

        If Page.IsPostBack = False Then
            Dim accessToken As Twitterizer.OAuthTokenResponse = OAuthUtility.GetAccessToken(Key, Secret, Token, TokenSecret)

            Dim tokens As New Twitterizer.OAuthTokens
            tokens.AccessToken = accessToken.Token
            Token = accessToken.Token
            tokens.AccessTokenSecret = accessToken.TokenSecret
            TokenSecret = accessToken.TokenSecret
            tokens.ConsumerKey = Key
            tokens.ConsumerSecret = Secret

            'Checking all the returned data.
            Me.lblText.Text = "Token Data:<br />"
            Me.lblText.Text += "AccessToken: " + tokens.AccessToken + "<br />"
            Me.lblText.Text += "AccessTokenSecret: " + tokens.AccessTokenSecret + "<br />"
            Me.lblText.Text += "ConsumerKey: " + tokens.ConsumerKey + "<br />"
            Me.lblText.Text += "ConsumerSecret: " + tokens.ConsumerSecret + "<br />"

            Me.lblText.Text += "<br />"

            Dim authorizedUsernam As String = accessToken.ScreenName
            Me.lblText.Text += "authorizedUsernam: " + authorizedUsernam + "<br />"

            Dim authorizedUserID As String = accessToken.UserId
            Me.lblText.Text += "authorizedUserID: " + authorizedUserID + "<br />"

            Dim user As TwitterUser = TwitterUser.Show(tokens, accessToken.UserId)
            Me.lblText.Text += "Last Said: " + user.Status.Text + "<br />"
        End If


    End Sub


End Class