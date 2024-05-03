<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneli/AdminLayout.Master" AutoEventWireup="true" CodeBehind="~/AdminPaneli/kullanicilar.aspx.cs" Inherits="MagazaOtomasyon.kullanicilar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>

    <head runat="server">
        <title>Kullanıcılar</title>
        <style>
            #form2 {
                font-family: "Helvetica";
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            #container {
                width: 100px;
                height: 100px;
                background-color: #567;
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -50px;
                margin-top: -50px;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
            }

            .datalist-header {
                text-align: center;
                margin-bottom: 20px;
            }

            .row {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .col-md-3 {
                flex: 1;
                text-align: center;
                padding: 10px 0;
            }

        </style>
    </head>

    <body>
        <form id="form2" runat="server">

            <asp:DataList ID="Kullanicilar" runat="server" DataKeyField="kullaniciID">
                <HeaderTemplate>
                    <div class="datalist-header">
                        <h2>Kullanıcılar</h2>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 text-center"><strong>Kullanıcı ID</strong></div>
                            <div class="col-md-3 text-center"><strong>Kullanıcı Adı</strong></div>
                            <div class="col-md-3 text-center"><strong>Kullanıcı E-posta Adresi</strong></div>
                            <div class="col-md-3 text-center"><strong>Şifre (SHA256 ile şifrelenmiştir) </strong></div>
                        </div>
                        <hr class="my-4" style="border-top: 2px solid #000;" />
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 text-center"><%# Eval("kullaniciID") %></div>
                            <div class="col-md-3 text-center"><%# Eval("kullaniciAdi") %></div>
                            <div class="col-md-3 text-center"><%# Eval("kullaniciMail") %></div>
                            <div class="col-md-3 text-center"><%# SifreyiGoster(Eval("kullaniciSifre").ToString()) %></div>
                        </div>
                        <hr class="my-4" style="border-top: 1px dashed #000;" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </form>
    </body>
    </html>
</asp:Content>

