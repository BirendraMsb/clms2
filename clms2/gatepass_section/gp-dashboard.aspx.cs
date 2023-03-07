using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.gatepass_section
{
    public partial class gp_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUser.Text = Session["User"].ToString();
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
        }
    }
}