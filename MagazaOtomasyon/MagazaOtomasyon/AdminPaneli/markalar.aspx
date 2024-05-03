<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="markalar.aspx.cs" Inherits="MagazaOtomasyon.AdminPaneli.markalar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>

    <head>
        <title> Marka Listele </title>
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
            <asp:Label ID="lbMarkaID" runat="server" Text="Marka Kodu" Font-Bold="True"></asp:Label>
            <br />
            <asp:TextBox ID="txtmarkaID" runat="server" Height="16px" Width="136px"></asp:TextBox>
            <br />
            <asp:Label ID="MarkaAdi" runat="server" Text="Marka Adı" Font-Bold="True"></asp:Label>
            <br />
            <asp:TextBox ID="txtmarkaAdi" runat="server" Height="16px" Width="136px"></asp:TextBox>
            <br />
            <br />
            Marka listelemek için, listeleme butonuna basmanız yeterlidir.<br />
            Marka eklemek için marka adını girmeniz yeterlidir.<br />
            <p>Marka adı değiştirmek için marka kodu ve yeni marka adını girmeniz gerekmektedir.</p>
            <br />
            <asp:Button ID="btnEkle" runat="server" Text="Marka Ekle" Width="142px" OnClick="btnEkle_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnMarkaGuncelle" runat="server" Text="Marka Güncelle" Width="142px" OnClick="btnMarkaGuncelle_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnListele" runat="server" Text="Marka Listele" Width="142px" OnClick="btnListele_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="lblSonuc" runat="server" style="font-weight: 700; color: #336699"></asp:Label>
        </div>

        <div class="content2">
            <asp:GridView ID="markaGrid" AutoGenerateColumns="false" CssClass="grid" HeaderStyle-CssClass="gridHeader" runat="server" Width="722px">
                <Columns>
                    <asp:TemplateField HeaderText="Marka Kodu" ItemStyle-Width="80">
                        <ItemTemplate>
                            <asp:TextBox ID="markaID" runat="server" Text='<%# Eval("markaID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marka Adı" ItemStyle-Width="100">
                        <ItemTemplate>
                            <asp:TextBox ID="markaAdi" runat="server" Text='<%# Eval("markaAdi") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>              
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
        </html>
</asp:Content>
