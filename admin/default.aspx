<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="admin_Default" %>

<asp:Content ID="Content0" ContentPlaceHolderID="ContentPlaceHolder0" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Admin Page:<asp:Button ID="bttnLogOut" runat="server" Text="Log Out" class="commentbttnClear" style="float:right" /></h3>
    <br />
    <font class="">Welcome back <asp:Label ID="lblusername" runat="server" Text="-username-"></asp:Label>.</font>
    <br /><br />


    <h3>Admin Account Details:</h3>
    <font class="">New Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox  ID="txtbxNewName" runat="server" ValidationGroup="accUpform-Username" class="viewComment2txtbox" style="width:256px"></asp:TextBox></font>
    <asp:RequiredFieldValidator ID="reqFldUpdateUsrnm" ControlToValidate="txtbxNewName" runat="server" ErrorMessage="*Can not be blank when updating." Display="Dynamic" ValidationGroup="accUpform-Username" ></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Username only can be alphanumeric characters only." ValidationGroup="accUpform-Username" ControlToValidate="txtbxNewName" ValidationExpression="([a-zA-Z0-9]+)" Display="Dynamic"></asp:RegularExpressionValidator>
    <br /><asp:Button ID="bttmUpdateUsername" runat="server" Text="Update Username" class="commentbttnSubmit"  ValidationGroup="accUpform-Username" /><br />
    <br /><br />

    <font class="">New email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtbxNewEmail1" runat="server" ValidationGroup="accUpform-Email" class="viewComment2txtbox" style="width:256px"></asp:TextBox></font>
    <asp:RequiredFieldValidator ID="reqFUpdateEmail1" runat="server" ErrorMessage="*Can not be blank when updating." Display="Dynamic" ValidationGroup="accUpform-Email"  ControlToValidate="txtbxNewEmail1"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regExUpdateEmail1" runat="server"  ErrorMessage="*Email must bein someone@somewhere.wht format."  ValidationGroup="accUpform-Email" ControlToValidate="txtbxNewEmail1"  Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <br />
    <font class="">Confirm new email:&nbsp;&nbsp;<asp:TextBox ID="txtbxNewEmail2" runat="server" ValidationGroup="accUpform-Email" class="viewComment2txtbox" style="width:256px"></asp:TextBox></font>
    <asp:RequiredFieldValidator ID="reqFUpdateEmail2" runat="server" ErrorMessage="*Can not be blank when updating." Display="Dynamic" ValidationGroup="accUpform-Email"  ControlToValidate="txtbxNewEmail2"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regExUpdateEmail2" runat="server"  ErrorMessage="*Email must bein someone@somewhere.wht format."  ValidationGroup="accUpform-Email" ControlToValidate="txtbxNewEmail2"  Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <asp:CompareValidator ID="compValEmail" runat="server" ErrorMessage="*Fields to not match." Display="Dynamic" ValidationGroup="accUpform-Email" ControlToCompare="txtbxNewEmail1" ControlToValidate="txtbxNewEmail2"></asp:CompareValidator>
    <br /><asp:Button ID="bttnUpdateEmail" runat="server" Text="Update Email" class="commentbttnSubmit"  ValidationGroup="accUpform-Email" /><br />
    <br /><br />

    <font class="">Old password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtbxOldPW" runat="server" ValidationGroup="accUpform-PW" class="viewComment2txtbox" style="width:256px"></asp:TextBox></font>
    <asp:RequiredFieldValidator ID="reqFValOldPW" runat="server" ErrorMessage="*Can not be blank when updating." Display="Dynamic" ValidationGroup="accUpform-PW"  ControlToValidate="txtbxOldPW"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regExOldPW" runat="server"  ErrorMessage="*Password only can be alphanumeric characters only."  ValidationGroup="accUpform-PW" ControlToValidate="txtbxOldPW"  Display="Dynamic" ValidationExpression="([a-zA-Z0-9]+)"></asp:RegularExpressionValidator>
    <br />
    <font class="">New password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtbxNewPW1" runat="server" class="viewComment2txtbox" style="width:256px"></asp:TextBox></font>
    <asp:RequiredFieldValidator ID="reqFldNewPW1" runat="server" ErrorMessage="*Can not be blank when updating." Display="Dynamic" ValidationGroup="accUpform-PW"  ControlToValidate="txtbxNewPW1"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regExNewPW1" runat="server"  ErrorMessage="*Password only can be alphanumeric characters only."  ValidationGroup="accUpform-PW" ControlToValidate="txtbxNewPW1"  Display="Dynamic" ValidationExpression="([a-zA-Z0-9]+)"></asp:RegularExpressionValidator>
    <br />
    <font class="">Confirm password:&nbsp;&nbsp;<asp:TextBox ID="txtbxNewPW2" runat="server" serverValidationGroup="accUpform-PW" class="viewComment2txtbox" style="width:256px"></asp:TextBox></font>
    <asp:RequiredFieldValidator ID="reqFldNewPW2" runat="server" ErrorMessage="*Can not be blank when updating." Display="Dynamic" ValidationGroup="accUpform-PW"  ControlToValidate="txtbxNewPW2"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regExNewPW2" runat="server"  ErrorMessage="*Password only can be alphanumeric characters only."  ValidationGroup="accUpform-PW" ControlToValidate="txtbxNewPW2"  Display="Dynamic" ValidationExpression="([a-zA-Z0-9]+)"></asp:RegularExpressionValidator>
    <asp:CompareValidator ID="compValNewPW2" runat="server" ErrorMessage="*Fields to not match." Display="Dynamic" ValidationGroup="accUpform-PW" ControlToCompare="txtbxNewPW1" ControlToValidate="txtbxNewPW2"></asp:CompareValidator>
    <br /><asp:Button ID="bttnUpdatePW" runat="server" Text="Update Password" class="commentbttnSubmit"  ValidationGroup="accUpform-PW" /><br />
    <br /><br />

    <asp:Button ID="bttnClear" runat="server" Text="Nevermind" class="commentbttnClear" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<a name="event"></a>
    <h3>Upcoming Events:</h3>
