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
       
    public partial class upload_attendance : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlTransaction tran;
        string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            con = new SqlConnection(constr);
            cmd = new SqlCommand();
            cmd.Connection = con;  

        }

        protected void ImportCSV(object sender, EventArgs e)
        {
            // upload to server and import in gridview
            try
            {
                //Upload and save the file
                string csvPath = Server.MapPath("~/attd_upload_doc/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(csvPath);

                //Create a DataTable.
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[41] {
                new DataColumn("emp_code", typeof(string)),
                new DataColumn("vendor_code", typeof(string)),
                new DataColumn("workorder", typeof(string)),
                new DataColumn("emp_name", typeof(string)),
                new DataColumn("department",typeof(string)),
                new DataColumn("year1",typeof(Int16)),
                new DataColumn("month1",typeof(Int16)),
                 new DataColumn("d1",typeof(string)),
                  new DataColumn("d2",typeof(string)),
                   new DataColumn("d3",typeof(string)),
                    new DataColumn("d4",typeof(string)),
                     new DataColumn("d5",typeof(string)),
                      new DataColumn("d6",typeof(string)),
                       new DataColumn("d7",typeof(string)),
                        new DataColumn("d8",typeof(string)),
                         new DataColumn("d9",typeof(string)),
                          new DataColumn("d10",typeof(string)),
                           new DataColumn("d11",typeof(string)),
                            new DataColumn("d12",typeof(string)),
                             new DataColumn("d13",typeof(string)),
                              new DataColumn("d14",typeof(string)),
                               new DataColumn("d15",typeof(string)),
                                new DataColumn("d16",typeof(string)),
                                 new DataColumn("d17",typeof(string)),
                                  new DataColumn("d18",typeof(string)),
                                   new DataColumn("d19",typeof(string)),
                                    new DataColumn("d20",typeof(string)),
                                     new DataColumn("d21",typeof(string)),
                                      new DataColumn("d22",typeof(string)),
                                       new DataColumn("d23",typeof(string)),
                                        new DataColumn("d24",typeof(string)),
                                         new DataColumn("d25",typeof(string)),
                                         new DataColumn("d26",typeof(string)),
                                         new DataColumn("d27",typeof(string)),
                                         new DataColumn("d28",typeof(string)),
                                         new DataColumn("d29",typeof(string)),
                                         new DataColumn("d30",typeof(string)),
                                         new DataColumn("d31",typeof(string)),
                                         new DataColumn("daily_working_hrs",typeof(Int32)),
                                         new DataColumn("monthly_work_hrs",typeof(Int32)),
                                         new DataColumn("monthly_ot_hrs",typeof(Int32)),

                
                });
    
                //Read the contents of CSV file.
                string csvData = File.ReadAllText(csvPath);

                //Execute a loop over the rows.
                foreach (string row in csvData.Split('\n'))
                {
                    if (!string.IsNullOrEmpty(row))
                    {
                        dt.Rows.Add();
                        int i = 0;

                        //Execute a loop over the columns.
                        foreach (string cell in row.Split(','))
                        {
                            dt.Rows[dt.Rows.Count - 1][i] = cell;
                            i++;
                        }
                    }
                }


                Gvrecords.DataSource = dt;
                Gvrecords.DataBind();
                btnAddToDb.Enabled = true;

                ////compare grid data with database and find duplciate record ------------------------/////
  
                   






            }
            catch (Exception ex)
            {
                
              Response.Redirect ("Attendance file is not uploaded");
            }
          
        }

        protected void btnAddToDb_Click(object sender, EventArgs e)
        {

            #region compare grid data with tbl_atteandance and find duplciate record and exit
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["const"].ConnectionString);
            string query1 = "select * from tbl_attendance";
            SqlCommand cmd1 = new SqlCommand(query1);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1.CommandText, con1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);

            int RowCount = dt1.Rows.Count;

            for (int i = 0; i < RowCount; i++)
            {
                foreach (GridViewRow g1 in Gvrecords.Rows)
                {
                    //int present = 0;
                    //int absent = 0;
                    //int tot_holidays = 0;
                    //int tot_leave = 0;
                    //int tot_week_off = 0;
                    //int tot_working_day = 0;

                    string emp_code = (g1.FindControl("lblemp_code") as Label).Text;
                    string vendor_code = (g1.FindControl("lblvendor_code") as Label).Text;
                    string workorder = (g1.FindControl("lblworkorder") as Label).Text;
                    string emp_name = (g1.FindControl("lblemp_name") as Label).Text;
                    string department = (g1.FindControl("lbldepartment") as Label).Text;
                    string year1 = (g1.FindControl("lblyear1") as Label).Text;
                    string month1 = (g1.FindControl("lblmonth1") as Label).Text;

                    ////Label1.Text = ((TextBox)Gvrecords.FindControl("lblemp_code")).Text;
                    //// Label2.Text = dt1.Rows[i]["emp_code"].ToString();
                    string emp_code_att = dt1.Rows[i]["emp_code"].ToString();
                    string vendor_code_att = dt1.Rows[i]["vendor_code"].ToString();
                    string workorder_att = dt1.Rows[i]["workorder"].ToString();
                    string year_att = dt1.Rows[i]["year1"].ToString();
                    string month_att = dt1.Rows[i]["month1"].ToString();
                    if (emp_code == emp_code_att && vendor_code == vendor_code_att && workorder == workorder_att && year1 == year_att && month1 == month_att)
                    {
                        string message = "Emp code=" + emp_code + ",Vendor Code=" + vendor_code + ",Workorder=" + workorder + ",Emp Name=" + emp_name + ",Year=" + year1 + ",Month1=" + month1 + "" ;
                        message += " This record already Exists . Pls Correct it and Upload it again";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>");
                        sb.Append("window.onload=function(){");
                        sb.Append("alert('");
                        sb.Append(message);
                        sb.Append("')};");
                        sb.Append("</script>");

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                        return;
                    }
                    else
                    {
                        //string message = "Successfully saved";

                        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        //sb.Append("<script type = 'text/javascript'>");
                        //sb.Append("window.onload=function(){");
                        //sb.Append("alert('");
                        //sb.Append(message);
                        //sb.Append("')};");
                        //sb.Append("</script>");

                        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    }
                }


            } // end of for loop

            #endregion


            con.Open();
            tran = con.BeginTransaction();
            cmd.Transaction = tran;
            string slno = null;
            try
            {

                foreach (GridViewRow g1 in Gvrecords.Rows)
                {
                    int present = 0;
                    int absent =0;
                    int tot_holidays = 0;
                    int tot_leave = 0;
                    int tot_week_off = 0;
                    int tot_working_day = 0;

                    string emp_code = (g1.FindControl("lblemp_code") as Label).Text;
                    string vendor_code = (g1.FindControl("lblvendor_code") as Label).Text;
                    string workorder = (g1.FindControl("lblworkorder") as Label).Text;
                    string emp_name = (g1.FindControl("lblemp_name") as Label).Text;
                    string department = (g1.FindControl("lbldepartment") as Label).Text;
                    string year1 = (g1.FindControl("lblyear1") as Label).Text;
                    string month1 = (g1.FindControl("lblmonth1") as Label).Text;

                  
                    string d1 = (g1.FindControl("lbld1") as Label).Text;
                    if (d1 != "")
                    {
                        if (d1.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d1.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d1.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d1.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d1.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                     
                    }
                  
                    string d2 = (g1.FindControl("lbld2") as Label).Text;
                    if (d2.ToUpper() != "")
                    {
                        if (d2.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d2.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d2.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d2.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d2.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d3 = (g1.FindControl("lbld3") as Label).Text;
                    if (d3 != "")
                    {
                        if (d3.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d3.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d3.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d3.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d3.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                
                    string d4 = (g1.FindControl("lbld4") as Label).Text;
                    if (d4 != "")
                    {
                        if (d4.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d4.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d4.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d4.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d4.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d5 = (g1.FindControl("lbld5") as Label).Text;
                    if (d5 != "")
                    {
                        if (d5.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d5.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d5.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d5.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d5.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d6 = (g1.FindControl("lbld6") as Label).Text;
                    if (d6 != "")
                    {
                        if (d6.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d6.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d6.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d6.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d6.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d7 = (g1.FindControl("lbld7") as Label).Text;
                    if (d7 != "")
                    {
                        if (d7.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d7.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d7.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d7.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d7.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d8 = (g1.FindControl("lbld8") as Label).Text;
                    if (d8 != "")
                    {
                        if (d8.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d8.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d8.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d8.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d8.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d9 = (g1.FindControl("lbld9") as Label).Text;
                    if (d9 != "")
                    {
                        if (d9.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d9.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d9.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d9.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d9.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d10 = (g1.FindControl("lbld10") as Label).Text;
                    if (d10 != "")
                    {
                        if (d10.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d10.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d10.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d10.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d10.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d11 = (g1.FindControl("lbld11") as Label).Text;
                    if (d11 != "")
                    {
                        if (d11.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d11.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d11.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d11.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d11.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d12 = (g1.FindControl("lbld12") as Label).Text;
                    if (d12 != "")
                    {
                        if (d12.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d12.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d12.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d12.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d12.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                   
                    string d13 = (g1.FindControl("lbld13") as Label).Text;
                    if (d13 != "")
                    {
                        if (d13.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d13.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d13.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d13.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d13.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d14 = (g1.FindControl("lbld14") as Label).Text;
                    if (d14 != "")
                    {
                        if (d14.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d14.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d14.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d14.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d14.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
                   
                    string d15 = (g1.FindControl("lbld15") as Label).Text;
                    if (d15 != "")
                    {
                        if (d15.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d15.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d15.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d15.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d15.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d16 = (g1.FindControl("lbld16") as Label).Text;
                    if (d16 != "")
                    {
                        if (d16.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d16.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d16.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d16.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d16.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d17 = (g1.FindControl("lbld17") as Label).Text;
                    if (d17 != "")
                    {
                        if (d17.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d17.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d17.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d17.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d17.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
               
                    string d18 = (g1.FindControl("lbld18") as Label).Text;
                    if (d18 != "")
                    {
                        if (d18.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d18.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d18.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d18.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d18.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d19 = (g1.FindControl("lbld19") as Label).Text;
                    if (d19 != "")
                    {
                        if (d19.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d19.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d19.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d19.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d19.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
                 
                    string d20 = (g1.FindControl("lbld20") as Label).Text;
                    if (d20 != "")
                    {
                        if (d20.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d20.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d20.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d20.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d20.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
                  
                    string d21 = (g1.FindControl("lbld21") as Label).Text;
                    if (d21 != "")
                    {
                        if (d21.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d21.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d21.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d21.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d21.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d22 = (g1.FindControl("lbld22") as Label).Text;
                    if (d22 != "")
                    {
                        if (d22.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d22.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d22.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d22.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d22.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d23= (g1.FindControl("lbld23") as Label).Text;
                    if (d23 != "")
                    {
                        if (d23.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d23.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d23.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d23.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d23.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
                  
                    string d24 = (g1.FindControl("lbld24") as Label).Text;
                    if (d24 != "")
                    {
                        if (d24.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d24.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d24.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d24.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d24.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d25 = (g1.FindControl("lbld25") as Label).Text;
                    if (d25 != "")
                    {
                        if (d25.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d25.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d25.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d25.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d25.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                 
                    string d26 = (g1.FindControl("lbld26") as Label).Text;
                    if (d26 != "")
                    {
                        if (d26.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d26.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d26.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d26.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d26.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
                 
                    string d27 = (g1.FindControl("lbld27") as Label).Text;
                    if (d27 != "")
                    {
                        if (d27.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d27.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d27.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d27.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d27.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                   
                    string d28 = (g1.FindControl("lbld28") as Label).Text;
                    if (d28 != "")
                    {
                        if (d28.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d28.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d28.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d28.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d28.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                   
                    string d29= (g1.FindControl("lbld29") as Label).Text;
                    if (d29 != "")
                    {
                        if (d29.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d29.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d29.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d29.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d29.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                  
                    string d30 = (g1.FindControl("lbld30") as Label).Text;
                    if (d30 != "")
                    {
                        if (d30.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d30.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d30.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d30.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d30.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
                
                    string d31 = (g1.FindControl("lbld31") as Label).Text;
                    if (d31 != "")
                    {
                        if (d31.ToUpper() == "P")
                        {
                            present += 1;
                        }
                        else if (d31.ToUpper() == "A")
                        {
                            absent += 1;
                        }
                        else if (d31.ToUpper() == "L")
                        {
                            tot_leave += 1;
                        }
                        else if (d31.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d31.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }

                    }
 
                    string daily_working_hrs = (g1.FindControl("lbldaily_working_hrs") as Label).Text;
                    double monthly_work_hrs1 = present * Convert.ToDouble(daily_working_hrs);
                    string monthly_work_hrs = monthly_work_hrs1.ToString();
                    ////string monthly_work_hrs = (g1.FindControl("lblmonthly_work_hrs") as Label).Text;
                    string monthly_ot_hrs = (g1.FindControl("lblmonthly_ot_hrs") as Label).Text;

                    tot_working_day = present + absent;

                    string query = "insert into tbl_attendance(emp_code,vendor_code,workorder,emp_name,department,year1,month1,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,daily_working_hrs,monthly_work_hrs,monthly_ot_hrs,Absent,Present,tot_holidays,tot_leave,tot_week_off,tot_working_day) values('" + emp_code + "','" + vendor_code + "','" + workorder + "','" + emp_name + "','" + department + "'," + year1 + " ," + month1 + " , '" + d1 + "' ,'" + d2 + "' ,'" + d3 + "' ,'" + d4 + "'   ,'" + d5 + "' ,'" + d6 + "'   ,'" + d7 + "'    ,'" + d8 + "'      ,'" + d9 + "' ,'" + d10 + "','" + d11 + "' ,'" + d12 + "' ,'" + d13 + "' ,'" + d14 + "'   ,'" + d15 + "' ,'" + d16 + "'   ,'" + d17 + "'    ,'" + d18 + "','" + d19 + "' ,'" + d20 + "','" + d21 + "' ,'" + d22 + "' ,'" + d23 + "' ,'" + d24 + "'   ,'" + d25 + "' ,'" + d26 + "' ,'" + d27 + "' ,'" + d28 + "' ,'" + d29 + "' ,'" + d30 + "','" + d31 + "','" + daily_working_hrs + "','" + monthly_work_hrs + "','" + monthly_ot_hrs + "','" + absent + "','" + present + "','" + tot_holidays + "' ,'" + tot_leave + "','" + tot_week_off + "','" + tot_working_day + "')";
                    //cmd.CommandText = "insert into Members values ('" + g1.Cells[0].Text + "','" + g1.Cells[1].Text + "','" + g1.Cells[2].Text + "','" + g1.Cells[3].Text + "')";  
                    slno = vendor_code;
                    cmd.CommandText = query;
                    cmd.ExecuteNonQuery();
                }
                tran.Commit();
                lblMessage.Text = "Records inserted successfully";
            }
            catch (Exception ex)
            {
                tran.Rollback();
                lblMsgError.Text = "Error Occured  near Sr. No. = " + slno + "<br />";
                lblMsgError.Text += "No Data Is Inserted. <br />";
                //lblMessage.Text += ex.Message;  
            }
            finally
            {
                con.Close();
            }  
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            var path = Server.MapPath("~/attd_down_doc");
            var filePath = Path.Combine(path, "Atted_Format.csv");
             FileInfo file = new FileInfo(filePath);
            if (file.Exists)
            {
                // Clear Rsponse reference  
                Response.Clear();
                // Add header by specifying file name  
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                // Add header for content length  
                Response.AddHeader("Content-Length", file.Length.ToString());
                // Specify content type  
                Response.ContentType = "text/plain";
                // Clearing flush  
                Response.Flush();
                // Transimiting file  
                Response.TransmitFile(file.FullName);
                Response.End();
            }
            Response.Write("Requested file is not available to download");
        }

      

      
    }
}