<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="getlogin.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder0" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h3>Login</h3>
    <font class="blogPosting">

<asp:Panel ID="pnlGetLogInForm" runat="server">
Forget Your log in information? We can email it to you!<br /><br />
    Enter your email and we will send you your log in information:<br />
    <br />
    <asp:TextBox ID="txtbxEmail" runat="server" ValidationGroup="valGrpGetLogin"></asp:TextBox>
    <br />
    <asp:RegularExpressionValidator ID="regExEmail" runat="server" 
        ErrorMessage="*Address muset be in someone@somewhere.wht format." 
        Display="Dynamic" ControlToValidate="txtbxEmail" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
<br />
    <asp:Button ID="bttnSubmit" runat="server" Text="Get My Log in!" ValidationGroup="valGrpGetLogin" class="commentbttnSubmit" />
    <br />
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <br />
</asp:Panel>

<asp:Panel ID="pnlGetLogInDone" runat="server" Visible="False">
    <font class="">Your log-in information has been sent. PLEASE remember to change yout password after login!</font><br /><br />
</asp:Panel>


</font>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