<h4>*This will be posted to Twitter from BAWS Website.</h4>
    <asp:TextBox ID="txtbxEventName" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="16" Rows="1" TextMode="SingleLine" ValidationGroup="InputValGrp" class="viewComment2txtbox" style="width:28px;display:none"></asp:TextBox><br />
    <font class="">Title:</font>
    <asp:TextBox ID="txtbxEventTitle" runat="server" CausesValidation="True" 
        ForeColor="Black" MaxLength="64" Rows="1" TextMode="SingleLine" 
        ValidationGroup="inputEventGrp" class="viewComment2txtbox" style="width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExEventValA" runat="server" 
        ErrorMessage="*Title must be alphanumeric characters." 
        ControlToValidate="txtbxEventName" 
        ValidationExpression="^([a-zA-Z0-9_-]+)$" Display="Dynamic" 
        ValidationGroup="inputEventGrp"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="regExEventValB" runat="server" 
        ErrorMessage="*Title only can be alphanumeric and '.,@:?!()$#/\ characters only." 
         ControlToValidate="txtbxEventTitle" 
        ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" 
        Display="Dynamic" ValidationGroup="inputEventGrp"></asp:RegularExpressionValidator>
    <br />
    <font class="">Post:</font>
    <asp:TextBox ID="txtbxEventEvent" runat="server" CausesValidation="True" 
        ForeColor="Black" MaxLength="140" Rows="5" TextMode="MultiLine" 
        ValidationGroup="inputEventGrp" class="viewComment2txtbox" 
        style="height:28px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regExEventValC" runat="server" 
        ErrorMessage="*Event can be alphanumeric and '.,@:?!()$#/\ characters only." 
         ControlToValidate="txtbxEventEvent" 
        ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" 
        Display="Dynamic" ValidationGroup="inputEventGrp"></asp:RegularExpressionValidator>
        <br />
    <asp:Button ID="bttnEventClear" runat="server" Text="Cancal" 
        class="commentbttnClear" ValidationGroup="inputEventGrp" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnEventSubmit" runat="server" Text="Submit" 
        class="commentbttnSubmit" ValidationGroup="inputEventGrp" /><br />
    <br />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
<a name="blog"></a>
    <h3>Post Blog:</h3>
