Imports System.Data.SqlClient

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Public Function RandomNumber(ByVal MaxNumber As Integer, Optional ByVal MinNumber As Integer = 0) As Integer

        'initialize random number generator
        Dim r As New Random(System.DateTime.Now.Millisecond)

        If MinNumber > MaxNumber Then
            Dim t As Integer = MinNumber
            MinNumber = MaxNumber
            MaxNumber = t
        End If

        Return r.Next(MinNumber, MaxNumber)

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim connBAWS As New SqlConnection(ConfigurationManager.ConnectionStrings("bawsDB").ConnectionString)
            'will need this to see if an adver it past its allowed time.
            Dim timeNow As Date = FormatDateTime(Now, DateFormat.ShortDate)
            'Dim timeNowStr As String
            'timeNowStr = timeNow.ToString("yyyy-MM-dd")

            connBAWS.Open()
            'Grab two random images from the db
            Dim sqlRmdAdvertIDs1 As New SqlCommand("SELECT advert_img_path, advert_url FROM tbl_adverts  WHERE advert_EDate > '" + timeNow + "' ORDER BY NEWID()", connBAWS)
            Dim readerRmdAdvertIDs1 As SqlDataReader = sqlRmdAdvertIDs1.ExecuteReader

            readerRmdAdvertIDs1.Read()
            alnk1.HRef = readerRmdAdvertIDs1(1).ToString
            advert1.Src = readerRmdAdvertIDs1(0).ToString
            readerRmdAdvertIDs1.Close()



            Dim sqlRmdAdvertIDs2 As New SqlCommand("SELECT advert_img_path, advert_url FROM tbl_adverts  WHERE advert_EDate > '" + timeNow + "' ORDER BY NEWID()", connBAWS)
            Dim readerRmdAdvertIDs2 As SqlDataReader = sqlRmdAdvertIDs2.ExecuteReader

            readerRmdAdvertIDs2.Read()
            alnk2.HRef = readerRmdAdvertIDs2(1).ToString
            advert2.Src = readerRmdAdvertIDs2(0).ToString
            readerRmdAdvertIDs2.Close()



            connBAWS.Close()
            connBAWS = Nothing


            Dim url As String = "headerPhotos/" + RandomNumber(1, 4).ToString() + ".jpg"
            HeaderImage.Attributes.Add("src", "" + url + "")
        Catch
            advert1.Visible = False
            advert2.Visible = False
        End Try


    End Sub
End Class

