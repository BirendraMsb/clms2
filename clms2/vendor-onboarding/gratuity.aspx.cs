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
    public partial class gratuity : System.Web.UI.Page
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
                ///year();
                workorder();
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");

        }

        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[10] { new DataColumn("id", typeof(string)),
            new DataColumn("work_order",typeof(string)),
            new DataColumn("emp_code",typeof(string)),
            new DataColumn("employee_name",typeof(string)),
            new DataColumn("department",typeof(string)),
            new DataColumn("date_of_joining",typeof(string)),
            new DataColumn("last_working_day",typeof(string)),
            new DataColumn("year_of_service",typeof(string)),
            new DataColumn("last_month_salary",typeof(string)),
            new DataColumn("pay_of_gratuity",typeof(string)),
                    
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
                    dr[0] = string.Empty;
                    dr[1] = string.Empty;
                    dr[2] = string.Empty;
                    dr[3] = string.Empty;
                    dr[4] = string.Empty;
                    dr[5] = string.Empty;
                    dr[6] = string.Empty;
                    dr[7] = string.Empty;
                    dr[8] = string.Empty;
                    dr[9] = string.Empty;
                    //dr[10] = string.Empty;
                 
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        private void BindTableInGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[10] { new DataColumn("id", typeof(string)),
            new DataColumn("work_order",typeof(string)),
            new DataColumn("emp_code",typeof(string)),
            new DataColumn("employee_name",typeof(string)),
            new DataColumn("department",typeof(string)),
            new DataColumn("date_of_joining",typeof(string)),
            new DataColumn("last_working_day",typeof(string)),
            new DataColumn("year_of_service",typeof(string)),
            new DataColumn("last_month_salary",typeof(string)),
            new DataColumn("pay_of_gratuity",typeof(string)),
       
           
            });

            //----------------------------------//
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "select id ,work_order,emp_code,employee_name,department,date_of_joining,last_working_day,year_of_service,last_month_salary,pay_of_gratuity from tbl_full_final_settlement where work_order= '" + ddlWorkdOrder.SelectedItem.Text + "'";
            DataTable dt1;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (dt1 = new DataTable())
                    {

                        sda.Fill(dt1);
                        if (dt1.Rows.Count > 0)
                        {
                            string MyString = dt1.Rows[0].ItemArray[0].ToString();
                            ////GridView2.DataSource = dt;
                            ////GridView2.DataBind();
                        }
                        else
                        {
                            CreateEmptyTable();
                            //////GridView2.DataSource = null;
                            //////GridView2.DataBind();
                            return;
                        }

                    }
                }
            }


            //------------------------------------//

            int dtEmpRowCount = dt1.Rows.Count;
            int dtEmpColCount = 10;
            DataRow dr;
            for (int i = 0; i < dtEmpRowCount; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < dtEmpColCount; j++)
                {
                    string MyString = dt1.Rows[i].ItemArray[j].ToString();

                    dr[j] = dt1.Rows[i].ItemArray[j].ToString();

                    ////dr[2] = string.Empty;
                
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();

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
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void ddlWorkdOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTableInGrid();
        }
    }
}