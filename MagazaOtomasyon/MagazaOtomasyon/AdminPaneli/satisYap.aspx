<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="satisYap.aspx.cs" Inherits="MagazaOtomasyon.AdminPaneli.satisYap" %>


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

                <asp:Label ID="Label1" runat="server" Style="font-size: large; font-weight: 700; color: #003300;" Text="El ile Satış Gir"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Style="font-weight: 700" Text="Tarih"></asp:Label>
                <br />
                <br />
                <div style="width: 450px; margin: auto;">
                    <asp:Calendar ID="tarihSec" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Width="450px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </div>
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
                <asp:Button ID="btnSatis" runat="server" Text="Satış Ekle" OnClick="btnSatis_Click" />
                <br />
                <br />
                <asp:Label ID="lblSonuc" runat="server" Style="font-weight: 700; color: #336699"></asp:Label>

            </form>
        </div>
    </body>
    </html>
</asp:Content>

