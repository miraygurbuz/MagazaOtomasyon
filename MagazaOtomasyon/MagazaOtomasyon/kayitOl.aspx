<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="kayitOl.aspx.cs" Inherits="MagazaOtomasyon.kayitOl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>
    <head runat="server">
        <title>Kayıt Ol</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form id="form2" runat="server">
            <div class="content">
                <h2>Kayıt Ol</h2>
                <div class="form-group">
                    <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Text=""></asp:Label>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" /><br />
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Şifre" /><br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="E-posta" TextMode="Email" /><br />
                    <asp:Button ID="btnRegister" runat="server" Text="Kayıt Ol" CssClass="button" OnClick="btnRegister_Click" />
                </div>
                <asp:Label ID="errorMessageLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:Panel ID="messagePanel" runat="server" CssClass="success-message" Visible="false">
                    Kayıt başarıyla tamamlandı.
                </asp:Panel>
            </div>
        </form>
    </body>
    </html>
</asp:Content>
