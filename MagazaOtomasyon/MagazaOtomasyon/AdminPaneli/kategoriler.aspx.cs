using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon.AdminPaneli
{
    public partial class kategoriler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            SqlConnectionClass.CheckConnection();

            string kategoriAdi = txtkatAdi.Text;

            if (string.IsNullOrWhiteSpace(kategoriAdi))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Kategori adı girmediniz.');", true);
                return;
            }

            SqlCommand urunEkle = new SqlCommand(
            "INSERT INTO kategoriTablo (kategoriAdi) " +
            "VALUES (@KategoriAdi)", SqlConnectionClass.connection);
            urunEkle.Parameters.AddWithValue("@KategoriAdi", kategoriAdi);
            urunEkle.ExecuteNonQuery();

            lblSonuc.Text = "Kategori eklenmiştir.";
        }
        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            string kategoriAdi = txtkatAdi.Text;
            string kategoriID = txtkatID.Text;

            if (string.IsNullOrEmpty(kategoriID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Kategori kodu girmediniz');", true);
                return;
            }

            if (string.IsNullOrEmpty(txtkatAdi.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Yeni kategori adını giriniz.');", true);
                return;
            }

            SqlConnectionClass.CheckConnection();
            SqlCommand guncelle = new SqlCommand("UPDATE kategoriTablo SET kategoriAdi = @KategoriAdi WHERE kategoriID = @KategoriID", SqlConnectionClass.connection);
            guncelle.Parameters.AddWithValue("@KategoriID", kategoriID);
            guncelle.Parameters.AddWithValue("@KategoriAdi", kategoriAdi);
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
            SqlCommand markaListele = new SqlCommand("SELECT * FROM kategoriTablo", SqlConnectionClass.connection);
            SqlDataReader reader = markaListele.ExecuteReader();
            kategoriGrid.DataSource = reader;
            kategoriGrid.DataBind();
            reader.Close();
        }
    }
}