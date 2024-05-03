<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="MagazaOtomasyon.AdminPaneli.kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>

    <head>
        <title>Kategori Listele </title>
        <style>
            .content {
                font-family: "Helvetica";
                max-width: 1300px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                margin: auto;
                background-color: #f8f9fa;
            }

            .grid {
                font-family: "Helvetica";
                max-width: 1300px;
                margin: auto;
                border-collapse: collapse;
                text-align: center;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .gridHeader {
                text-align: center !important;
            }
        </style>
    </head>
    <body>
        <form id="form2" runat="server">
            <div class="content">
                <asp:Label ID="lblkatID" runat="server" Text="Kategori Kodu" Font-Bold="True"></asp:Label>
                <br />
                <asp:TextBox ID="txtkatID" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <asp:Label ID="KategoriAdi" runat="server" Text="Kategori Adı" Font-Bold="True"></asp:Label>
                <br />
                <asp:TextBox ID="txtkatAdi" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <br />
                Kategori listelemek için, listeleme butonuna basmanız yeterlidir.<br />
                Kategori eklemek için kategori adını girmeniz yeterlidir.<br />
                <p>Kategori adı değiştirmek için kategori kodu ve yeni kategori adını girmeniz gerekmektedir.</p>
                <br />
                <asp:Button ID="btnEkle" runat="server" Text="Kategori Ekle" Width="142px" OnClick="btnEkle_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnGuncelle" runat="server" Text="Kategori Güncelle" Width="142px" OnClick="btnGuncelle_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnListele" runat="server" Text="Kategori Listele" Width="142px" OnClick="btnListele_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
                <asp:Label ID="lblSonuc" runat="server" Style="font-weight: 700; color: #336699"></asp:Label>
            </div>

            <div class="content2">
                <asp:GridView ID="kategoriGrid" AutoGenerateColumns="false" CssClass="grid" HeaderStyle-CssClass="gridHeader" runat="server" Width="722px">
                    <Columns>
                        <asp:TemplateField HeaderText="Kategori Kodu" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="kategoriID" runat="server" Text='<%# Eval("kategoriID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kategori Adı" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="kategoriAdi" runat="server" Text='<%# Eval("kategoriAdi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </form>
    </body>
    </html>
</asp:Content>
