<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="~/AdminPaneli/Admin.aspx.cs" Inherits="MagazaOtomasyon.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!DOCTYPE html>

    <html>
    <head>
        <title></title>
        <style>
            .secenekler {
                /* yardımcı kaynaklar: https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow https://www.w3schools.com/css/tryit.asp?filename=trycss3_box-sizing_old */
                font-family: "Helvetica";
                width: 1500px;
                height: 270px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 10px 10px 10px gray;
                text-align: center;
                margin: auto;
                margin-top: 150px;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div class="secenekler">
                <h1 class="text-center">Admin Paneli</h1>
                <p class="text-center">&nbsp;</p>
                <p>
                    <p></p>
                    <asp:ImageButton ID="KullaniciGoruntule" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/kullanici.png" OnClick="KullaniciGoruntule_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="UrunGoruntule" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/urunler.png" OnClick="UrunGoruntule_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="GelirGider" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/gelirgider.png" OnClick="GelirGider_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="SatisYap" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/satisyap.png" OnClick="SatisYap_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="TedarikEt" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/tedarik.png" OnClick="TedarikEt_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Markalar" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/marka.png" OnClick="Markalar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Kategoriler" runat="server" Height="177px" ImageUrl="~/AdminPaneli/Gorseller/kategori.png" OnClick="Kategoriler_Click" />
                </p>
            </div>
        </form>
    </body>
    </html>
</asp:Content>
