using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon.AdminPaneli
{
    public partial class satisYap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSatis_Click(object sender, EventArgs e)
        {
            try
            {
                if (tarihSec.SelectedDate == null || tarihSec.SelectedDate < new DateTime(1753, 1, 1) || tarihSec.SelectedDate > new DateTime(9999, 12, 31))
                {
                    lblSonuc.Text = "Tarih seçmelisiniz.";
                    return;
                }

                DateTime tarih = tarihSec.SelectedDate;

                int urunKodu = Convert.ToInt32(txturunID.Text);
                int miktar = Convert.ToInt32(txtmiktar.Text);
                decimal birimFiyat = birimFiyatGetir(urunKodu);
                decimal toplamFiyat = miktar * birimFiyat;
                try
                {
                    SqlCommand stokKontrol = new SqlCommand("SELECT urunStokMiktari FROM urunTablo WHERE urunID = @urunKodu", SqlConnectionClass.connection);
                    stokKontrol.Parameters.AddWithValue("@urunKodu", urunKodu);
                    SqlConnectionClass.CheckConnection();
                    int urunStok = (int)stokKontrol.ExecuteScalar();

                    if (urunStok == 0 || miktar > urunStok)
                    {
                        lblSonuc.Text = "Stok yok.";
                    }
                    else if (txturunID.Text == "" && txtmiktar.Text == "")
                    {
                        lblSonuc.Text = "Ürün kodu ya da miktar girmediniz";
                    }
                    else
                    {
                        satisEkle(tarih, urunKodu, miktar, toplamFiyat);
                        lblSonuc.Text = "Satış başarıyla eklendi.";
                    }
                }
                catch (Exception hata)
                {
                    lblSonuc.Text = "Hata meydana geldi: " + hata.Message;
                }
            }
            catch (Exception hata)
            {
                lblSonuc.Text = "Hata meydana geldi: " + hata.Message;
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

        private void satisEkle(DateTime tarih, int urunKodu, int miktar, decimal toplamFiyat)
        {

            SqlCommand satisEkle = new SqlCommand("INSERT INTO satisTablo (satisTarihi, satisUrunID, satisMiktari, toplamFiyat) VALUES (@tarih, @urunKodu, @miktar, @toplamFiyat)", SqlConnectionClass.connection);

            satisEkle.Parameters.AddWithValue("@tarih", tarih);
            satisEkle.Parameters.AddWithValue("@urunKodu", urunKodu);
            satisEkle.Parameters.AddWithValue("@miktar", miktar);
            satisEkle.Parameters.AddWithValue("@toplamFiyat", toplamFiyat);

            SqlConnectionClass.CheckConnection();
            satisEkle.ExecuteNonQuery();
            SqlConnectionClass.CloseConnection();
        }
    }
}

