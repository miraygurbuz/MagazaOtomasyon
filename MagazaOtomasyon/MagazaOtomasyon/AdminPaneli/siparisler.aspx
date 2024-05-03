<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="siparisler.aspx.cs" Inherits="MagazaOtomasyon.AdminPaneli.siparisler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Müşteri Siparişleri</title>
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
            <div class="content2">
                <div class="gridHeader">
                    <h2>Müşteri Siparişleri</h2>
                </div>
                <asp:GridView ID="siparisGrid" AutoGenerateColumns="false" CssClass="grid" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Sipariş Kodu" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="siparisID" runat="server" Text='<%# Eval("siparisID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kullanıcı ID" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="kullaniciID" runat="server" Text='<%# Eval("kullaniciID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kullanıcı Adı" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="kullaniciAdi" runat="server" Text='<%# Eval("kullaniciAdi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ad" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="ad" runat="server" Text='<%# Eval("ad")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Soy Ad" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="soyad" runat="server" Text='<%# Eval("soyAd")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sipariş Adresi" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="adres" runat="server" Text='<%# Eval("siparisAdresi")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sipariş Ücreti" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="siparisUcret" runat="server" Text='<%# Eval("siparisUcreti") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sipariş Ürün Kodu" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="urunID" runat="server" Text='<%# Eval("siparisUrunID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sipariş Miktarı" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="siparisMiktar" runat="server" Text='<%# Eval("siparisMiktari") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tarih" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="tarih" runat="server" Text='<%# Eval("siparisTarihi")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </body>
    </html>
</asp:Content>
