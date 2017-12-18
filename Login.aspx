<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder0" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h3>Login</h3>
    <font class="blogPosting">
    Username:<asp:TextBox ID="txtbxUsername" runat="server" MaxLength="16"></asp:TextBox>
    <br />
    Password:&nbsp;<asp:TextBox ID="txtbxPassword" runat="server"  MaxLength="16" TextMode="Password"></asp:TextBox>
    </font>
    <asp:Button ID="bttnEnter" runat="server" Text="Enter" class="commentbttnSubmit" /><br />
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
<a href="getlogin.aspx" target="_self" class="bodylink">I forgot my password!</a>

    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

