using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MagazaOtomasyon
{
    public partial class AdminLayout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IsUserAdmin"] == null || !(Convert.ToBoolean(Session["IsUserAdmin"])))
                {
                    string script = "alert('Bu sayfaya erişiminiz yoktur.'); window.location = '../urunleriListele.aspx';";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                }
            }
        }
    }
}