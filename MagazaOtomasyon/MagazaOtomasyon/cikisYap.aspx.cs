using System;
using System.Web.Security;


namespace MagazaOtomasyon
{
    public partial class cikisYap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("girisYap.aspx");
        }
    }
}