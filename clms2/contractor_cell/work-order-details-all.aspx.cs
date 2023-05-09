using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.contractor_cell
{
    public partial class work_order_details_all : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        //protected void GvWod_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GvWod.PageIndex = e.NewPageIndex;
        //    GvWod.DataBind();
        //}

        public void gvInfo()
        {
            dbConnection();
            strSQL = "SELECT a.*,b.vendor_name,b.vendor_reg_code, b.pano,b.gstno,b.pfno,b.esicno,b.pfdoc,b.esicdoc FROM tbl_vendor_work_order a,tbl_vendor_info b  where a.vendor_reg_code=b.vendor_reg_code";
            ////strSQL = "SELECT a.*,b.vendor_name,b.vendor_reg_code FROM tbl_vendor_work_order a, tbl_vendor_info b where a.vendor_reg_code=b.vendor_reg_code ";  // 'and b.status='A'
            //////if (txtSearch.Text == "")
            //////    strSQL = "SELECT a.*,b.vendor_name,b.vendor_reg_code FROM tbl_vendor_work_order a, tbl_vendor_info b where a.vendor_reg_code=b.vendor_reg_code ";  // 'and b.status='A'
            //////else
            //////    strSQL = "SELECT a.*,b.vendor_name,b.vendor_reg_code FROM tbl_vendor_work_order a, tbl_vendor_info b where a.vendor_reg_code=b.vendor_reg_code and work_worder = '" + txtSearch.Text + "'";


            SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GvWod.DataSource = dt;
            GvWod.DataBind();
            GvWod.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            gvInfo();

        }
        //private void GvWod_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //     string chk = Request.QueryString["vl"];

        //     if (e.Row.RowType == DataControlRowType.DataRow)
        //     {
        //         var row = (DataRowView)e.Row.DataItem;
        //         string sts = row["status"].ToString();
        //         if (sts == "N" & chk == "awo")
        //         {
        //             e.Row.BackColor = System.Drawing.Color.LightSalmon;
        //         }

        //         else
        //         {
        //         }
        //     }
        //}

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvInfo();
        }

        protected void GvWod_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvWod.PageIndex = e.NewPageIndex;
            GvWod.DataBind();
        }

        protected void GvWod_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string chk = Request.QueryString["vl"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var row = (DataRowView)e.Row.DataItem;
                string sts = row["status"].ToString();
                //if (sts == "N" && chk == "awo")
                if (sts == "N")
                {
                    e.Row.BackColor = System.Drawing.Color.LightSalmon;
                }

                else
                {
                    e.Row.BackColor = System.Drawing.Color.LightBlue;
                }
            }

        }


    }
}