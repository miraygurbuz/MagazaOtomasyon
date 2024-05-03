<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="tedarikEt.aspx.cs" Inherits="MagazaOtomasyon.AdminPaneli.tedarikEt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!DOCTYPE html>

    <html>

    <head>
        <title>Tedarik İşlemleri</title>
    </head>
    <body>
        <style>
            .content {
                font-family: "Helvetica";
                max-width: 400px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                margin: auto;
                margin-top: 20vh;
            }

            h2 {
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .auto-style1 {
                color: #336699;
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

        <form id="form1" runat="server">
            <div class="content">
                <h2>Tedarik İşlemleri</h2>
                <p>&nbsp;</p>
                <asp:Button ID="stokEkle" runat="server" Text="Mevcut Ürün Stoğu Ekle" Width="252px" OnClick="stokEkle_Click" />
                <br />
                <br />
                <asp:Button ID="listeleTdrk" runat="server" Text="Tedarik Listele" Width="252px" OnClick="listeleTdrk_Click" />
                <br />
                <br />
                <strong>Tedarik Kodu<br />
                    <asp:TextBox ID="txtTedarikID" runat="server"></asp:TextBox>
                    <br />
                    <br />
                </strong>
                <asp:Button ID="btnSil" runat="server" OnClick="btnSil_Click" Text="Tedarik Kaydı Sil" Width="252px" />
                <strong>
                    <br />
                    <asp:Label ID="lblSonuc" runat="server" CssClass="auto-style1"></asp:Label>
                </strong>
                <br />
            </div>
            <div class="content2">
                <asp:GridView ID="tedarikGrid" AutoGenerateColumns="false" CssClass="grid" HeaderStyle-CssClass="gridHeader" runat="server" Width="1573px">
                    <Columns>
                        <asp:TemplateField HeaderText="Tedarik Kodu" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="tedarikID" runat="server" Text='<%# Eval("tedarikID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ürün Kodu" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="urunID" runat="server" Text='<%# Eval("urunID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ürün Adı" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="urunAdi" runat="server" Text='<%# Eval("urunAdi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eklenen Stok Miktarı" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="eklenenStokMiktari" runat="server" Text='<%# Eval("tedarikStok") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tedarik Tarihi" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="tarih" runat="server" Text='<%# Eval("tedarikTarihi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </form>

    </body>
    </html>

</asp:Content>
