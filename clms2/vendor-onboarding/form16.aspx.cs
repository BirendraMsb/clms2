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
    public partial class form16 : System.Web.UI.Page
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
               
                workorder();
             //////   this.BindGrid();
             //// //  Emp_Code();
                year();
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");
        }
        protected void year()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = 2010; i < currYear + 5; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
            ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
        }
        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[40] {new DataColumn("vendor_code", typeof(string)),
            new DataColumn("workorder", typeof(string)),
            new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("department",typeof(string)),
            new DataColumn("month1",typeof(string)),
             new DataColumn("year1",typeof(string)),
            //new DataColumn("date",typeof(string)),
            new DataColumn("D1",typeof(string)),
            new DataColumn("D2",typeof(string)),
            new DataColumn("D3",typeof(string)),
            new DataColumn("D4",typeof(string)),
            new DataColumn("D5",typeof(string)),
            new DataColumn("D6",typeof(string)),
            new DataColumn("D7",typeof(string)),
            new DataColumn("D8",typeof(string)),
            new DataColumn("D9",typeof(string)),
            new DataColumn("D10",typeof(string)),
            new DataColumn("D11",typeof(string)),
            new DataColumn("D12",typeof(string)),
            new DataColumn("D13",typeof(string)),
            new DataColumn("D14",typeof(string)),
            new DataColumn("D15",typeof(string)),
            new DataColumn("D16",typeof(string)),
            new DataColumn("D17",typeof(string)),
            new DataColumn("D18",typeof(string)),
            new DataColumn("D19",typeof(string)),
            new DataColumn("D20",typeof(string)),
            new DataColumn("D21",typeof(string)),
            new DataColumn("D22",typeof(string)),
            new DataColumn("D23",typeof(string)),
            new DataColumn("D24",typeof(string)),
            new DataColumn("D25",typeof(string)),
            new DataColumn("D26",typeof(string)),
            new DataColumn("D27",typeof(string)),
            new DataColumn("D28",typeof(string)),
            new DataColumn("D29",typeof(string)),
            new DataColumn("D30",typeof(string)),
            new DataColumn("D31",typeof(string)),
            new DataColumn("hr_approval",typeof(string)),
            new DataColumn("dept_approval",typeof(string)),
            });
            //------------------------------------//
            DataRow dr;
            for (int i = 0; i < 3; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j <38; j++)
                {
                    dr[j] = string.Empty;
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
            //----------------------------------//
            //string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            ////string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            //string query = "SELECT emp_code,emp_name,date FROM tbl_manual_punch";
            //DataTable dtPunch;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
            //    {
            //        using ( dtPunch = new DataTable())
            //        {
                       
            //            sda.Fill(dtPunch);
            //            string MyString = dtPunch.Rows[0].ItemArray[0].ToString();
            //            //GridView2.DataSource = dt;
            //            //GridView2.DataBind();
            //        }
            //    }
            //}


            ////------------------------------------//

            //int dtPunchRowCount = dtPunch.Rows.Count;
            //int dtPunchColCount = 3;
            //DataRow dr;
            //for (int i = 0; i < dtPunchRowCount; i++)
            //{
            //    dr = dt.NewRow();
            //    for (int j = 0; j <3; j++)
            //    {
         
            //    string MyString = dtPunch.Rows[i].ItemArray[j].ToString();
               
            //    dr[j] = dtPunch.Rows[i].ItemArray[j].ToString();
            //    dr[3] = "A";
            //    dr[4] = "A";
            //    //dr[0] ="e001"; //string.Empty;
            //    //dr[1] = "bk";// sring.Empty;
            //    //dr[2] = "27-03-2023";//string.Empty;
            //    //dr[3] = "A";//string.Empty;
            //    //dr[4] = string.Empty;
            //    dr[5] = "P";
            //    dr[6] = "P";
            //    dr[7] = "WO";
            //    dr[8] = "HL";
            //    dr[9] = "P";
            //    dr[10] = "P";
            //    dr[11] = "A";
            //    dr[12] = "A";
            //    dr[13] = "P";
            //    dr[14] = "WO";
            //    dr[15] = "P";
            //    dr[16] = "P";
            //    dr[17] = "P";
            //    dr[18] = "P";
            //    dr[19] = "P";
            //    dr[20] = "P";
            //    dr[21] = "wo";
            //    dr[22] = "P";
            //    dr[23] = "P";
            //    dr[24] = "P";
            //    dr[25] = "P";
            //    dr[26] = "P";
            //    dr[27] = "P";
            //    dr[28] = "wo";
            //    dr[29] = "P";
            //    dr[30] = "P";
            //    dr[31] = "P";
            //    dr[32] = "P";
            //    dr[32] = "A";
            //    dr[33] = "P";
            //    }
            //    dt.Rows.Add(dr);
            //}




            //GridView2.DataSource = dt;
            //GridView2.DataBind();

            ////---------------------------------////////////

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }

        private void BindGrid_Atted()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_Attendance where vendor_code ='" + Session["User"].ToString() + "' ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }
        int GetDaysInMonth(int month, int year)
        {
            if (month < 1 || month > 12)
            {
                throw new System.ArgumentOutOfRangeException("month", month, "month mustbe between 1 and 12");
            }
            if (1 == month || 3 == month || 5 == month || 7 == month || 8 == month ||
            10 == month || 12 == month)
            {
                return 31;
            }
            else if (2 == month)
            {
                // Check for leap year
                if (0 == (year % 4))
                {
                    // If date is divisible by 400, it's a leap year.
                    // Otherwise, if it's divisible by 100 it's not.
                    if (0 == (year % 400))
                    {
                        return 29;
                    }
                    else if (0 == (year % 100))
                    {
                        return 28;
                    }

                    // Divisible by 4 but not by 100 or 400
                    // so it leaps
                    return 29;
                }
                // Not a leap year
                return 28;
            }
            return 30;
        }
        private int Auto_ID()
        {
            int x = 0;
            string StrSql = "Select max(id) from tbl_emp";
            SqlCommand cmd = new SqlCommand(StrSql, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if ((dr.Read()))
                {
                    if ((dr[0] == DBNull.Value))
                        txtID.Text = "1";
                    else
                        txtID.Text = (Convert.ToInt16(dr[0]) + 1).ToString();
                }
                else
                    txtID.Text = "1";
            }
            catch (Exception ex)
            {
            }
            dr.Close();
            x = Convert.ToInt16(txtID.Text);
            return x;
        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
           // BindGrid_Atted();

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_Attendance where vendor_code ='" + Session["User"].ToString() + "' and workorder= '" + ddlWorkdOrder.SelectedItem.Text + "' and month1='" + ddlMonth.SelectedValue + "' and year1='" + ddlYear.SelectedItem.Text + "' and hr_approval='Approved' and dept_approval='Approved' ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                    }
                }
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            // diplaying calender 
            if (ddlMonth.SelectedItem.Text != "Select")
            {
                DateTime dt = DateTime.Now;
                int year = Convert.ToInt32(ddlYear.SelectedItem.Text);   //Convert.ToInt32(DateTime.Now.Year);
                int month = Convert.ToInt32(ddlMonth.SelectedValue);
                int days = GetDaysInMonth(month, year);

                // int days = GetDaysInMonth(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DateTime.Now.Year));


                // string dayname = DateTime.Now.DayOfWeek();
                DataTable myDT = new DataTable();
                //myDT.Columns.Add("Emp_Code",typeof(String));
                //myDT.Columns.Add("Emp_Name", typeof(String));

                for (int i = 1; i <= days; i++)
                {
                    // DataColumn id = new DataColumn("Day-");
                    DataColumn id = new DataColumn();
                    id.ColumnName = id + i.ToString();
                    // id.DataType = System.Type.GetType("System.Int32");
                    id.DataType = System.Type.GetType("System.String");
                    myDT.Columns.Add(id);

                }

                //for (int i = 1; i <= 1; i++)
                //{
                //    DataRow dr = myDT.NewRow();
                //    for (int ii = 0; ii < days; ii++)
                //    {
                //        dr[ii] = (ii+1).ToString();
                //    }
                //    myDT.Rows.Add(dr);
                //}

                for (int i = 1; i <= 1; i++)
                {
                    DataRow dr = myDT.NewRow();

                    for (int ii = 0; ii < days; ii++)
                    {
                        string dayname = (Convert.ToDateTime((ii + 1).ToString() + "-" + month.ToString() + "-" + year.ToString())).ToString("ddd");
                        dr[ii] = dayname;
                        //  dr[ii] = (ii + 1).ToString()+ "-" + month.ToString()+ "-" + year.ToString();
                        // dr[ii] = "bk";
                    }
                    myDT.Rows.Add(dr);
                }

                //GridView1.DataSource = myDT;
                //GridView1.DataBind();

            }

        }


        private void workorder()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";
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
    }
}