using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.admin
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if( !Page.IsPostBack)
            {
                CreateEmptyTable();
                BindGrid();
                year();
            }
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
            dt.Columns.AddRange(new DataColumn[34] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("shift",typeof(string)),
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
            });

            DataRow dr;
            for (int i = 1; i <= 3; i++)
            {
                dr = dt.NewRow();
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
                dr[10] = string.Empty;
                dr[11] = string.Empty;
                dr[12] = string.Empty;
                dr[13] = string.Empty;
                dr[14] = string.Empty;
                dr[15] = string.Empty;
                dr[16] = string.Empty;
                dr[17] = string.Empty;
                dr[18] = string.Empty;
                dr[19] = string.Empty;
                dr[20] = string.Empty;
                dr[21] = string.Empty;
                dr[22] = string.Empty;
                dr[23] = string.Empty;
                dr[24] = string.Empty;
                dr[25] = string.Empty;
                dr[26] = string.Empty;
                dr[27] = string.Empty;
                dr[28] = string.Empty;
                dr[29] = string.Empty;
                dr[30] = string.Empty;
                dr[31] = string.Empty;
                dr[32] = string.Empty;
                dr[32] = string.Empty;
                dr[33] = string.Empty;

                dt.Rows.Add(dr);
            }

            GridView2.DataSource = dt;
            GridView2.DataBind();

        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT emp_code,emp_name,shift FROM tbl_emp";
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            int year = Convert.ToInt32(ddlYear.SelectedItem.Text);   //Convert.ToInt32(DateTime.Now.Year);
              int month = Convert.ToInt32(DropDownList1.SelectedValue);
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
                    string dayname =(Convert.ToDateTime((ii + 1).ToString() + "-" + month.ToString() + "-" + year.ToString())).ToString("ddd");
                    dr[ii]  = dayname;
                  //  dr[ii] = (ii + 1).ToString()+ "-" + month.ToString()+ "-" + year.ToString();
                   // dr[ii] = "bk";
                }
                myDT.Rows.Add(dr);
            }



            GridView1.DataSource = myDT;
            GridView1.DataBind();

        }

        protected void btnBulkInsert_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[34] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("shift",typeof(string)),
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
            });

            foreach (GridViewRow row in GridView2.Rows)
            {
                DataRow dr = dt.NewRow();
                dr[0] = ((Label)row.Cells[0].FindControl("emp_code")).Text;
                dr[1] = ((Label)row.Cells[0].FindControl("emp_name")).Text;
                dr[2] = ((Label)row.Cells[0].FindControl("shift")).Text;
                dr[3] = ((DropDownList)row.Cells[0].FindControl("D1")).SelectedItem.Text;
                dr[4] = ((TextBox)row.Cells[0].FindControl("D2")).Text;
                dr[5] = ((TextBox)row.Cells[0].FindControl("D3")).Text;
                dr[6] = ((TextBox)row.Cells[0].FindControl("D4")).Text;
                dr[7] = ((TextBox)row.Cells[0].FindControl("D5")).Text;
                dr[8] = ((TextBox)row.Cells[0].FindControl("D6")).Text;
                dr[9] = ((TextBox)row.Cells[0].FindControl("D7")).Text;
                dr[10] = ((TextBox)row.Cells[0].FindControl("D8")).Text;
                dr[11] = ((TextBox)row.Cells[0].FindControl("D9")).Text;
                dr[12] = ((TextBox)row.Cells[0].FindControl("D10")).Text;
                dr[13] = ((TextBox)row.Cells[0].FindControl("D11")).Text;
                dr[14] = ((TextBox)row.Cells[0].FindControl("D12")).Text;
                dr[15] = ((TextBox)row.Cells[0].FindControl("D13")).Text;
                dr[16] = ((TextBox)row.Cells[0].FindControl("D14")).Text;
                dr[17] = ((TextBox)row.Cells[0].FindControl("D15")).Text;
                dr[18] = ((TextBox)row.Cells[0].FindControl("D16")).Text;
                dr[19] = ((TextBox)row.Cells[0].FindControl("D17")).Text;
                dr[20] = ((TextBox)row.Cells[0].FindControl("D18")).Text;
                dr[21] = ((TextBox)row.Cells[0].FindControl("D19")).Text;
                dr[22] = ((TextBox)row.Cells[0].FindControl("D20")).Text;
                dr[23] = ((TextBox)row.Cells[0].FindControl("D21")).Text;
                dr[24] = ((TextBox)row.Cells[0].FindControl("D22")).Text;
                dr[25] = ((TextBox)row.Cells[0].FindControl("D23")).Text;
                dr[26] = ((TextBox)row.Cells[0].FindControl("D24")).Text;
                dr[27] = ((TextBox)row.Cells[0].FindControl("D25")).Text;
                dr[28] = ((TextBox)row.Cells[0].FindControl("D26")).Text;
                dr[29] = ((TextBox)row.Cells[0].FindControl("D27")).Text;
                dr[30] = ((TextBox)row.Cells[0].FindControl("D28")).Text;
                dr[31] = ((TextBox)row.Cells[0].FindControl("D29")).Text;
                dr[32] = ((TextBox)row.Cells[0].FindControl("D30")).Text;
                dr[33] = ((TextBox)row.Cells[0].FindControl("D31")).Text;

                dt.Rows.Add(dr);
            }

            if (dt.Rows.Count > 0)
            {
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        sqlBulkCopy.DestinationTableName = "dbo.tbl_shfit_schedule";

                        sqlBulkCopy.ColumnMappings.Add("emp_code", "emp_code");
                        sqlBulkCopy.ColumnMappings.Add("emp_name", "emp_name");
                        //sqlBulkCopy.ColumnMappings.Add("shift", "shift");
                        sqlBulkCopy.ColumnMappings.Add("D1", "D1");
                        sqlBulkCopy.ColumnMappings.Add("D2", "D2");
                        sqlBulkCopy.ColumnMappings.Add("D3", "D3");
                        sqlBulkCopy.ColumnMappings.Add("D4", "D4");
                        sqlBulkCopy.ColumnMappings.Add("D5", "D5");
                        sqlBulkCopy.ColumnMappings.Add("D6", "D6");
                        sqlBulkCopy.ColumnMappings.Add("D7", "D7");
                        sqlBulkCopy.ColumnMappings.Add("D8", "D8");
                        sqlBulkCopy.ColumnMappings.Add("D9", "D9");
                        sqlBulkCopy.ColumnMappings.Add("D10", "D10");
                        sqlBulkCopy.ColumnMappings.Add("D11", "D11");
                        sqlBulkCopy.ColumnMappings.Add("D12", "D12");
                        sqlBulkCopy.ColumnMappings.Add("D13", "D13");
                        sqlBulkCopy.ColumnMappings.Add("D14", "D14");
                        sqlBulkCopy.ColumnMappings.Add("D15", "D15");
                        sqlBulkCopy.ColumnMappings.Add("D16", "D16");
                        sqlBulkCopy.ColumnMappings.Add("D17", "D17");
                        sqlBulkCopy.ColumnMappings.Add("D18", "D18");
                        sqlBulkCopy.ColumnMappings.Add("D19", "D19");
                        sqlBulkCopy.ColumnMappings.Add("D20", "D20");
                        sqlBulkCopy.ColumnMappings.Add("D21", "D21");
                        sqlBulkCopy.ColumnMappings.Add("D22", "D22");
                        sqlBulkCopy.ColumnMappings.Add("D23", "D23");
                        sqlBulkCopy.ColumnMappings.Add("D24", "D24");
                        sqlBulkCopy.ColumnMappings.Add("D25", "D25");
                        sqlBulkCopy.ColumnMappings.Add("D26", "D26");
                        sqlBulkCopy.ColumnMappings.Add("D27", "D27");
                        sqlBulkCopy.ColumnMappings.Add("D28", "D28");
                        sqlBulkCopy.ColumnMappings.Add("D29", "D29");
                        sqlBulkCopy.ColumnMappings.Add("D30", "D30");
                        sqlBulkCopy.ColumnMappings.Add("D31", "D31");
                        con.Open();

                        sqlBulkCopy.BatchSize = 3;
                        sqlBulkCopy.NotifyAfter = 1;

                        sqlBulkCopy.SqlRowsCopied += new SqlRowsCopiedEventHandler(bulkCopy_RowsCopied);

                        sqlBulkCopy.WriteToServer(dt);
                        con.Close();
                      
                    }
                }


            }


        }

        private void bulkCopy_RowsCopied(object sender ,SqlRowsCopiedEventArgs e)
        {
            lblMsg.Text = lblMsg.Text + "<h1>Records Inserted...<h1>";
        }
    }
}