using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class leave_status : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!this.IsPostBack)
            {
                CreateEmptyTable();
                ////   this.BindGrid();
                ////  Emp_Code();
                year1();
            
                workorder();
             
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");

        }

        protected void year1()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = currYear - 1; i < currYear + 3; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
            ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
        }

        private void workorder()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(workorder) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' and vendor_code ='" + Session["User"].ToString() + "'";
            ////  string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlWorkdOrder.DataSource = dt;
                        ddlWorkdOrder.DataTextField = "workorder";
                        ddlWorkdOrder.DataValueField = "workorder";
                        ddlWorkdOrder.DataBind();
                    }
                }
            }
            ddlWorkdOrder.Items.Insert(0, new ListItem("Select", "Select"));
        }

        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[19] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("designation",typeof(string)),
            new DataColumn("no_of_workdone",typeof(string)),
            new DataColumn("unit_of_workdone",typeof(string)),
            new DataColumn("daily_rate_of_wages",typeof(string)),
            new DataColumn("Basic",typeof(string)),
            new DataColumn("DA",typeof(string)),
            new DataColumn("overtime",typeof(string)),
            new DataColumn("other_case_payment",typeof(string)),
            new DataColumn("total",typeof(string)),
            new DataColumn("pf_deduction",typeof(string)),
            new DataColumn("esic_deduction",typeof(string)),
            new DataColumn("other_deduction",typeof(string)),
            new DataColumn("wage",typeof(string)),
            new DataColumn("bonus_per_amt",typeof(string)),
            new DataColumn("bonus_payable",typeof(string)),
            new DataColumn("signature",typeof(string)),
            new DataColumn("intial_contractor",typeof(string)),
           
            });

            //------------------------------------//

            // int dtEmpRowCount = dt_emp.Rows.Count;
            int dtEmpRowCount = 3;
            int dtEmpColCount = 2;
            DataRow dr;
            for (int i = 0; i < dtEmpRowCount; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < dtEmpColCount; j++)
                {

                    //  string MyString = dt_emp.Rows[i].ItemArray[j].ToString();

                    // dr[j] = dt_emp.Rows[i].ItemArray[j].ToString();
                    dr[1] = string.Empty;
                    dr[0] = string.Empty;
                    dr[2] = string.Empty;
                    dr[3] = string.Empty;
                    dr[4] = string.Empty;
                    dr[5] = string.Empty;
                    dr[6] = string.Empty;
                    dr[7] = string.Empty;
                    dr[8] = string.Empty;
                    dr[9] = string.Empty;
                    dr[10] = string.Empty;
                    dr[11] = string.Empty;
                    dr[12] = string.Empty;
                    dr[13] = string.Empty;
                    dr[14] = string.Empty;
                    dr[15] = string.Empty;
                    dr[16] = string.Empty;
                    dr[17] = string.Empty;
                    dr[18] = string.Empty;
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        protected void cmdProcess_Click(object sender, EventArgs e)
        {

        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void ddlWorkdOrder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}