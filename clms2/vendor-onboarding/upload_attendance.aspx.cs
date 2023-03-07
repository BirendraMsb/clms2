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
                dt.Columns.AddRange(new DataColumn[37] {
                new DataColumn("emp_code", typeof(string)),
                new DataColumn("vendor_code", typeof(string)),
                new DataColumn("workorder", typeof(string)),
                new DataColumn("emp_name", typeof(string)),
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
                                         new DataColumn("d31",typeof(string)), });
    
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

               

            }
            catch (Exception ex)
            {
                
              Response.Redirect ("Attendance file is not uploaded");
            }
          
        }

        protected void btnAddToDb_Click(object sender, EventArgs e)
        {
            con.Open();
            tran = con.BeginTransaction();
            cmd.Transaction = tran;
            string slno = null;
            try
            {
                foreach (GridViewRow g1 in Gvrecords.Rows)
                {
                    string emp_code = (g1.FindControl("lblemp_code") as Label).Text;
                    string vendor_code = (g1.FindControl("lblvendor_code") as Label).Text;
                    string workorder = (g1.FindControl("lblworkorder") as Label).Text;
                    string emp_name = (g1.FindControl("lblemp_name") as Label).Text;
                    string year1 = (g1.FindControl("lblyear1") as Label).Text;
                    string month1 = (g1.FindControl("lblmonth1") as Label).Text;
                    string d1 = (g1.FindControl("lbld1") as Label).Text;
                    string d2 = (g1.FindControl("lbld2") as Label).Text;
                    string d3 = (g1.FindControl("lbld3") as Label).Text;
                    string d4 = (g1.FindControl("lbld4") as Label).Text;
                    string d5 = (g1.FindControl("lbld5") as Label).Text;
                    string d6 = (g1.FindControl("lbld6") as Label).Text;
                    string d7 = (g1.FindControl("lbld7") as Label).Text;
                    string d8 = (g1.FindControl("lbld8") as Label).Text;
                    string d9 = (g1.FindControl("lbld9") as Label).Text;
                    string d10 = (g1.FindControl("lbld10") as Label).Text;
                    string d11 = (g1.FindControl("lbld11") as Label).Text;
                    string d12 = (g1.FindControl("lbld12") as Label).Text;
                    string d13 = (g1.FindControl("lbld13") as Label).Text;
                    string d14 = (g1.FindControl("lbld14") as Label).Text;
                    string d15 = (g1.FindControl("lbld15") as Label).Text;
                    string d16 = (g1.FindControl("lbld16") as Label).Text;
                    string d17 = (g1.FindControl("lbld17") as Label).Text;
                    string d18 = (g1.FindControl("lbld18") as Label).Text;
                    string d19 = (g1.FindControl("lbld19") as Label).Text;
                    string d20 = (g1.FindControl("lbld20") as Label).Text;
                    string d21 = (g1.FindControl("lbld21") as Label).Text;
                    string d22 = (g1.FindControl("lbld22") as Label).Text;
                    string d23= (g1.FindControl("lbld23") as Label).Text;
                    string d24 = (g1.FindControl("lbld24") as Label).Text;
                    string d25 = (g1.FindControl("lbld25") as Label).Text;
                    string d26 = (g1.FindControl("lbld26") as Label).Text;
                    string d27 = (g1.FindControl("lbld27") as Label).Text;
                    string d28 = (g1.FindControl("lbld28") as Label).Text;
                    string d29= (g1.FindControl("lbld29") as Label).Text;
                    string d30 = (g1.FindControl("lbld30") as Label).Text;
                    string d31 = (g1.FindControl("lbld31") as Label).Text;

                    string query = "insert into tbl_attendance(emp_code,vendor_code,workorder,emp_name,year1,month1,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31) values('" + emp_code + "','" + vendor_code + "','" + workorder + "','" + emp_name + "'," + year1 + " ," + month1 + " , '" + d1 + "' ,'" + d2 + "' ,'" + d3 + "' ,'" + d4 + "'   ,'" + d5 + "' ,'" + d6 + "'   ,'" + d7 + "'    ,'" + d8 + "'      ,'" + d9 + "' ,'" + d10 + "','" + d11 + "' ,'" + d12 + "' ,'" + d13 + "' ,'" + d14 + "'   ,'" + d15 + "' ,'" + d16 + "'   ,'" + d17 + "'    ,'" + d18 + "','" + d19 + "' ,'" + d20 + "','" + d21 + "' ,'" + d22 + "' ,'" + d23 + "' ,'" + d24 + "'   ,'" + d25 + "' ,'" + d26 + "' ,'" + d27 + "' ,'" + d28 + "' ,'" + d29 + "' ,'" + d30 + "','" + d31 + "' )";
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
                lblMessage.Text = "Error Occured  near Sr. No. = " + slno + "<br />";
                lblMessage.Text += "No Data Is Inserted. <br />";
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