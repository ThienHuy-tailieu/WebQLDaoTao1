<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebQLDaoTao.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="container">
        <h2>Login form</h2>
        <div class="form-group">
            <label for="email">Username:</label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="pagination-ys"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="pagination-ys"></asp:TextBox>
        </div>
        <asp:Button ID="btLogin" runat="server" Text="Login" CssClass="btn btn-default" OnClick="btLogin_Click" />
        <br />

        <br />
        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="text-danger"></asp:Label>
    </div>
</asp:Content>
