using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon
{
    public partial class mevcutUrunTdrk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txturunStokMiktari.Text = "0";
                txtTopMaliyet.Text = "0";
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            SqlConnectionClass.CheckConnection();
            int tedarikStok = Convert.ToInt32(txturunStokMiktari.Text);
            decimal toplamMaliyet = Convert.ToDecimal(txtTopMaliyet.Text);

            int tedarikUrunID;
            if (!int.TryParse(txturunID.Text, out tedarikUrunID))
            {
                lblSonuc.Text = "Geçersiz ürün kodu.";
                return;
            }

            if (!urunVarMi(tedarikUrunID))
            {
                lblSonuc.Text = "Girilen ürün kodu mevcut değil.";
                return;
            }

            if (toplamMaliyet <= 0 || tedarikStok <= 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Maliyet veya stok miktarı girmediniz.');", true);
                return;
            }

            SqlCommand urunEkle = new SqlCommand(
            "INSERT INTO tedarikTablo (tedarikUrunID, tedarikStok, toplamMaliyet, tedarikTarihi) " +
            "VALUES (@UrunID, @StokMiktari, @Maliyet, GETDATE())", SqlConnectionClass.connection);
            urunEkle.Parameters.AddWithValue("@UrunID", tedarikUrunID);
            urunEkle.Parameters.AddWithValue("@StokMiktari", tedarikStok);
            urunEkle.Parameters.AddWithValue("@Maliyet", toplamMaliyet);
            urunEkle.ExecuteNonQuery();

            lblSonuc.Text = "Ürün eklenmiştir.";
        }

        protected void btnListele_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        void BindGridView()
        {
            SqlConnectionClass.CheckConnection();
            SqlCommand tedarikListele = new SqlCommand("SELECT * FROM TedarikDetay", SqlConnectionClass.connection);
            SqlDataReader reader = tedarikListele.ExecuteReader();
            tedarikGrid.DataSource = reader;
            tedarikGrid.DataBind();
            reader.Close();
        }

        protected void geriDon_Click(object sender, EventArgs e)
        {
            Response.Redirect("tedarikEt.aspx");
        }

        private bool urunVarMi(int urunKodu)
        {
            bool urunMevcut = false;

            string sorgu = "SELECT COUNT(*) FROM urunTablo WHERE urunID = @urunKodu";

            SqlCommand komut = new SqlCommand(sorgu, SqlConnectionClass.connection);
            komut.Parameters.AddWithValue("@urunKodu", urunKodu);

            SqlConnectionClass.CheckConnection();
            int sayi = (int)komut.ExecuteScalar();

            if (sayi > 0)
            {
                urunMevcut = true;
            }
            return urunMevcut;
        }

    }
}
