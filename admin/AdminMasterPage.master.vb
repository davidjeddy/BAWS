
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("LoggedIn") <> 1) Then
            Response.Redirect("../Login.aspx")
        End If

        Dim rd As New Random()
        Dim url As String = "Http://ssd.servehttp.com/IIS/BAWS/headerPhotos/" + rd.[Next](1, 5).ToString() + ".jpg"
        HeaderImage.Attributes.Add("src", "" + url + "")

    End Sub

End Class

