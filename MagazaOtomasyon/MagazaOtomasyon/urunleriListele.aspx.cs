using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MagazaOtomasyon.Classes;

namespace MagazaOtomasyon
{
    public partial class urunleriListele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnectionClass.CheckConnection();
                SqlCommand urunListele = new SqlCommand("SELECT * FROM UrunDetay WHERE urunSatistaMi = @pcon", SqlConnectionClass.connection);
                urunListele.Parameters.AddWithValue("@pcon", true);
                SqlDataReader reader = urunListele.ExecuteReader();
                Urunler.DataSource = reader;
                Urunler.DataBind();
                reader.Close();

                SqlCommand kategoriListele = new SqlCommand("SELECT * FROM kategoriTablo", SqlConnectionClass.connection);
                kategoriListele.ExecuteNonQuery();
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
                markaListele.ExecuteNonQuery();
                SqlDataReader markReader = markaListele.ExecuteReader();
                while (markReader.Read())
                {
                    ListItem listMarka = new ListItem();
                    listMarka.Text = markReader["markaAdi"].ToString();
                    listMarka.Value = markReader["markaID"].ToString();

                    markaDropDown.Items.Add(listMarka);
                }

                SqlConnectionClass.CloseConnection();
                markReader.Close();
            }
        }
        protected void Filtrele()
        {
            string kategoriID = kategoriDropDown.SelectedValue;
            string markaID = markaDropDown.SelectedValue;

            SqlConnectionClass.CheckConnection();
            SqlCommand urunListele = new SqlCommand("SELECT * FROM UrunDetay WHERE urunSatistaMi = @pcon", SqlConnectionClass.connection);
            urunListele.Parameters.AddWithValue("@pcon", true);

            if (string.IsNullOrEmpty(kategoriID) && string.IsNullOrEmpty(markaID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Lütfen kategori ve marka seçiniz.');", true);
            }
            else
            {
                if (!string.IsNullOrEmpty(kategoriID))
                {
                    urunListele.CommandText += " AND urunKategoriID = @kategoriID";
                    urunListele.Parameters.AddWithValue("@kategoriID", kategoriID);
                }

                if (!string.IsNullOrEmpty(markaID))
                {
                    urunListele.CommandText += " AND urunMarkaID = @markaID";
                    urunListele.Parameters.AddWithValue("@markaID", markaID);
                }

                SqlDataReader reader = urunListele.ExecuteReader();
                Urunler.DataSource = reader;
                Urunler.DataBind();
                reader.Close();
                SqlConnectionClass.CloseConnection();
            }
        }

        protected void filtreButton_Click(object sender, EventArgs e)
        {
            Filtrele();
        }

        protected void urunDetayButton_Click(object sender, EventArgs e)
        {
            Button urunDetayButton = (Button)sender;
            if (urunDetayButton.CommandName == "DetayGoster")
            {         
                int urunID = Convert.ToInt32(urunDetayButton.CommandArgument);
                Response.Redirect("urunDetayi.aspx?urunID=" + urunID);
            }
        }
    }
}

