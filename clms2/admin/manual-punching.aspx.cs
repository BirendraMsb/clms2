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
    public partial class manual_punching : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        private SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!this.IsPostBack)
            {
                CreateEmptyTable();
                this.BindGrid();
                //Emp_Code();
                //year();
                txtdate1.Text = DateTime.Now.ToString("dd-MM-yyyy");
            }

          
        }

        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("shift",typeof(string)),
            new DataColumn("date",typeof(DateTime)),
            new DataColumn("in_time",typeof(DateTime)),
            new DataColumn("out_time",typeof(DateTime)),

            });

            DataRow dr;
            for (int i = 1; i <= 3; i++)
            {
                dr = dt.NewRow();
                dr[0] = string.Empty;
                dr[1] = string.Empty;
                dr[2] = string.Empty;
                dr[3] = DateTime.Now.ToString("dd-MM-yyyyy");
                dr[4] = DateTime.Now.ToString("HH:mm:ss");
                dr[5] = DateTime.Now.ToString("HH:mm:ss");
          

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
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            save_punch();
           
        }

        private void save_punch()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[6] { 
            new DataColumn("emp_code", typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("shift",typeof(string)),
            new DataColumn("date1",typeof(DateTime)),
            new DataColumn("in_time",typeof(DateTime)),
            new DataColumn("out_time",typeof(DateTime)),
            
            });


            // define varible for compare
            
            string empcode1 = "";
            string intime ,outtime;
            string date1;
            foreach (GridViewRow row in GridView2.Rows)
            {

                ////------ check duplicate record in tbl_shift_scheduke ------////
               // id =Convert.ToInt32(((Label)row.Cells[0].FindControl("id")).Text);
                empcode1 = ((Label)row.Cells[0].FindControl("emp_code")).Text;
                intime =((TextBox)row.Cells[0].FindControl("in_time")).Text;
                outtime = ((TextBox)row.Cells[0].FindControl("out_time")).Text;
                 date1 = txtdate1.Text;

                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                string query = "SELECT *  FROM tbl_manual_punch where emp_code='" + empcode1 + "' and date = '" + date1 + "' ";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {

                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.HasRows)
                        {
                            lblMsg.Text = "Records already exist";
                            return;
                        }


                        //using (DataTable dt1 = new DataTable())
                        //{
                        //    sda.Fill(dt1);

                        //    if (dt1.Rows.Count > 0)
                        //    {
                        //        ////GridView2.DataSource = dt1;
                        //        ////GridView2.DataBind();
                                
                        //        //cmd = new SqlCommand();
                        //        //cmd.Connection = con;
                        //        //cmd.CommandText = "update tbl_manual_punch set in_time= @in_time , out_time= @out_time  where id=@ids and date=@date ";
                        //        //cmd.CommandType = CommandType.Text;
                        //        //cmd.Parameters.AddWithValue("@emp_code", empcode1);
                        //        //cmd.Parameters.AddWithValue("@date", date1);
                        //        //cmd.Parameters.AddWithValue("@in_time", intime.ToShortTimeString());
                        //        //cmd.Parameters.AddWithValue("@out_time", outtime.ToShortTimeString());
                        //         lblMsg.Text = "Records already exist";
                               
                        //    }

                        //}
                    }
                }
                ////////---------------------------------------- ---------////
                try
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = ((Label)row.Cells[0].FindControl("emp_code")).Text;
                    dr[1] = ((Label)row.Cells[0].FindControl("emp_name")).Text;
                    dr[2] = ((Label)row.Cells[0].FindControl("shift")).Text;
                    dr[3] = txtdate1.Text;
                    dr[4] = ((TextBox)row.Cells[0].FindControl("in_time")).Text;
                    dr[5] = ((TextBox)row.Cells[0].FindControl("out_time")).Text;
                    dt.Rows.Add(dr);

                }
                catch (Exception ex)
                {

                    lblMsgError.Text = "Missaing Date or In time or Out Time" + " " + ex.Message;
                    return;
                }
                finally
                {

                }


            }

            if (dt.Rows.Count > 0)
            {
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        try
                        {

                            sqlBulkCopy.DestinationTableName = "dbo.tbl_manual_punch";

                            sqlBulkCopy.ColumnMappings.Add("emp_code", "emp_code");
                            sqlBulkCopy.ColumnMappings.Add("emp_name", "emp_name");
                            ////sqlBulkCopy.ColumnMappings.Add("shift", "shift");
                            sqlBulkCopy.ColumnMappings.Add("date1", "date");
                            sqlBulkCopy.ColumnMappings.Add("in_time", "in_time");
                            sqlBulkCopy.ColumnMappings.Add("out_time", "out_time");


                            con.Open();

                            sqlBulkCopy.BatchSize = 3;
                            sqlBulkCopy.NotifyAfter = 1;
                            sqlBulkCopy.SqlRowsCopied += new SqlRowsCopiedEventHandler(bulkCopy_RowsCopied);

                            sqlBulkCopy.WriteToServer(dt);
                            lblMsgError.Text = "";
                            lblMsg.Text = "Punch is successful";
                            

                        }
                        catch (Exception ex)
                        {

                            lblMsgError.Text = ex.Message + "  " + "Do not enter dublicate Record";
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }
            }

            txtdate1.Text = "";

        }

       
        private void bulkCopy_RowsCopied(object sender, SqlRowsCopiedEventArgs e)
        {
            lblMsg.Text = lblMsg.Text + "<h1>Records Inserted...<h1>";
        }





    }
}