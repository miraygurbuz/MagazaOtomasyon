<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="siparisVer.aspx.cs" Inherits="MagazaOtomasyon.siparisVer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>

    <html>
    <head>
        <style>
            .content {
                font-family: "Helvetica";
                max-width: 900px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                margin: auto;
                background-color: #f8f9fa;
            }
        </style>
    </head>

    <body>
        <div class="content">
            <form id="form1" runat="server">
                <asp:Label ID="Label5" runat="server" Style="font-size: large; font-weight: 700; color: #003300;" Text="Sipariş Ver"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Style="font-size: large; font-weight: 700; color: #003300;" Text="Sipariş Ver"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Style="font-weight: 700" Text="Ürün Kodu"></asp:Label>
                <br />
                <asp:TextBox ID="txturunID" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Style="font-weight: 700" Text="Miktar"></asp:Label>
                <br />
                <asp:TextBox ID="txtmiktar" runat="server"></asp:TextBox>
                <br />
                <br />
                <strong>
                <asp:Label ID="lblAd" runat="server" Text="Teslim Alacak Kişinin Adı"></asp:Label>
                </strong>
                <br />
                <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                <br />
                <br />
                <strong>
                <asp:Label ID="lblSoyad" runat="server" Text="Teslim Alacak Kişinin Soy Adı"></asp:Label>
                </strong>
                <br />
                <asp:TextBox ID="txtSoyad" runat="server"></asp:TextBox>
                <br />
                <br />
                <strong>
                <asp:Label ID="lblAdres" runat="server" Text="Teslim Adresi"></asp:Label>
                </strong>
                <br />
                <asp:TextBox ID="txtAdres" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnSiparis" runat="server" Text="Sipariş Ver" OnClick="btnSiparis_Click" />
                <br />
                <br />
                <asp:Label ID="lblSonuc" runat="server" Style="font-weight: 700; color: #336699"></asp:Label>
            </form>
        </div>
    </body>
    </html>
</asp:Content>
