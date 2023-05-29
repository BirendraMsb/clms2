using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class emp_detail : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
               GvEmp.DataBind();
        }
        //protected void GvEmp_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        //{
        //   
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if (!Page.IsPostBack)
            {
            }

            BindGrid();
        }
      

        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
                 strSQL = "SELECT * FROM tbl_emp where vendor_code='" + Session["User"].ToString() + "'";
               // strSQL = "SELECT * FROM tbl_emp";
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvEmp.DataSource = dt;
                GvEmp.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

    

        protected void GvEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["EmpID"] = GvEmp.SelectedValue;
              Response.Redirect("emp_onboarding.aspx");
        }

    

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    DataRowView dr = (DataRowView)e.Row.DataItem;
            //    string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ImageData"]);
            //    (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            //    //(Image)e.Row.FindControl("image1").ImageUrl = imageUrl;
            //}
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "Application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "AllRows"));
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GvEmp.RenderControl(hw);
            Response.Write(sw.ToString());
            Response.End();
        }
    

      
       
    }
}