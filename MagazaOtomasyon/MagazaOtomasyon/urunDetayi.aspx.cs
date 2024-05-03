using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;


namespace MagazaOtomasyon
{
    public partial class urunDetayi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["urunID"] != null)
                {
                    int urunID = Convert.ToInt32(Request.QueryString["urunID"]);
                    urunDetayiGoster(urunID);
                }
            }
        }

        private void urunDetayiGoster(int urunID)
        {
            string sorgu = "SELECT * FROM UrunDetay WHERE urunID = @urunID";
            SqlConnectionClass.CheckConnection();
            SqlCommand komut = new SqlCommand(sorgu, SqlConnectionClass.connection);

            komut.Parameters.AddWithValue("@urunID", urunID);
            SqlConnectionClass.CheckConnection();
            SqlDataReader reader = komut.ExecuteReader();
            if (reader.HasRows)
            {
                Siparisler.DataSource = reader;
                Siparisler.DataBind();
            }
            reader.Close();
        }
    }
}