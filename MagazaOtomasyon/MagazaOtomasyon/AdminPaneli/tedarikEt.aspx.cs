using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon.AdminPaneli
{
    public partial class tedarikEt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void stokEkle_Click(object sender, EventArgs e)
        {
            Response.Redirect("mevcutUrunTdrk.aspx");
        }

        protected void listeleTdrk_Click(object sender, EventArgs e)
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
        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                int secilenTedarikID;
                if (!int.TryParse(txtTedarikID.Text, out secilenTedarikID))
                {
                    lblSonuc.Text = "Lütfen geçerli bir tedarik kodu girin.";
                    return;
                }

                SqlConnectionClass.CheckConnection();
                SqlCommand tedarikSil = new SqlCommand("DELETE FROM tedarikTablo WHERE tedarikID = @secilenTedarikID", SqlConnectionClass.connection);
                tedarikSil.Parameters.AddWithValue("@secilenTedarikID", secilenTedarikID);
                int affectedRows = tedarikSil.ExecuteNonQuery();

                if (affectedRows > 0)
                {
                    lblSonuc.Text = "Tedarik kaydı silindi.";
                }
                else
                {
                    lblSonuc.Text = "Silme işlemi gerçekleştirilemedi veya belirtilen tedarik kaydı bulunamadı.";
                }
            }
            catch (Exception ex)
            {
                lblSonuc.Text = "Hata meydana geldi: " + ex.Message;
            }
        }

    }
}