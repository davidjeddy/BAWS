<%@ Page Title="" Language="VB" MasterPageFile="~/masterpage.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder0" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Contact Us </h3>
    <font class="">Questions? Comments? We would love to hear from you. For more information about playing, sponsoring or supporting the Bay Area Women's Softball League feel free to call (850) 603-0110 or send us an email below. If you want to stay up-to-date on current events throughout the season, sign up for our newsletter below.
        
    </font>
    <br /><br /><br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <a name="emailform"></a>
       <h3>By Emails:</h3>
    <asp:Panel ID="pnlemailForm" runat="server">
    <font class="">I want information regarding:
    <br />
    <asp:CheckBoxList ID="chkbxlstEmailSubject" runat="server">
        <asp:ListItem Value="join">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Joining</asp:ListItem>
        <asp:ListItem value="sponsor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sponsoring</asp:ListItem>
        <asp:ListItem Value="info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;More Information</asp:ListItem>
    </asp:CheckBoxList>
    </font>

    <asp:Label ID="lblErrorEmlFrm" runat="server" Text="" Visible="False"></asp:Label><br />
    
    <font class="">Name:</font><asp:TextBox ID="txtbxemailName" runat="server" ValidationGroup="emailInfoForm" class="viewComment1txtbox" style="width:256px"></asp:TextBox>

    <asp:RegularExpressionValidator ID="regexEmlFrmName" runat="server" 
            ErrorMessage="Name can only be alphabetical characters." 
            ValidationGroup="emailInfoForm" ValidationExpression="^([1-zA-Z0-1@.\s]{1,255})$" 
            ControlToValidate="txtbxemailName" Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqFldEmlFrmName" runat="server" 
            ErrorMessage="Name is required." ValidationGroup="emailInfoForm" 
            ControlToValidate="txtbxemailName" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
    <font class="">Email:</font><asp:TextBox ID="txtbxEmail" runat="server" ValidationGroup="emailInfoForm" class="viewComment1txtbox" style="width:256px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regExUpdateEmail1" runat="server" 
        ErrorMessage="Email must bein someone@somewhere.wht format." 
        ValidationGroup="emailInfoForm" ControlToValidate="txtbxEmail"  Display="Dynamic"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="reqFldEmalAdy" runat="server" 
            ErrorMessage="Email is required." ValidationGroup="emailInfoForm" 
            ControlToValidate="txtbxEmail" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
    <font class="">Area:</font><asp:TextBox ID="txtbxemailAddy" runat="server" ValidationGroup="emailInfoForm" class="viewComment1txtbox" style="width:256px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexEmlFrmArea" runat="server" 
            ErrorMessage="Area can only be alphabetical." ValidationGroup="emailInfoForm" 
            ValidationExpression="^([1-zA-Z0-1@.\s]{1,255})$" ControlToValidate="txtbxemailAddy" 
            Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
    <br />
    <font class="">Phone:</font><asp:TextBox ID="txtbxemailPhone" runat="server" ValidationGroup="emailInfoForm" class="viewComment1txtbox" style="width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regExEmlFrmPhone" runat="server" 
            ErrorMessage="Phone is numbers only with dashes. 123-456-7890" 
            ValidationGroup="emailInfoForm" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
            ControlToValidate="txtbxemailPhone" Display="Dynamic" 
            SetFocusOnError="True">*</asp:RegularExpressionValidator>
    <br />
    <font class="">Message:</font><asp:TextBox ID="txtbxemailBody" runat="server" ValidationGroup="emailInfoForm" TextMode="MultiLine" class="viewComment1txtbox" style="width:256px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="regexEmlFrmBody" runat="server" 
            ErrorMessage="Body can be alphanumeric and '.,@:?!()$#/\ characters only." 
            ValidationGroup="emailInfoForm" ControlToValidate="txtbxemailBody" 
            ValidationExpression="^((?:[A-Za-z0-9- '.,@:?!()$#/\\\n])*&?)$" 
            Display="Dynamic" SetFocusOnError="True">*</asp:RegularExpressionValidator>
    <br />
        <asp:ValidationSummary ID="valSumEmailForm" runat="server" ValidationGroup="emailInfoForm" />
    <asp:Button ID="emailClear" runat="server" Text="Clear" class="commentbttnClear" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="emailSubmit" runat="server" ValidationGroup="emailInfoForm" Text="Submit" class="commentbttnSubmit" /><br />
    </asp:Panel>

    <asp:Panel ID="pnlemailDone" runat="server" Visible="False">
        <font class="">You request has been sent to the people in charge. You can expect a response within 5 business days. Thank you for your interest in the Tampa Bay Area Women's Softball League.</font>
    </asp:Panel>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 
    <a name="newsletter"></a>
<h3>Sign Up for our Newsletter:</h3>
    <asp:Panel ID="pnlSignUp" runat="server" Visible="true">
        First Name:&nbsp;<asp:TextBox ID="txtFirstName" runat="server" 
            ValidationGroup="signUp" class="viewComment2txtbox" style="width:256px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqFldFName" runat="server" 
            ErrorMessage="First name needed." ControlToValidate="txtFirstName" 
            ValidationGroup="signUp" Display="Dynamic" >*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regExUpdateEmail2" runat="server"  
            ErrorMessage="First name can only be alphanumeric characters."  
            ValidationGroup="signUp" ControlToValidate="txtFirstName"  Display="Dynamic" 
            ValidationExpression="([a-zA-Z0-9']+)">*</asp:RegularExpressionValidator><br />
        Last Name:&nbsp;<asp:TextBox ID="txtLastName" runat="server" 
            ValidationGroup="signUp" class="viewComment2txtbox" style="width:256px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regExUpdateEmail3" runat="server" 
            ControlToValidate="txtLastName" Display="Dynamic" 
            ErrorMessage="Last name can only be alphanumeric characters." 
            ValidationExpression="([a-zA-Z0-9']+)" ValidationGroup="signUp">*</asp:RegularExpressionValidator>
        <br />
        Company:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtOrganization" runat="server" 
            ValidationGroup="signUp" class="viewComment2txtbox" style="width:256px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regExUpdateEmail4" runat="server" 
            ControlToValidate="txtOrganization" Display="Dynamic" 
            ErrorMessage="Last name can only be alphanumeric characters." 
            ValidationExpression="([a-zA-Z0-9 '.]+)" ValidationGroup="signUp">*</asp:RegularExpressionValidator>
        <br />
        Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
            ID="txtEmail" runat="server" ValidationGroup="signUp" class="viewComment2txtbox" style="width:256px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Email address needed," ControlToValidate="txtEmail" 
            ValidationGroup="signUp" Display="Dynamic" >*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
            ErrorMessage="Email must bein someone@somewhere.wht format."  
            ValidationGroup="signUp" ControlToValidate="txtEmail"  Display="Dynamic" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        <br />
        <asp:ValidationSummary ID="valsummSignUp" runat="server" Display="Dynamic" ValidationGroup="signUp"/>
        <asp:Button ID="bttnAddClear" runat="server" class="commentbttnClear" 
            Text="Clear" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="bttnAddToList" runat="server" Text="Add me!" 
            class="commentbttnSubmit" ValidationGroup="signUp" /><br />
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </asp:Panel>
    <asp:Panel ID="pnlDone" runat="server"  Visible="false">
        <font class="">All signed up! Watch your mail for our monthly newsletter.</font>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">

</asp:Content>

