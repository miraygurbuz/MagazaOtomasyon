using MagazaOtomasyon.Classes;
using System;
using System.Data.SqlClient;

namespace MagazaOtomasyon.AdminPaneli
{
    public partial class siparisler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnectionClass.CheckConnection();
                SqlCommand sipListele = new SqlCommand("SELECT * FROM Siparisler", SqlConnectionClass.connection);
                SqlDataReader reader = sipListele.ExecuteReader();
                siparisGrid.DataSource = reader;
                siparisGrid.DataBind();
                reader.Close();
            }
        }
    }
}