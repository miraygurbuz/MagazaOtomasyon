using MagazaOtomasyon.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MagazaOtomasyon
{
    public partial class urunListeleAdmin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnectionClass.CheckConnection();
                SqlCommand kategoriListele = new SqlCommand("SELECT * FROM kategoriTablo", SqlConnectionClass.connection);
                SqlDataReader katReader = kategoriListele.ExecuteReader();
                while (katReader.Read())
                {
                    ListItem listKategori = new ListItem();
                    listKategori.Text = katReader["kategoriAdi"].ToString();
                    listKategori.Value = katReader["kategoriID"].ToString();

                    kategoriDropDown.Items.Add(listKategori);
                }
                katReader.Close();

                SqlCommand markaListele = new SqlCommand("SELECT * FROM markaTablo", SqlConnectionClass.connection);
                SqlDataReader markReader = markaListele.ExecuteReader();
                while (markReader.Read())
                {
                    ListItem listMarka = new ListItem();
                    listMarka.Text = markReader["markaAdi"].ToString();
                    listMarka.Value = markReader["markaID"].ToString();

                    markaDropDown.Items.Add(listMarka);
                }
                markReader.Close();
            }
        }

        protected void btnUrunListele_Click(object sender, EventArgs e)
        {
            BindGridView();

        }

        void BindGridView()
        {
            SqlConnectionClass.CheckConnection();
            SqlCommand urunListele = new SqlCommand("SELECT * FROM UrunDetay", SqlConnectionClass.connection);
            SqlDataReader reader = urunListele.ExecuteReader();
            urunGrid.DataSource = reader;
            urunGrid.DataBind();
            reader.Close();
        }

        protected void btnUrunEkle_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnectionClass.CheckConnection();

                string kategoriID = kategoriDropDown.SelectedValue;
                string markaID = markaDropDown.SelectedValue;

                if (string.IsNullOrWhiteSpace(markaID) || string.IsNullOrWhiteSpace(kategoriID))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Lütfen kategori ve marka seçiniz.');", true);
                    return;
                }

                SqlCommand markaSec = new SqlCommand("SELECT markaID FROM markaTablo WHERE markaID = @markaID", SqlConnectionClass.connection);
                markaSec.Parameters.AddWithValue("@markaID", markaID);
                SqlDataReader markReader = markaSec.ExecuteReader();
                int urunMarkaID = 0;

                if (markReader.Read())
                {
                    urunMarkaID = Convert.ToInt32(markReader["markaID"]);
                }
                else
                {
                    markReader.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Seçilen marka bulunamadı.');", true);
                    return;
                }
                markReader.Close();

                SqlCommand kategoriSec = new SqlCommand("SELECT kategoriID FROM kategoriTablo WHERE kategoriID = @kategoriID", SqlConnectionClass.connection);
                kategoriSec.Parameters.AddWithValue("@kategoriID", kategoriID);
                SqlDataReader kategoriReader = kategoriSec.ExecuteReader();
                int urunKategoriID = 0;

                if (kategoriReader.Read())
                {
                    urunKategoriID = Convert.ToInt32(kategoriReader["kategoriID"]);
                }
                else
                {
                    kategoriReader.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Seçilen kategori bulunamadı.');", true);
                    return;
                }
                kategoriReader.Close();


                if (urunKategoriID == 0 || urunMarkaID == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Lütfen kategori ve marka seçiniz.');", true);
                    return;
                }

                int urunStokMiktari = Convert.ToInt32(txtstok.Text);
                decimal urunFiyat = Convert.ToDecimal(txtfiyat.Text);
                string urunAdi = txturunAdi.Text;
                string urunGorsel = txtlink.Text;
                string urunAciklama = txtaciklama.Text;

                if (string.IsNullOrWhiteSpace(urunAdi) || urunFiyat <= 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ürün adı veya fiyat girmediniz.');", true);
                    return;
                }

                if (urunStokMiktari <= 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Stok miktarı girilmeli ve sıfır değerinden büyük olmalı.');", true);
                    return;
                }

                SqlCommand urunEkle = new SqlCommand(
                "INSERT INTO urunTablo (urunMarkaID, urunKategoriID, urunAdi, urunStokMiktari, urunFiyat, urunGorsel, urunAciklama) " +
                "VALUES (@MarkaID, @KategoriID, @UrunAdi, @StokMiktari, @Fiyat, @Gorsel, @Aciklama)", SqlConnectionClass.connection);
                urunEkle.Parameters.AddWithValue("@MarkaID", urunMarkaID);
                urunEkle.Parameters.AddWithValue("@KategoriID", urunKategoriID);
                urunEkle.Parameters.AddWithValue("@UrunAdi", urunAdi);
                urunEkle.Parameters.AddWithValue("@StokMiktari", urunStokMiktari);
                urunEkle.Parameters.AddWithValue("@Fiyat", urunFiyat);
                urunEkle.Parameters.AddWithValue("@Gorsel", urunGorsel);
                urunEkle.Parameters.AddWithValue("@Aciklama", urunAciklama);
                urunEkle.ExecuteNonQuery();

                lblSonuc.Text = "Ürün eklenmiştir.";
            }
            catch (Exception hata)
            {
                lblSonuc.Text = "Hata meydana geldi." + hata.Message;
            }
        }

        protected void btnSatisaCikar_Click(object sender, EventArgs e)
        {
            try
            {
                int urunID = Convert.ToInt32(txturunID.Text);

                urunSatisDurumuGuncelle(urunID, true);
            }
            catch (Exception hata)
            {
                lblSonuc.Text = "Hata meydana geldi." + hata.Message;
            }
        }

        protected void btnSatistanCek_Click(object sender, EventArgs e)
        {
            try
            {
                int urunID = Convert.ToInt32(txturunID.Text);

                urunSatisDurumuGuncelle(urunID, false);
            }
            catch (Exception hata)
            {
                lblSonuc.Text = "Hata meydana geldi." + hata.Message;
            }
        }

        protected void btnUrunGuncelle_Click(object sender, EventArgs e)
        {
            string urunID = txturunID.Text;

            if (string.IsNullOrEmpty(urunID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ürün kodu girmediniz');", true);
                return;
            }

            SqlConnectionClass.CheckConnection();
            SqlCommand command = new SqlCommand("SELECT * FROM urunTablo WHERE urunID = @UrunID", SqlConnectionClass.connection);
            command.Parameters.AddWithValue("@UrunID", urunID);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                string urunKategoriID = reader["urunKategoriID"].ToString();
                string marka = reader["urunMarkaID"].ToString();
                string aciklama = reader["urunAciklama"].ToString();
                string urunGorsel = reader["urunGorsel"].ToString();
                string urunAdi = reader["urunAdi"].ToString();
                int urunStokMiktari = Convert.ToInt32(reader["urunStokMiktari"]);
                decimal urunFiyat = Convert.ToDecimal(reader["urunFiyat"]);
                reader.Close();

                string updateQuery = @"UPDATE urunTablo SET ";

                SqlCommand updateCommand = new SqlCommand(updateQuery, SqlConnectionClass.connection);

                List<string> updatedColumns = new List<string>();

                if (!string.IsNullOrEmpty(txturunAdi.Text) && txturunAdi.Text != urunAdi)
                {
                    updateQuery += "urunAdi = @UrunAdi, ";
                    updateCommand.Parameters.AddWithValue("@UrunAdi", txturunAdi.Text);
                    updatedColumns.Add("Ürün Adı");
                }

                if (kategoriDropDown.SelectedIndex > 0 && kategoriDropDown.SelectedValue.ToString() != urunKategoriID)
                {
                    updateQuery += "urunKategoriID = @KategoriID, ";
                    updateCommand.Parameters.AddWithValue("@KategoriID", kategoriDropDown.SelectedValue.ToString());
                    updatedColumns.Add("Kategori");
                }

                if (markaDropDown.SelectedIndex > 0 && markaDropDown.SelectedValue.ToString() != marka)
                {
                    updateQuery += "urunMarkaID = @MarkaID, ";
                    updateCommand.Parameters.AddWithValue("@MarkaID", markaDropDown.SelectedValue.ToString());
                    updatedColumns.Add("Marka");
                }

                if (!string.IsNullOrEmpty(txtaciklama.Text) && txtaciklama.Text != aciklama)
                {
                    updateQuery += "urunAciklama = @Aciklama, ";
                    updateCommand.Parameters.AddWithValue("@Aciklama", txtaciklama.Text);
                    updatedColumns.Add("Açıklama");
                }

                if (!string.IsNullOrEmpty(txtlink.Text) && txtlink.Text != urunGorsel)
                {
                    updateQuery += "urunGorsel = @Gorsel, ";
                    updateCommand.Parameters.AddWithValue("@Gorsel", txtlink.Text);
                    updatedColumns.Add("Görsel");
                }

                if (!string.IsNullOrEmpty(txtstok.Text) && Convert.ToInt32(txtstok.Text) != urunStokMiktari)
                {
                    updateQuery += "urunStokMiktari = @StokMiktari, ";
                    updateCommand.Parameters.AddWithValue("@StokMiktari", Convert.ToInt32(txtstok.Text));
                    updatedColumns.Add("Stok Miktarı");
                }

                if (!string.IsNullOrEmpty(txtfiyat.Text) && Convert.ToDecimal(txtfiyat.Text) != urunFiyat)
                {
                    updateQuery += "urunFiyat = @Fiyat, ";
                    updateCommand.Parameters.AddWithValue("@Fiyat", Convert.ToDecimal(txtfiyat.Text));
                    updatedColumns.Add("Fiyat");
                }

                updateQuery = updateQuery.TrimEnd(',', ' ');
                updateQuery += " WHERE urunID = @UrunID";

                updateCommand.CommandText = updateQuery;
                updateCommand.Parameters.AddWithValue("@UrunID", urunID);

                int rowsAffected = updateCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblSonuc.Text = "Ürün bilgisi başarıyla güncellendi. Değiştirilen alanlar: " + string.Join(", ", updatedColumns);
                }
                else
                {
                    lblSonuc.Text = "Ürün güncellenirken bir hata oluştu.";
                }
            }
            else
            {
                lblSonuc.Text = "Ürün bulunamadı.";
            }
            reader.Close();
        }

        private void urunSatisDurumuGuncelle(int urunID, bool satistaMi)
        {
            string query = "UPDATE urunTablo SET urunSatistaMi = @SatistaMi WHERE urunID = @UrunID";

            SqlCommand satistaMiGuncelle = new SqlCommand(query, SqlConnectionClass.connection);

            satistaMiGuncelle.Parameters.AddWithValue("@SatistaMi", satistaMi);
            satistaMiGuncelle.Parameters.AddWithValue("@UrunID", urunID);

            int rowsAffected = satistaMiGuncelle.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                lblSonuc.Text = "Ürün durumu güncellendi.";
            }
            else
            {
                lblSonuc.Text = "Ürün bulunamadı veya güncellenemedi.";
            }
        }
    }
}

