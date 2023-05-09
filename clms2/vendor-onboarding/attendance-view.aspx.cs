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
        private DropDownList approv;
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
                strSQL = "SELECT * FROM tbl_attendance where vendor_code='" + Session["User"].ToString() + "' ";

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
                strSQL = "SELECT * FROM tbl_attendance where vendor_code='" + Session["User"].ToString() + "' and workorder = '" + ddlWorkOrder.Text + "' ";
                ///dont delete///strSQL = "SELECT a.*,b.* FROM tbl_vendor_info a, tbl_attendance b where a.vendor_reg_code=b.vendor_code and workorder = '" + ddlWorkOrder.Text + "'";
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
            //var path = Server.MapPath("~/pf_doc");
            //var filePath = Path.Combine(path, "Attendance.csv");
            //// string filePath = @"D:\Visual_Studio_2013_Projects\clms2\clms2\pf_doc\Attendance.csv";
            //FileInfo file = new FileInfo(filePath);
            //if (file.Exists)
            //{
            //    // Clear Rsponse reference  
            //    Response.Clear();
            //    // Add header by specifying file name  
            //    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
            //    // Add header for content length  
            //    Response.AddHeader("Content-Length", file.Length.ToString());
            //    // Specify content type  
            //    Response.ContentType = "text/plain";
            //    // Clearing flush  
            //    Response.Flush();
            //    // Transimiting file  
            //    Response.TransmitFile(file.FullName);
            //    Response.End();
            //}
            //Response.Write("Requested file is not available to download");
        }

        protected void GvAttn_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvAttn.EditIndex = -1;
            BindGrid();
        }

        protected void GvAttn_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvAttn.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GvAttn_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GvAttn.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
           
            TextBox vendor_code = GvAttn.Rows[e.RowIndex].FindControl("txt_vendor_code") as TextBox;
            TextBox emp_code = GvAttn.Rows[e.RowIndex].FindControl("txt_emp_code") as TextBox;
            TextBox emp_name = GvAttn.Rows[e.RowIndex].FindControl("txt_emp_name") as TextBox;
            TextBox department = GvAttn.Rows[e.RowIndex].FindControl("txt_department") as TextBox;
            TextBox year1 = GvAttn.Rows[e.RowIndex].FindControl("txt_year1") as TextBox;
            TextBox month1 = GvAttn.Rows[e.RowIndex].FindControl("txt_month1") as TextBox;
            TextBox d1 = GvAttn.Rows[e.RowIndex].FindControl("txt_d1") as TextBox;
            TextBox d2 = GvAttn.Rows[e.RowIndex].FindControl("txt_d2") as TextBox;
            TextBox d3 = GvAttn.Rows[e.RowIndex].FindControl("txt_d3") as TextBox;
            TextBox d4 = GvAttn.Rows[e.RowIndex].FindControl("txt_d4") as TextBox;
            TextBox d5 = GvAttn.Rows[e.RowIndex].FindControl("txt_d5") as TextBox;
            TextBox d6 = GvAttn.Rows[e.RowIndex].FindControl("txt_d6") as TextBox;
            TextBox d7 = GvAttn.Rows[e.RowIndex].FindControl("txt_d7") as TextBox;
            TextBox d8 = GvAttn.Rows[e.RowIndex].FindControl("txt_d8") as TextBox;
            TextBox d9 = GvAttn.Rows[e.RowIndex].FindControl("txt_d9") as TextBox;
            TextBox d10 = GvAttn.Rows[e.RowIndex].FindControl("txt_d10") as TextBox;
            TextBox d11 = GvAttn.Rows[e.RowIndex].FindControl("txt_d11") as TextBox;
            TextBox d12 = GvAttn.Rows[e.RowIndex].FindControl("txt_d12") as TextBox;
            TextBox d13 = GvAttn.Rows[e.RowIndex].FindControl("txt_d13") as TextBox;
            TextBox d14 = GvAttn.Rows[e.RowIndex].FindControl("txt_d14") as TextBox;
            TextBox d15 = GvAttn.Rows[e.RowIndex].FindControl("txt_d15") as TextBox;
            TextBox d16 = GvAttn.Rows[e.RowIndex].FindControl("txt_d16") as TextBox;
            TextBox d17 = GvAttn.Rows[e.RowIndex].FindControl("txt_d17") as TextBox;
            TextBox d18 = GvAttn.Rows[e.RowIndex].FindControl("txt_d18") as TextBox;
            TextBox d19 = GvAttn.Rows[e.RowIndex].FindControl("txt_d19") as TextBox;
            TextBox d20 = GvAttn.Rows[e.RowIndex].FindControl("txt_d20") as TextBox;
            TextBox d21 = GvAttn.Rows[e.RowIndex].FindControl("txt_d21") as TextBox;
            TextBox d22 = GvAttn.Rows[e.RowIndex].FindControl("txt_d21") as TextBox;
            TextBox d23 = GvAttn.Rows[e.RowIndex].FindControl("txt_d22") as TextBox;
            TextBox d24 = GvAttn.Rows[e.RowIndex].FindControl("txt_d24") as TextBox;
            TextBox d25 = GvAttn.Rows[e.RowIndex].FindControl("txt_d25") as TextBox;
            TextBox d26 = GvAttn.Rows[e.RowIndex].FindControl("txt_d26") as TextBox;
            TextBox d27 = GvAttn.Rows[e.RowIndex].FindControl("txt_d27") as TextBox;
            TextBox d28 = GvAttn.Rows[e.RowIndex].FindControl("txt_d28") as TextBox;
            TextBox d29 = GvAttn.Rows[e.RowIndex].FindControl("txt_d29") as TextBox;
            TextBox d30 = GvAttn.Rows[e.RowIndex].FindControl("txt_d30") as TextBox;
            TextBox d31 = GvAttn.Rows[e.RowIndex].FindControl("txt_d31") as TextBox;

            TextBox Present = GvAttn.Rows[e.RowIndex].FindControl("txt_Present") as TextBox;
            TextBox Absent = GvAttn.Rows[e.RowIndex].FindControl("txt_Absent") as TextBox;
            TextBox tot_working_day = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_working_day") as TextBox;
            TextBox tot_leave = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_leave") as TextBox;
            TextBox tot_holidays = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_holidays") as TextBox;
            TextBox tot_week_off = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_week_off") as TextBox;
            TextBox daily_working_hrs = GvAttn.Rows[e.RowIndex].FindControl("txt_daily_working_hrs") as TextBox;
            TextBox monthly_work_hrs = GvAttn.Rows[e.RowIndex].FindControl("txt_monthly_work_hrs") as TextBox;
            TextBox monthly_ot_hrs = GvAttn.Rows[e.RowIndex].FindControl("txt_monthly_ot_hrs") as TextBox;


            TextBox rmrks = GvAttn.Rows[e.RowIndex].FindControl("txt_DeptRemarks") as TextBox;
            /////approv = GvAttn.Rows[e.RowIndex].FindControl("ddlDeptApproval") as DropDownList;
            ////DropDownList Shift = GvAttn.Rows[e.RowIndex].FindControl("ddlShift") as DropDownList;
            ////DropDownList med_report = GvAttn.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;

            //// 'If approv.SelectedItem.Text = "Reject" Then
            //// '    GvEmp.Columns(1).Visible = False
            //// 'End If

            dbConnection();
            ///////dept_remarks='" + rmrks.Text + "', dept_approval='" + approv.SelectedValue + "'
            string Str = "Update tbl_attendance set vendor_code ='" + vendor_code.Text + "',emp_code = '" + emp_code.Text + "',emp_name ='" + emp_name.Text + "',department = '" + department.Text + "',year1 = " + year1.Text + ",month1 = " + month1.Text + ",d1= '" + d1.Text + "',d2= '" + d2.Text + "',d3= '" + d3.Text + "',d4= '" + d4.Text + "',d5= '" + d5.Text + "',d6= '" + d6.Text + "',d7='" + d7.Text + "',d8='" + d8.Text + "',d9='" + d9.Text + "',d10='" + d10.Text + "',d11='" + d11.Text + "',d12='" + d12.Text + "',d13='" + d13.Text + "',d14='" + d14.Text + "',d15='" + d15.Text + "',d16='" + d16.Text + "',d17='" + d17.Text + "',d18='" + d18.Text + "',d19='" + d19.Text + "',d20='" + d20.Text + "',d21='" + d21.Text + "',d22='" + d22.Text + "',d23='" + d23.Text + "',d24='" + d24.Text + "',d25='" + d25.Text + "',d26='" + d26.Text + "',d27='" + d27.Text + "',d28='" + d28.Text + "',d29='" + d29.Text + "',d30='" + d30.Text + "',d31='" + d31.Text + "',Present=" + Present.Text + ",Absent=" + Absent.Text + ",tot_working_day=" + tot_working_day.Text + ",tot_leave=" + tot_leave.Text + ",tot_holidays=" + tot_holidays.Text + ",tot_week_off=" + tot_week_off.Text + ",daily_working_hrs=" + daily_working_hrs.Text + ",monthly_work_hrs=" + monthly_work_hrs.Text + ",monthly_ot_hrs=" + monthly_ot_hrs.Text + "   where id=" + id.Text + "";    
            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GvAttn.EditIndex = -1;

            BindGrid();
        }

      

       
    }
}