<h4>*This will be posted to Twitter from BAWS Website.</h4>
    <asp:TextBox ID="txtbxPostBlogName" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="16" Rows="1" TextMode="SingleLine" ValidationGroup="Input2ValGrp" class="viewComment1txtbox" style="width:28px;display:none"></asp:TextBox><br />
    <font class="">Title:</font>
    <asp:TextBox ID="txtbxPostBlogTitle" runat="server" CausesValidation="True" ForeColor="Black" MaxLength="64" Rows="1" TextMode="SingleLine" ValidationGroup="Input2ValGrp" class="viewComment1txtbox" style="width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExPostBlogValA" runat="server" 
        ErrorMessage="*Title can be alphanumeric characters." 
        ValidationGroup="Input2ValGrp" ControlToValidate="txtbxPostBlogName" 
        ValidationExpression="^([a-zA-Z0-9_-]+)$" Display="Dynamic"></asp:RegularExpressionValidator><br />
    <font class="">Post:</font>
    <asp:TextBox ID="txtbxPostBlogEvent" runat="server" CausesValidation="True" 
        ForeColor="Black" MaxLength="140" Rows="5" TextMode="MultiLine" 
        ValidationGroup="Input2ValGrp" class="viewComment1txtbox" style="height:28px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regExPostBlogValB" runat="server" 
        ErrorMessage="*Title only can be alphanumeric and '.,@:?!()$#/\ characters only." 
        ValidationGroup="Input2ValGrp" ControlToValidate="txtbxPostBlogTitle" 
        ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" 
        Display="Dynamic"></asp:RegularExpressionValidator><br />
    <asp:RegularExpressionValidator ID="regExPostBlogValC" runat="server" 
        ErrorMessage="*Event can be alphanumeric and '.,@:?!()$#/\ characters only." 
        ValidationGroup="Input2ValGrp" ControlToValidate="txtbxPostBlogEvent" 
        ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" 
        Display="Dynamic"></asp:RegularExpressionValidator>
    <asp:Button ID="bttnPostBlogClear" runat="server" Text="Cancal" 
        class="commentbttnClear" ValidationGroup="Input2ValGrp" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnPostBlogSubmit" runat="server" Text="Submit" 
        class="commentbttnSubmit" ValidationGroup="Input2ValGrp" />
    <br />
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
<a name="event"></a>
    <h3>Advertisers:</h3>
<h4>Add a new one.</h4>
    <asp:ValidationSummary ID="valSumAdvert" runat="server" 
        ValidationGroup="addAdvert" /><br />
<font class="">Name:</font><br />
<asp:TextBox ID="txtbxAdvertName" runat="server" CausesValidation="True" class="viewComment2txtbox" style="display:inline;width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExAdvertName" runat="server" 
        ValidationExpression="^([a-zA-Z0-9_-]+)$" 
        ControlToValidate="txtbxAdvertName" ValidationGroup="addAdvert" 
        Display="Static" SetFocusOnError="True" 
        ErrorMessage="Username can be alphanumeric characters.">*</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="reqValAdvert" runat="server" ControlToValidate="txtbxAdvertName" 
        ValidationGroup="addAdvert" Display="Static" SetFocusOnError="True" 
        ErrorMessage="Advertiser name required.">*</asp:RequiredFieldValidator>
<br /><br />
<font class="">Start Date:</font><br />
<asp:TextBox ID="txtbxAdvertSDate" runat="server" CausesValidation="True" class="viewComment2txtbox" style="display:inline;width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExSDate" runat="server" 
        ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" 
        ControlToValidate="txtbxAdvertSDate" ValidationGroup="addAdvert" 
        Display="Static" SetFocusOnError="True" 
        ErrorMessage="Date must be MM-DD-YYY">*</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqValSDate" runat="server" 
        ControlToValidate="txtbxAdvertSDate" ValidationGroup="addAdvert" 
        Display="Static" SetFocusOnError="True" 
        ErrorMessage="Advertiser start date needed.">*</asp:RequiredFieldValidator>
<br /><br />
<font class="">End Date:</font><br />
<asp:TextBox ID="txtbxAdvertEDate" runat="server" CausesValidation="True" class="viewComment2txtbox" style="display:inline;width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExEDate" runat="server" 
        ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" 
        ControlToValidate="txtbxAdvertEDate" ValidationGroup="addAdvert" 
        Display="Static" SetFocusOnError="True" 
        ErrorMessage="Date must be MM-DD-YYY">*</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqValEDate" runat="server" 
        ControlToValidate="txtbxAdvertEDate" ValidationGroup="addAdvert" 
        Display="Static" SetFocusOnError="True" 
        ErrorMessage="Advertiser end date needed.">*</asp:RequiredFieldValidator>
