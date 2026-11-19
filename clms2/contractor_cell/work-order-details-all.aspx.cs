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

      

        public void gvInfo()
        {
            dbConnection();
            strSQL = "SELECT a.*,b.vendor_name,b.vendor_reg_code, b.pano,b.gstno,b.pfno,b.esicno,b.pfdoc,b.esicdoc FROM tbl_vendor_work_order a,tbl_vendor_info b  where a.vendor_reg_code=b.vendor_reg_code and a.work_worder=b.work_worder and b.status='A'";

            SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GvWod.DataSource = dt;
            GvWod.DataBind();
            if (GvWod.HeaderRow != null)
            {
                GvWod.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                string usrnm = Session["User"] != null ? Session["User"].ToString() : "Contractor Cell";
                lblUser.Text = usrnm;
            }
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if (!IsPostBack)
            {
                gvInfo();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvInfo();
        }

        protected void GvWod_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvWod.PageIndex = e.NewPageIndex;
            gvInfo();
        }

        protected void GvWod_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string[] headers = new string[] {
                    "Sl. No", "Vendor Code", "Valid From", "Valid To", "Vendor Name",
                    "Type Of Contract", "Department", "PAN No.", "GST No.", "UAN No.",
                    "ESIC No.", "Job Location"
                };

                for (int i = 0; i < e.Row.Cells.Count && i < headers.Length; i++)
                {
                    e.Row.Cells[i].Attributes["data-label"] = headers[i];
                }

                var row = (DataRowView)e.Row.DataItem;
                if (row != null && row.Row.Table.Columns.Contains("status"))
                {
                    string sts = row["status"] != null ? row["status"].ToString() : "";
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
}