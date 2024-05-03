using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MagazaOtomasyon.Classes;

namespace MagazaOtomasyon
{
    //yardımcı kaynak: https://www.youtube.com/watch?v=Z4oQ8EHyB28
    public partial class kayitOl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlCommand checkUserCommand = new SqlCommand("SELECT COUNT(*) FROM kullaniciTablo WHERE kullaniciAdi = @pkad OR kullaniciMail = @pmail", SqlConnectionClass.connection);
            SqlConnectionClass.CheckConnection();
            checkUserCommand.Parameters.AddWithValue("@pkad", txtUsername.Text);
            checkUserCommand.Parameters.AddWithValue("@pmail", txtEmail.Text);
            int userCount = (int)checkUserCommand.ExecuteScalar();

            if (string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtPassword.Text) || string.IsNullOrWhiteSpace(txtUsername.Text))
            {

                hataMesaji("Lütfen tüm alanları doldurun.");
                return;
            }
            else if (userCount > 0)
            {
                hataMesaji("Kullanıcı adı veya e-posta daha önce kullanılmış.");
            }
            else
            {
                SqlCommand kayitOl = new SqlCommand("INSERT INTO kullaniciTablo(kullaniciMail, kullaniciSifre, kullaniciAdi) VALUES (@pmail, @psifre, @pkad)", SqlConnectionClass.connection);
                SqlConnectionClass.CheckConnection();
                string yeniSifre = SHA256Converter.ComputeSha256Hash(txtPassword.Text);
                kayitOl.Parameters.AddWithValue("@pmail", txtEmail.Text);
                kayitOl.Parameters.AddWithValue("@psifre", yeniSifre);
                kayitOl.Parameters.AddWithValue("@pkad", txtUsername.Text);
                kayitOl.ExecuteNonQuery();

                messagePanel.Visible = true;
            }
        }

        private void hataMesaji(string message)
        {

            errorMessageLabel.Text = message;
        }


    }
}