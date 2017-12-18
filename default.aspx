<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_default" %>

<asp:Content ID="Content0" ContentPlaceHolderID="ContentPlaceHolder0" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <font id="header">&nbsp;&nbsp;&nbsp;BAY AREA  WOMEN'S  SOFTBALL LEAGUE - Tampa, FL.</font>
	        <font id="bodytext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Bay Area Women's Softball League is open to women of all backgrounds and skill levels. We are a competitive recreational league officiated by professional ASA referees, and supported by our local businesses. Games are held friday nights beginning at 7:15pm at the Hyde Park community field, located on Swann Ave. just East of Howard Ave.</font>&nbsp;<!--Social Media Buttons--><div id="socialmediabox">
					<div id="socialMediaButtons">
                    	<font>Follow us on:</font>
                        <a href="http://twitter.com/tampasoftball" class="socialMediaButtons" target="_new"><img class="ds" src="interface/twitter.png" width="32" height="32" alt="Twitter" longdesc="http://www.Twitter.com" /></a>
                        <!--<a href="http://facebook.com" class="socialMediaButtons" target="_new"><img class="ds" src="interface/facebook.png" width="32" height="32" alt="Facebook" longdesc="http://www.Facebook.com" /></a>-->
                        <a href="http://www.myspace.com/tampabaysoftball" class="socialMediaButtons" target="_new"><img class="ds" src="interface/myspace.png" width="32" height="32" alt="MySpace" longdesc="http://www.MySpace.com" /></a>
					</div>
					<div id="Newsletter">
                    	<font><br />Newsletter Sign Up <a id="newsletterLink" href="contact.aspx#newsletter">HERE</a>!</font>
					</div>
				</div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="img-shadow">
    <img id="upCommingImage" src="~/eventImages/blank.jpg" runat="server" width="100" height="100" alt="Up Comming Events!"  style="position:relative;display:inline-block;float:left;" />
</div>
					<h3>Upcoming events:</h3>
    <asp:Label ID="lblEventComment" runat="server" Text="Error getting up coming events, sorry."></asp:Label>
    </asp:Content>





<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div  class="dateimage">
        <font class="datefont">
            <asp:Label ID="blog1Date" runat="server" Text="Date Error"></asp:Label>
        </font>
    </div>
<!--Blog #1 Posting-->
    <h4>
        <asp:Label ID="blog1Title" runat="server" Text="Title Error"></asp:Label>
        <asp:Label ID="blog1ID" runat="server" Text="ID Error" Visible="False"></asp:Label>
        <font class=""> - </font>
        <asp:Label ID="blog1Author" runat="server" Text="Author Error"></asp:Label>
    </h4>
    <h3>
        <asp:Label ID="blog1Body" runat="server" Text="Body Error"></asp:Label>
    </h3>
    <br />

<a href="javascript:animatedcollapse.toggle('blogpost1div')" class="viewComments">Show / Hide Comments</a>
<font class="viewCommentsdisclaim">*Disclaimer: Blog postings here express the opinion / views of that individual.<br />Not that of the Bay Area Women's Softball League.</font>


<div id="blogpost1div">
<!--blog 1 Comment here-->
    <asp:Label ID="lblblog1Comment" runat="server" Text="Error getting comments, sorry."></asp:Label>
<font class="commentHeader">Add a comment:</font>
<font class="">Name:</font>
    <asp:TextBox ID="txtbxComment1Name" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="16" Rows="1" TextMode="SingleLine" ValidationGroup="Input1ValGrp" class="viewComment1txtbox" style="width:128px"></asp:TextBox><br />
    <font class="">Title:</font>
    <asp:TextBox ID="txtbxComment1Title" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="64" Rows="1" TextMode="SingleLine" ValidationGroup="Input1ValGrp" class="viewComment1txtbox" style="width:256px"></asp:TextBox><br />
    <font class="">Post:</font>
    <asp:TextBox ID="txtbxComment1Comment" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="512" Rows="5" TextMode="MultiLine" ValidationGroup="Input1ValGrp" class="viewComment1txtbox" style="height:128px"></asp:TextBox>
    <asp:Button ID="bttnComment1Clear" runat="server" Text="Cancal" class="commentbttnClear" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnComment1Submit" runat="server" Text="Submit" class="commentbttnSubmit" /><br />
    <asp:RegularExpressionValidator ID="regExComment1ValA" runat="server" ErrorMessage="*Username can be alphanumeric characters." ValidationGroup="Input1ValGrp" ControlToValidate="txtbxComment1Name" ValidationExpression="^([a-zA-Z0-9_-]+)$" Display="Dynamic"></asp:RegularExpressionValidator><br />
    <asp:RegularExpressionValidator ID="regExComment1ValB" runat="server" ErrorMessage="*Title only can be alphanumeric and '.,@:?!()$#/\ characters only." ValidationGroup="Input1ValGrp" ControlToValidate="txtbxComment1Title" ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" Display="Dynamic"></asp:RegularExpressionValidator><br />
    <asp:RegularExpressionValidator ID="regExComment1ValC" runat="server" ErrorMessage="*Comment can be alphanumeric and '.,@:?!()$#/\ characters only." ValidationGroup="Input1ValGrp" ControlToValidate="txtbxComment1Comment" ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" Display="Dynamic"></asp:RegularExpressionValidator>
