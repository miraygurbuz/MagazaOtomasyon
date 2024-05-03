<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="urunleriListele.aspx.cs" Inherits="MagazaOtomasyon.urunleriListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <div class="bosluk"></div>
        <style>
            .bosluk {
                width: 100%;
                height: 50px;
            }

            .filtre-paneli {
                font-family: "Helvetica";
                position: fixed;
                top: 50%;
                right: 70px;
                transform: translate(0, -50%);
                background: linear-gradient(to bottom, #ffccff 0%, #9999ff 100%);
                padding: 10px;
                border: 1px dashed #000;
                z-index: 2;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Buton css kodu https://getcssscan.com/css-buttons-examples sayfasından alınmıştır. */

            .button {
                background-color: #c2fbd7;
                border-radius: 100px;
                box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,rgba(44, 187, 99, .15) 0 1px 2px,rgba(44, 187, 99, .15) 0 2px 4px,rgba(44, 187, 99, .15) 0 4px 8px,rgba(44, 187, 99, .15) 0 8px 16px,rgba(44, 187, 99, .15) 0 16px 32px;
                color: green;
                cursor: pointer;
                display: inline-block;
                font-family: "Helvetica", Arial, sans-serif;
                padding: 7px 20px;
                text-align: center;
                text-decoration: none;
                transition: all 250ms;
                border: 0;
                font-size: 16px;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
            }

                .button:hover {
                    box-shadow: rgba(44,187,99,.35) 0 -25px 18px -14px inset,rgba(44,187,99,.25) 0 1px 2px,rgba(44,187,99,.25) 0 2px 4px,rgba(44,187,99,.25) 0 4px 8px,rgba(44,187,99,.25) 0 8px 16px,rgba(44,187,99,.25) 0 16px 32px;
                    transform: scale(1.05) rotate(-1deg);
                }

            /* Ürün listeleme CSS kodu https://codepen.io/aaronbarnard/pen/oeWvJo sayfasından alınmıştır */

            * {
                font-family: "Helvetica", Arial, sans-serif;
                padding: 0;
                margin: 0;
                position: relative;
                box-sizing: border-box;
            }

            .listing-section {
                width: 100%;
                float: left;
                padding: 1%;
            }

            .product {
                width: 300px;
                height: 410px;
                padding-bottom: 100%;
                position: relative;
                float: left;
                border-radius: 2%;
                margin-right: 2%;
                margin-bottom: 20px;
            }

                .product:hover {
                    box-shadow: 1.5px 1.5px 2.5px 3px rgba(0, 0, 0, 0.4);
                    -webkit-box-shadow: 1.5px 1.5px 2.5px 3px rgba(0, 0, 0, 0.4);
                    -moz-box-shadow: 1.5px 1.5px 2.5px 3px rgba(0, 0, 0, 0.4);
                }

            .image-box {
                width: 100%;
                overflow: hidden;
                border-radius: 2% 2% 0 0;
            }

            .images {
                width: 300px;
                height: 220px;
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;
                border-radius: 2% 2% 0 0;
                transition: all 1s ease;
                -moz-transition: all 1s ease;
                -webkit-transition: all 1s ease;
                -o-transition: all 1s ease;
                text-align: center;
            }

                .images:hover {
                    transform: scale(1.2);
                    overflow: hidden;
                    border-radius: 2%;
                }

            h1 {
                height: 100%;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            h2, h3 {
                float: left;
                font-family: "Helvetica", Arial, sans-serif;
                font-weight: 400;
                font-size: 1em;
                text-transform: uppercase;
                margin: 0.2em auto;
            }

            .item, .price {
                clear: left;
                width: 100%;
                text-align: center;
            }

            .price {
                color: Grey;
            }

            .description, label, input {
                float: left;
                clear: left;
                width: 100%;
                font-family: "Helvetica", Arial, sans-serif;
                font-weight: 300;
                font-size: 1em;
                text-align: center;
                margin: 0.2em auto;
            }

                input:focus {
                    outline-color: #fdf;
                }

            label {
                width: 60%;
            }

            .table-heading, .table-content {
                width: 75%;
                margin: 1% 12.25%;
                float: left;
                background-color: #dfd;
            }

                .table-heading h2 {
                    padding: 1%;
                    margin: 0;
                    text-align: center;
                }

            select {
                display: inline-block;
                padding: 4px 3px 5px 5px;
                width: 150px;
                outline: none;
                color: green;
                border: 1px solid #C8BFC4;
                border-radius: 4px;
                background-color: #fff;
            }
        </style>
    </head>

    <body>

        <form id="urunListeleme" runat="server">

            <div class="filtre-paneli">
                <div style="margin-bottom: 20px;">
                    <label for="kategori">Kategori:</label>
                    <asp:DropDownList ID="kategoriDropDown" class="select" runat="server" Style="width: 100%;">
                        <asp:ListItem Text="Kategori Seçiniz..." Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div style="margin-bottom: 20px;">
                    <label for="marka">Marka:</label>
                    <asp:DropDownList ID="markaDropDown" runat="server" Style="width: 100%;">
                        <asp:ListItem Text="Marka Seçiniz..." Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <asp:Button ID="filtreButton" CssClass="button" runat="server" Text="Filtreyi Uygula" OnClick="filtreButton_Click" />
                </div>
            </div>

            <h1>&nbsp;</h1>
            <h1>Ürünlerimiz</h1>

            <!-- Ürün listeleme CSS kodu https://codepen.io/aaronbarnard/pen/oeWvJo sayfasından alınmıştır -->

            <div class="listing-section">
                <asp:DataList ID="Urunler" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="product">
                            <div class="image-box">
                                <div class="images">
                                    <img src="<%# Eval("urunGorsel") %>" style="width: 300px; height: 220px;">
                                </div>
                            </div>
                            <div class="text-box">
                                <h2 class="item"><%# Eval("urunAdi") %></h2>
                                <h3 class="price"><%# Eval("urunFiyat") %> ₺</h3>
                                <h3 class="price"><%# Eval("markaAdi") %></h3>
                                <h3 class="price"><%# Eval("kategoriAdi") %></h3>
                                <h3 class="price">Sipariş için ürün kodu: <%# Eval("urunID") %></h3>
                                <asp:Button ID="urunDetayButton" CssClass="button" runat="server" Text="Detay Görüntüle" OnClick="urunDetayButton_Click" CommandName="DetayGoster" CommandArgument='<%# Eval("urunID") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </form>
    </body>
    </html>
</asp:Content>
