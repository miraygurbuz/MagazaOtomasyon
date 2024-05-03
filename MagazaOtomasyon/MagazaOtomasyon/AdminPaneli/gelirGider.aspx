<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="gelirGider.aspx.cs" Inherits="MagazaOtomasyon.AdminPaneli.gelirGider" %>

<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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

            .grid {
                font-family: "Helvetica";
                max-width: 900px;
                margin: 5px 0 10px 0;
                border-collapse: collapse;
                text-align: center;
                background-color: #fff;
                margin: auto;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .gridHeader {
                text-align: center !important;
            }

        </style>
    </head>

    <body>

        <form id="form1" runat="server">
            <div class="content">
                <br />
                <asp:Label ID="Label9" runat="server" Style="font-size: x-large; color: #000000; " Text="Kayıt Ekle"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Tür" Style="font-weight: 700"></asp:Label>
                <br />
                <asp:DropDownList ID="ekleTur" runat="server" Height="22px" Width="150px">
                    <asp:ListItem Text="Kayıt Türü Seçiniz..." Value=""></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Tutar" Style="font-weight: 700"></asp:Label>
                <br />
                <asp:TextBox ID="txtTutar" runat="server" Height="22px" Width="150px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Açıklama" Style="font-weight: 700"></asp:Label>
                <br />
                <asp:TextBox ID="txtAciklama" runat="server" Height="54px" Width="150px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnEkle" runat="server" Text="Ekle" Width="150px" OnClick="btnEkle_Click" />
                <br />
                <asp:Label ID="lblSonuc" runat="server" Style="color: #336699; font-weight: 700"></asp:Label>
                <br />
                &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="Kayıt Listele" Style="font-size: x-large; color: #000000; "></asp:Label>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnListele" runat="server" Text="Listele" Width="225px" OnClick="btnListele_Click" />
                <br />
                <br />
                <asp:Label ID="lblKasa" runat="server" style="font-weight: 700; color: #336699"></asp:Label>
            </div>
            <div class="content2">
                <asp:GridView ID="gelirGiderGrid" AutoGenerateColumns="false" CssClass="grid" HeaderStyle-CssClass="gridHeader" runat="server" Width="1428px">
                    <Columns>
                        <asp:BoundField DataField="kayitID"
                            ReadOnly="true"
                            HeaderText="Kayıt Kodu" />
                        <asp:BoundField DataField="tarih"
                            ConvertEmptyStringToNull="true"
                            HeaderText="Kayıt Tarihi" />
                        <asp:BoundField DataField="aciklama"
                            ConvertEmptyStringToNull="true"
                            HeaderText="Açıklama" />
                        <asp:BoundField DataField="tutar"
                            ConvertEmptyStringToNull="true"
                            HeaderText="Tutar" />
                        <asp:BoundField DataField="turAdi"
                            ConvertEmptyStringToNull="true"
                            HeaderText="Kayıt Türü" />
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </body>
    </html>
</asp:Content>


