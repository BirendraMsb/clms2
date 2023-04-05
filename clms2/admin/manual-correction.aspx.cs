using System;
using System.Collections;
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
    public partial class manual_correction : System.Web.UI.Page
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
               // CreateEmptyTable();
                this.BindGrid();
               
            }

        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_manual_punch";
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
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            ArrayList a1 = new ArrayList();
            foreach (GridViewRow row  in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = row.Cells[0].FindControl("chkRow") as CheckBox;
                    if(chkRow.Checked)
                    {
                     int id = Convert.ToInt32((row.Cells[0].FindControl("id") as Label).Text);
                     DateTime intime =Convert.ToDateTime((row.Cells[0].FindControl("in_time") as TextBox).Text);

                     DateTime outtime =Convert.ToDateTime((row.Cells[0].FindControl("out_time") as TextBox).Text);
                     a1.Add(id);
                     BulkUpdateManPunch(id, intime, outtime);
                     
                    }

                    
                }
                //string[] array = a1.ToArray(typeof(string)) as string[];

                //string csvIds = string.Join(",", array);

                //BulkUpdateManPunch( csvIds, inTime, outTime)
            }
            
        }

        public int BulkUpdateManPunch(Int32 csvIDs, DateTime inTime, DateTime outTime)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            int counter = 0;
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            try
            {
                cn = new SqlConnection(constr);
                cmd = new SqlCommand();
                cmd.Connection = cn;
                cmd.CommandText = "update tbl_manual_punch set in_time= @in_time , out_time= @out_time  where id=@ids ";
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = "[USP_MANUAL_CORRECTION_BULK_UPDATE]";
               // cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ids", csvIDs);
                cmd.Parameters.AddWithValue("@in_time", inTime.ToShortTimeString());
                cmd.Parameters.AddWithValue("@out_time", outTime.ToShortTimeString());
                
                cn.Open();
                counter = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                lblError.Text = ex.Message;
            }
            finally
            {
                if (cn != null)
                {
                    cn.Close();

                }
            }
            return counter;
        }
        

     
    }
}