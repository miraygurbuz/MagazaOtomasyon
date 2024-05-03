<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="girisYap.aspx.cs" Inherits="MagazaOtomasyon.girisYap" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Giriş Yap</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <form id="form2" runat="server">
            <div class="content">
                <h2>Giriş</h2>
                <div class="form-group">
                    <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Text=""></asp:Label>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" /><br />
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Şifre" /><br />
                    <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="button" OnClick="btnLogin_Click" />
                </div>
                <asp:Label ID="errorMessageLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </form>

    </body>
    </html>

</asp:Content>