<br /><br />
<font class="">Amount Paid:</font><br />
<asp:TextBox ID="txtbxAdvertPaid" runat="server" CausesValidation="True" class="viewComment2txtbox" style="display:inline;width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExAdvertAmount" runat="server" 
        ValidationExpression="^\$?[0-9]+(,[0-9]{3})*(\.[0-9]{2})?$" 
        ControlToValidate="txtbxAdvertPaid" ValidationGroup="addAdvert" 
        Display="Static" SetFocusOnError="True" 
        ErrorMessage="Amount format: DD.CC; exp: 99.95, 1095, 17.50">*</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqValPaid" runat="server" ControlToValidate="txtbxAdvertPaid" 
        ValidationGroup="addAdvert" Display="Static" SetFocusOnError="True" 
        ErrorMessage="Advertiser amount needed.">*</asp:RequiredFieldValidator>
<br /><br />
<font class="">Web Address:</font><br />
<asp:TextBox ID="txtbxAdvertURL" runat="server" CausesValidation="True" class="viewComment2txtbox" style="display:inline;width:256px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="reqValAdvertURL" runat="server"
        ValidationGroup="addAdvert"  Display="Static"
         ErrorMessage="Advertiser website needed."
         ControlToValidate="txtbxAdvertURL"  SetFocusOnError="True">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regExAdvertURL" runat="server" 
        ValidationGroup="addAdvert" Display="Static"  
        ErrorMessage="Website be http://www.website.com format." 
        ControlToValidate="txtbxAdvertURL" 
        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
    <br /><br />

<h4>Current Advertisers:</h4><br />
<asp:TextBox ID="txtbxAdvertAdmin" runat="server" CausesValidation="True" Enabled="false" class="viewComment2txtbox" style="display:inline;width:256px"></asp:TextBox><br /><br />
<font class="">Select a file to upload:</font>
<asp:FileUpload id="advertImgUpload" Text="Pick Image" runat="server" class="commentbttnClear" ></asp:FileUpload>
    <asp:RegularExpressionValidator ID="regExAdvertImage" runat="server" 
        ErrorMessage="File type can only be: png, gif, jpg/jpeg types." 
        ValidationGroup="addAdvert" ControlToValidate="advertImgUpload" 
        ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)" 
        Display="Static" SetFocusOnError="True">*</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqValImage" runat="server" ControlToValidate="advertImgUpload" 
        ValidationGroup="addAdvert" Display="Static" SetFocusOnError="True" 
        ErrorMessage="Advertiser image needed.">*</asp:RequiredFieldValidator>
        <font class="advertText">*Images should be 240 vertical by 120 Horizontal, otherwise it may look odd.</font>
<br /><br />
<asp:Button id="UploadButton" Text="Add new advertiser!" 
        OnClick="UploadButton_Click" runat="server" class="commentbttnSubmit" 
        ValidationGroup="addAdvert" ></asp:Button><br />
<asp:Label id="UploadStatusLabel" runat="server"></asp:Label><br /><br /><br /><br />

<h3>Manage Advertisers:</h3>

    <asp:Repeater ID="rptrAdvertList" runat="server" DataSourceID="sqlBAWSAdvertList">
      <ItemTemplate>
<font class="">Name:<%# DataBinder.Eval(Container.DataItem, "advert_name")%></font><br /><font class="">Start Date: <%# DataBinder.Eval(Container.DataItem, "advert_SDate", "{0: MM/dd/yyyy}")%></font><br />
<font class="">End Date:<%# DataBinder.Eval(Container.DataItem, "advert_EDate", "{0: MM/dd/yyyy}")%></font><br /><font class="">Paid:<%# DataBinder.Eval(Container.DataItem, "advert_Paid")%></font><br /><font class="">Added by:<%# DataBinder.Eval(Container.DataItem, "admin_usrnm")%></font><br /><font class="">Image:<br /><img src="<%# DataBinder.Eval(Container.DataItem, "advert_img_path")%>" height="240" width="120" alt="Advert Image." /></font><br />
<br /><br />
      </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="sqlBAWSAdvertList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bawsDB %>" 
        SelectCommand="SELECT tbl_adverts.advert_name, tbl_adverts.advert_SDate, tbl_adverts.advert_EDate, tbl_adverts.advert_Paid, tbl_adverts.advert_img_path, tbl_admins.admin_usrnm FROM tbl_admins INNER JOIN tbl_adverts ON tbl_admins.admin_id = tbl_adverts.advert_admin ORDER BY tbl_adverts.advert_SDate DESC, tbl_adverts.advert_EDate DESC"></asp:SqlDataSource>
</asp:Content>