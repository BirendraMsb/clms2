using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class attendance_view : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        public void workorder()
        {
            try
            {
                // Call dbConnection()
                string vencode = Session["User"].ToString();
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT distinct work_worder from tbl_vendor_work_order Where vendor_reg_code ='" + vencode + "'"))  // tbl_attendance
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            ddlWorkOrder.DataSource = ds.Tables[0];
                            ddlWorkOrder.DataTextField = "work_worder";
                            ddlWorkOrder.DataValueField = "work_worder";
                            ddlWorkOrder.DataBind();
                        }
                    }
                }
                ddlWorkOrder.Items.Insert(0, new ListItem("--Select Work Order--", "0"));

            }
            catch (Exception)
            {
                
                throw;
            }
           
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string usrnm = Session["User"].ToString();
                lblUser.Text = usrnm;
                // lblUser1.Text = usrnm
                lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
                if (!Page.IsPostBack)
                    workorder();

            }
            catch (Exception)
            {
                
                throw;
            }
          

        }

        protected void GvAttn_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvAttn.PageIndex = e.NewPageIndex;
            GvAttn.DataBind();
        }

     
        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
                strSQL = "SELECT * FROM tbl_attendance";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvAttn.DataSource = dt;
                GvAttn.DataBind();
            }
            catch (Exception ex)
            {
                lblMSG.Text = ex.Message;
            }
        }

        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbConnection();
            if (ddlWorkOrder.SelectedValue != "")
            {
                strSQL = "SELECT a.*,b.* FROM tbl_vendor_info a, tbl_attendance b where a.vendor_reg_code=b.vendor_code and workorder = '" + ddlWorkOrder.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvAttn.DataSource = dt;
                GvAttn.DataBind();
                GvAttn.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            con.Close();
        }

       

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            var path = Server.MapPath("~/pf_doc");
            var filePath = Path.Combine(path, "Attendance.csv");
            // string filePath = @"D:\Visual_Studio_2013_Projects\clms2\clms2\pf_doc\Attendance.csv";
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