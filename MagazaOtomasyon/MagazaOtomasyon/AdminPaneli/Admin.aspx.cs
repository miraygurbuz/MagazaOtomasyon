using System;
using System.Web.UI;

namespace MagazaOtomasyon
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UrunGoruntule_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("urunListeleAdmin.aspx");
        }

        protected void KullaniciGoruntule_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("kullanicilar.aspx");
        }

        protected void GelirGider_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("gelirGider.aspx");
        }

        protected void SatisYap_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("satisYap.aspx");
        }

        protected void TedarikEt_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("tedarikEt.aspx");
        }

        protected void Markalar_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("markalar.aspx");
        }

        protected void Kategoriler_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("kategoriler.aspx");
        }
    }
}