Imports System
Imports System.Web
Imports System.Web.UI
Imports Twitterizer

Partial Class newtwtr_auth
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim requesttoken As OAuthTokenResponse = OAuthUtility.GetRequestToken("vTZsxGOKZJ6u0z3kmeH0Qg", "1LwrcMxrV3Z2Yx6APJLanCCStS8cGkm6nNEnS4kcCs", "http://ssd.servehttp.com/IIS/BAWS/newtwtr/callback.aspx")

        Dim urlForAuth As String = OAuthUtility.BuildAuthorizationUri(requesttoken.Token).ToString

        Response.Redirect("" + urlForAuth + "")
    End Sub
End Class
