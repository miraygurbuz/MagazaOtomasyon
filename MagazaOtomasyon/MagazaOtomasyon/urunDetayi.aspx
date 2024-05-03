<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="urunDetayi.aspx.cs" Inherits="MagazaOtomasyon.urunDetayi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Ürün Detayı</title>
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
        </style>
        <form id="form2" runat="server">
            <div class="content">
                <asp:DataList ID="Siparisler" runat="server">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <section>
                                <div>
                                    <div class="text-center">
                                        <img src="<%# Eval("urunGorsel") %>" style="width: 300px; height: 300px;" alt="" class="navbar-header">
                                        <br />
                                    </div>

                                    <br />
                                    <br />
                                    <h4>
                                        <strong><%# Eval("urunAdi") %> </strong>
                                    </h4>
                                    <p>
                                        <strong>Açıklama:<br />
                                        </strong><%# Eval("urunAciklama") %>
                                    </p>
                                    <div>
                                        <span><strong>Kategori: </strong><%# Eval("kategoriAdi") %></span>
                                        <div>
                                            <span><strong>Marka: </strong><%# Eval("markaAdi") %></span>
                                        </div>
                                    </div>
                                    <div><strong>Fiyat : </strong><span><%# Eval("urunFiyat") %> ₺</span></div>
                                </div>
                        </div>
                        </section>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </form>
    </body>
    </html>
</asp:Content>