</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <div  class="dateimage">
        <font class="datefont">
            <asp:Label ID="blog2Date" runat="server" Text="Date Error"></asp:Label>
        </font>
    </div>
<!--Blog #1 Posting-->
    <h4>
        <asp:Label ID="blog2Title" runat="server" Text="Title Error"></asp:Label>
        <asp:Label ID="blog2ID" runat="server" Text="ID Error" Visible="False"></asp:Label>
        <font class=""> - </font>
        <asp:Label ID="blog2Author" runat="server" Text="Author Error"></asp:Label>
    </h4>
    <h3>
        <asp:Label ID="blog2Body" runat="server" Text="Body Error"></asp:Label>
    </h3>
    
    <br />

<a href="javascript:animatedcollapse.toggle('blogpost2div')" class="viewComments">Show / Hide Comments</a>
<font class="viewCommentsdisclaim">*Disclaimer: Blog postings here express the opinion / views of that individual.<br />Not that of the Bay Area Women's Softball League.</font>


<div id="blogpost2div">
<!--blog 2 Comment here-->
    <asp:Label ID="lblblog2Comment" runat="server" Text="Error getting comments, sorry."></asp:Label>
<font class="commentHeader">Add a comment:</font>
<font class="">Name:</font>
    <asp:TextBox ID="txtbxComment2Name" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="16" Rows="1" TextMode="SingleLine" ValidationGroup="Input2ValGrp" class="viewComment2txtbox" style="width:128px"></asp:TextBox><br />
    <font class="">Title:</font>
    <asp:TextBox ID="txtbxComment2Title" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="64" Rows="1" TextMode="SingleLine" ValidationGroup="Input2ValGrp" class="viewComment2txtbox" style="width:256px"></asp:TextBox><br />
    <font class="">Post:</font>
    <asp:TextBox ID="txtbxComment2Comment" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="512" Rows="5" TextMode="MultiLine" ValidationGroup="Input2ValGrp" Height="128px" class="viewComment2txtbox"></asp:TextBox>
    <asp:Button ID="bttnComment2Clear" runat="server" Text="Cancal" class="commentbttnClear" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnComment2Submit" runat="server" Text="Submit" class="commentbttnSubmit" /><br />
    <asp:RegularExpressionValidator ID="regExComment2ValA" runat="server" ErrorMessage="*Username can be alphanumeric characters." ValidationGroup="Input2ValGrp" ControlToValidate="txtbxComment2Name" ValidationExpression="^([a-zA-Z0-9_-]+)$" Display="Dynamic"></asp:RegularExpressionValidator><br />
    <asp:RegularExpressionValidator ID="regExComment2ValB" runat="server" ErrorMessage="*Title only can be alphanumeric and '.,@:?!()$#/\ characters only." ValidationGroup="Input2ValGrp" ControlToValidate="txtbxComment2Title" ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" Display="Dynamic"></asp:RegularExpressionValidator><br />
    <asp:RegularExpressionValidator ID="regExComment2ValC" runat="server" ErrorMessage="*Comment can be alphanumeric and '.,@:?!()$#/\ characters only." ValidationGroup="Input2ValGrp" ControlToValidate="txtbxComment2Comment" ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" Display="Dynamic"></asp:RegularExpressionValidator>
</div>
</asp:Content>

