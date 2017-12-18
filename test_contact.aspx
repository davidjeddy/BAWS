<%@ Page Title="" Language="VB" MasterPageFile="~/masterpage.master" AutoEventWireup="false" CodeFile="test_contact.aspx.vb" Inherits="test_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder0" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h3>Contact Us <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label></h3>
    <font class="">Questions? Comment. BAWS would love to hear from you, after all, the League is for you!
        
    </font>
    <br /><br /><br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <a name="emailform"></a>
       <h3>By Emails:</h3>
    <asp:Panel ID="pnlemailForm" runat="server">
    <font class="">I want information regarding:</font><br />
    <font class="">Joining&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><asp:CheckBox ID="chkbxjoining" runat="server" /><br />
    <font class="">Sponsoring&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><asp:CheckBox ID="chkbxsponsor" runat="server" /><br />
    <font class="">More Information&nbsp;&nbsp;</font><asp:CheckBox ID="chkbxmoreInfo" runat="server" /><br />
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>