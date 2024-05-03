using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon
{
    public partial class kullanicilar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnectionClass.CheckConnection();
                SqlCommand kullaniciListele = new SqlCommand("SELECT * FROM kullaniciTablo", SqlConnectionClass.connection);
                SqlDataReader reader = kullaniciListele.ExecuteReader();
                Kullanicilar.DataSource = reader;
                Kullanicilar.DataBind();
                reader.Close();
            }

        }
        protected string SifreyiGoster(string sifre)
        {
            return sifre.Substring(0, 3) + new string('*', 5);
        }

    }
}