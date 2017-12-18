
Partial Class admin_advertAdded
    Inherits System.Web.UI.Page

    Protected Sub bttnLogOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bttnLogOut.Click
        Response.Redirect("default.aspx")
    End Sub
End Class
