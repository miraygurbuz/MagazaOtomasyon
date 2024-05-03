<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="urunListeleAdmin.aspx.cs" Inherits="MagazaOtomasyon.urunListeleAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>

    <head>
        <title>Ürün Listele</title>
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
                <asp:Label ID="lbUrunID" runat="server" Text="Ürün Kodu" Font-Bold="true"></asp:Label>
                <br />
                <asp:TextBox ID="txturunID" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <asp:Label ID="lblUrunAdi" runat="server" Text="Ürün Adı" Font-Bold="true"></asp:Label>
                <br />
                <asp:TextBox ID="txturunAdi" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <asp:Label ID="lblMarka" runat="server" Text="Marka" Font-Bold="true"></asp:Label>
                <br />
                <asp:DropDownList ID="markaDropDown" runat="server" Style="" Width="140px">
                    <asp:ListItem Text="Kategori Seçiniz..." Value=""></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblKategori" runat="server" Text="Kategori" Font-Bold="true"></asp:Label>
                <br />
                <asp:DropDownList ID="kategoriDropDown" runat="server" Style="" Width="140px">
                    <asp:ListItem Text="Kategori Seçiniz..." Value=""></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblStok" runat="server" Text="Stok Miktarı" Font-Bold="true"></asp:Label>
                <br />
                <asp:TextBox ID="txtstok" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <asp:Label ID="lblFiyat" runat="server" Text="Birim Fiyat" Font-Bold="true"></asp:Label>
                <br />
                <asp:TextBox ID="txtfiyat" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <asp:Label ID="lblLink" runat="server" Text="Ürün Görsel Bağlantısı" Font-Bold="true"></asp:Label>
                <br />
                <asp:TextBox ID="txtlink" runat="server" Height="16px" Width="136px"></asp:TextBox>
                <br />
                <asp:Label ID="lblAciklama" runat="server" Text="Ürün Açıklaması" Font-Bold="true"></asp:Label>
                <br />
                <asp:TextBox ID="txtaciklama" runat="server" Height="86px" Width="136px"></asp:TextBox>
                <br />
                <br />
                Ürün listelemek için, listeleme butonuna basmanız yeterlidir.<br />
                Ürün eklemek için kategori ve marka kodlarını, ürün adı, fiyat ve stok miktarını eksiksiz şekilde girmeniz gerekmektedir.<br />
                Ürünü satışa çıkarmak ya da satıştan çekmek için ürün kodunu girmeniz yeterlidir.<br />
                <p>Ürün güncellemek için ürün kodunu girmeli ve en az bir alanı doldurmanız gerekmektedir.</p>
                <br />
                <asp:Button ID="btnUrunEkle" runat="server" Text="Ürün Ekle" Width="142px" OnClick="btnUrunEkle_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <asp:Button ID="btnUrunGuncelle" runat="server" Text="Ürün Güncelle" Width="142px" OnClick="btnUrunGuncelle_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSatisaCikar" runat="server" Text="Ürünü Satışa Çıkar" Width="142px" OnClick="btnSatisaCikar_Click" />
                <br />
                <br />
                <asp:Button ID="btnUrunListele" runat="server" Text="Ürün Listele" Width="142px" OnClick="btnUrunListele_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSatistanCek" runat="server" Text="Ürünü Satıştan Çek" Width="142px" OnClick="btnSatistanCek_Click" />
                <br />
                <asp:Label ID="lblSonuc" runat="server" style="font-weight: 700; color: #336699"></asp:Label>
            </div>

            <div class="content2">
                <asp:GridView ID="urunGrid" AutoGenerateColumns="false" CssClass="grid" HeaderStyle-CssClass="gridHeader" runat="server">

                    <Columns>
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
                        <asp:TemplateField HeaderText="Marka Adı" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="markaAdi" runat="server" Text='<%# Eval("markaAdi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kategori Adı" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="katAdi" runat="server" Text='<%# Eval("kategoriAdi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Açıklama" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="aciklama" runat="server" Text='<%# Eval("urunAciklama") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Görsel Bağlantısı" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="gorselLink" runat="server" Text='<%# Eval("urunGorsel") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fiyat" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="fiyat" runat="server" Text='<%# Eval("urunFiyat")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stok Miktarı" ItemStyle-Width="80">
                            <ItemTemplate>
                                <asp:TextBox ID="urunStokMiktari" runat="server" Text='<%# Eval("urunStokMiktari") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Satışta mı?" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:TextBox ID="satistaMi" runat="server" Text='<%# Eval("urunSatistaMi") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>

            </div>
        </form>
    </body>

    </html>
</asp:Content>
