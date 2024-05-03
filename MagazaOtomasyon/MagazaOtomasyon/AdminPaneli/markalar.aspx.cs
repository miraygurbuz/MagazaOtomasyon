using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon.AdminPaneli
{
    public partial class markalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            SqlConnectionClass.CheckConnection();

            string markaAdi = txtmarkaAdi.Text;

            if (string.IsNullOrWhiteSpace(markaAdi))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Marka adı girmediniz.');", true);
                return;
            }

            SqlCommand urunEkle = new SqlCommand(
            "INSERT INTO markaTablo (markaAdi) " +
            "VALUES (@MarkaAdi)", SqlConnectionClass.connection);
            urunEkle.Parameters.AddWithValue("@MarkaAdi", markaAdi);
            urunEkle.ExecuteNonQuery();

            lblSonuc.Text = "Marka eklenmiştir.";
        }
        protected void btnMarkaGuncelle_Click(object sender, EventArgs e)
        {
            string markaAdi = txtmarkaAdi.Text;
            string markaID = txtmarkaID.Text;

            if (string.IsNullOrEmpty(markaID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Marka kodu girmediniz');", true);
                return;
            }

            if (string.IsNullOrEmpty(txtmarkaAdi.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Yeni marka adını giriniz.');", true);
                return;
            }

            SqlConnectionClass.CheckConnection();
            SqlCommand guncelle = new SqlCommand("UPDATE markaTablo SET markaAdi = @MarkaAdi WHERE markaID = @MarkaID", SqlConnectionClass.connection);
            guncelle.Parameters.AddWithValue("@MarkaID", markaID);
            guncelle.Parameters.AddWithValue("@MarkaAdi", txtmarkaAdi.Text);
            guncelle.ExecuteNonQuery();

            lblSonuc.Text = "Başarıyla güncellendi.";
        }

        protected void btnListele_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        void BindGridView()
        {
            SqlConnectionClass.CheckConnection();
            SqlCommand markaListele = new SqlCommand("SELECT * FROM markaTablo", SqlConnectionClass.connection);
            SqlDataReader reader = markaListele.ExecuteReader();
            markaGrid.DataSource = reader;
            markaGrid.DataBind();
            reader.Close();
        }
    }
}