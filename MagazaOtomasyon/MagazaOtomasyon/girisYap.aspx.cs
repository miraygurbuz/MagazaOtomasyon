using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MagazaOtomasyon.Classes;

namespace MagazaOtomasyon
{
    // yardımcı kaynak: https://www.youtube.com/watch?v=fNpMNcTbOHM
    public partial class girisYap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Timeout = 5;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnectionClass.CheckConnection();
            SqlCommand girisYap = new SqlCommand("SELECT * FROM kullaniciTablo WHERE kullaniciAdi = @pkad AND kullaniciSifre = @psifre", SqlConnectionClass.connection);
            string shaSifre = SHA256Converter.ComputeSha256Hash(txtPassword.Text);
            girisYap.Parameters.AddWithValue("@pkad", txtUsername.Text);
            girisYap.Parameters.AddWithValue("@psifre", shaSifre);

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(girisYap);
            da.Fill(dt);
            
            if(dt.Rows.Count > 0)
            {
                if (txtUsername.Text == "admin")
                {
                    Session["IsUserAdmin"] = true;
                    Session["kullaniciAdi"] = "admin";
                    Response.Redirect("~/AdminPaneli/Admin.aspx");
                }
                else
                {                   
                    Session["IsUserOnline"] = true;
                    string username = dt.Rows[0]["kullaniciAdi"].ToString();
                    Session["kullaniciAdi"] = username;
                    Response.Redirect("urunleriListele.aspx");
                }
            }
            else
            {
                hataMesaji("Kullanıcı adı veya şifre hatalı.");
            }

        }

        private void hataMesaji(string message)
        {
            errorMessageLabel.Text = message;
        }
    }
}