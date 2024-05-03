using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MagazaOtomasyon.AdminPaneli
{
    public partial class gelirGider : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnectionClass.CheckConnection();
                SqlCommand turListele = new SqlCommand("SELECT * FROM gelirGiderTurTablo", SqlConnectionClass.connection);
                SqlDataReader turReader = turListele.ExecuteReader();
                while (turReader.Read())
                {
                    ListItem listTur = new ListItem();
                    listTur.Text = turReader["turAdi"].ToString();
                    listTur.Value = turReader["turID"].ToString();
                    ekleTur.Items.Add(listTur);
                }
                turReader.Close();
            }


        }
        protected void btnListele_Click(object sender, EventArgs e)
        {
            SqlConnectionClass.CheckConnection();
            SqlCommand urunListele = new SqlCommand("SELECT gelirGiderTablo.kayitID, gelirGiderTablo.tarih, gelirGiderTablo.aciklama, gelirGiderTablo.tutar, gelirGiderTurTablo.turAdi FROM gelirGiderTablo INNER JOIN gelirGiderTurTablo ON gelirGiderTablo.turID = gelirGiderTurTablo.turID", SqlConnectionClass.connection);
            SqlDataReader listelerd = urunListele.ExecuteReader();
            gelirGiderGrid.DataSource = listelerd;
            gelirGiderGrid.DataBind();
            listelerd.Close();
            SqlCommand kasaDurumu = new SqlCommand("SELECT SUM(CASE WHEN turID = 1 THEN tutar ELSE 0 END) AS toplamGelir, SUM(CASE WHEN turID = 2 THEN tutar ELSE 0 END) AS toplamGider, SUM(CASE WHEN turID = 1 THEN tutar ELSE 0 END) - SUM(CASE WHEN turID = 2 THEN tutar ELSE 0 END) AS netGelirGider FROM gelirGiderTablo;", SqlConnectionClass.connection);
            SqlDataReader kasard = kasaDurumu.ExecuteReader();
            if (kasard.HasRows)
            {
                while (kasard.Read())
                {
                    decimal toplamGelir = Convert.ToDecimal(kasard["toplamGelir"]);
                    decimal toplamGider = Convert.ToDecimal(kasard["toplamGider"]);
                    decimal netGelirGider = Convert.ToDecimal(kasard["netGelirGider"]);
                   
                    lblKasa.Text = "Toplam Gelir: " + toplamGelir.ToString() + " ₺" + "<br/>" +
                                    "Toplam Gider: " + toplamGider.ToString() + " ₺" + "<br/>" +
                                    "Net Gelir/Gider: " + netGelirGider.ToString() + " ₺" ;
                }
            }
            else
            {
                lblKasa.Text = "Veri bulunamadı.";
            }
            kasard.Close();

        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            if (ekleTur.SelectedValue != "" && txtTutar.Text != "" && txtAciklama.Text != "")
            {
                SqlCommand kayitEkle = new SqlCommand("INSERT INTO gelirGiderTablo(turID, tutar, aciklama, tarih) VALUES(@turID, @tutar, @aciklama, @tarih)", SqlConnectionClass.connection);
                kayitEkle.Parameters.AddWithValue("@turID", ekleTur.SelectedValue);
                kayitEkle.Parameters.AddWithValue("@tutar", txtTutar.Text);
                kayitEkle.Parameters.AddWithValue("@aciklama", txtAciklama.Text);
                kayitEkle.Parameters.AddWithValue("@tarih", DateTime.Now);
                SqlConnectionClass.CheckConnection();
                kayitEkle.ExecuteNonQuery();
                lblSonuc.Text = "Kayıt başarıyla eklendi";
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Lütfen tüm alanları doldurunuz.');", true);
            }
        }
    }
}




