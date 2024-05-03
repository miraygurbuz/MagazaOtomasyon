using MagazaOtomasyon.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MagazaOtomasyon
{
    public partial class siparisVer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullaniciAdi"] == null)
            {
                Response.Redirect("girisYap.aspx");
            }
        }

        protected void btnSiparis_Click(object sender, EventArgs e)
        {
            try
            {
                int urunKodu = Convert.ToInt32(txturunID.Text);
                int miktar = Convert.ToInt32(txtmiktar.Text);
                decimal birimFiyat = birimFiyatGetir(urunKodu);
                decimal toplamFiyat = miktar * birimFiyat;
                string kullaniciAdi = Session["kullaniciAdi"].ToString();
                int kullaniciID = KullaniciIDGetir(kullaniciAdi);
                string ad = txtAd.Text;
                string soyAd = txtSoyad.Text;
                string siparisAdresi = txtAdres.Text;


                SqlCommand stokKontrol = new SqlCommand("SELECT urunStokMiktari FROM urunTablo WHERE urunID = @urunKodu", SqlConnectionClass.connection);
                stokKontrol.Parameters.AddWithValue("@urunKodu", urunKodu);
                SqlConnectionClass.CheckConnection();
                int urunStok = (int)stokKontrol.ExecuteScalar();

                if (urunStok == 0)
                {
                    lblSonuc.Text = "Stok yok.";
                }

                else if (txtAd.Text == "" && txtSoyad.Text == "" && txtAdres.Text == "")
                {
                    lblSonuc.Text = "Lütfen tüm alanları doldurunuz.";
                }

                else
                {
                    siparisiVer(urunKodu, miktar, toplamFiyat, kullaniciID, ad, soyAd, siparisAdresi);
                    lblSonuc.Text = "Sipariş başarıyla verildi.";
                }
            }
            catch (Exception ex)
            {
                lblSonuc.Text = "Hata meydana geldi: " + ex.Message;
            }
        }

        private decimal birimFiyatGetir(int urunKodu)
        {

            SqlCommand fiyatSec = new SqlCommand("SELECT urunFiyat FROM urunTablo WHERE urunID = @urunKodu", SqlConnectionClass.connection);

            fiyatSec.Parameters.AddWithValue("@urunKodu", urunKodu);

            SqlConnectionClass.CheckConnection();

            decimal birimFiyat = 0;

            using (SqlDataReader reader = fiyatSec.ExecuteReader())
            {

                if (reader.Read())
                {
                    birimFiyat = Convert.ToDecimal(reader["urunFiyat"]);
                }
            }
            SqlConnectionClass.CloseConnection();
            return birimFiyat;

        }

        private void siparisiVer(int urunKodu, int miktar, decimal toplamFiyat, int kullaniciID, string ad, string soyAd, string siparisAdresi)
        {
            SqlCommand siparisiVer = new SqlCommand("INSERT INTO siparisTablo (siparisTarihi, siparisUrunID, siparisMiktari, siparisUcreti, kullaniciID, ad, soyAd, siparisAdresi) VALUES (GETDATE(), @urunKodu, @miktar, @toplamFiyat, @kullaniciID, @ad, @soyAd, @siparisAdresi)", SqlConnectionClass.connection);

            siparisiVer.Parameters.AddWithValue("@urunKodu", urunKodu);
            siparisiVer.Parameters.AddWithValue("@miktar", miktar);
            siparisiVer.Parameters.AddWithValue("@toplamFiyat", toplamFiyat);
            siparisiVer.Parameters.AddWithValue("@kullaniciID", kullaniciID);
            siparisiVer.Parameters.AddWithValue("@ad", ad);
            siparisiVer.Parameters.AddWithValue("@soyAd", soyAd);
            siparisiVer.Parameters.AddWithValue("@siparisAdresi", siparisAdresi);

            SqlConnectionClass.CheckConnection();
            siparisiVer.ExecuteNonQuery();
            SqlConnectionClass.CloseConnection();
        }

        private int KullaniciIDGetir(string kullaniciAdi)
        {
            int kullaniciID = -1;

            string query = "SELECT kullaniciID FROM kullaniciTablo WHERE kullaniciAdi = @kullaniciAdi";
            SqlCommand kullaniciIDgetir = new SqlCommand(query, SqlConnectionClass.connection);
            kullaniciIDgetir.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);

            SqlConnectionClass.CheckConnection();

            object result = kullaniciIDgetir.ExecuteScalar();

            if (result != null)
            {
                kullaniciID = Convert.ToInt32(result);
            }

            return kullaniciID;
        }
    }
}