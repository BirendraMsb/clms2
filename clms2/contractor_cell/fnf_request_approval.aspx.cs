using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.contractor_cell
{
    public partial class fnf_request_approval : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        private DropDownList approv;
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
               //// workorder();
                Vendor_code();
                BindTableInGrid();
            }
            //////txtYear.Text = DateTime.Now.ToString("yyyy");

        }

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        private void CreateEmptyTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[12] { new DataColumn("id", typeof(string)),
            new DataColumn("work_order", typeof(string)),
            new DataColumn("emp_code",typeof(string)),
            new DataColumn("vendor_code",typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("aadhar_no",typeof(string)),
            new DataColumn("department",typeof(string)),
            new DataColumn("last_working_day",typeof(string)),
            new DataColumn("date_of_request",typeof(string)),
            new DataColumn("reason_for_separation",typeof(string)),
            new DataColumn("hr_approval",typeof(string)),
            new DataColumn("hr_remarks",typeof(string)),
        
           
            });



            ////----------------------------------//
            //string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            ////string query = "SELECT emp_code,emp_name,date,in_time,out_time FROM tbl_manual_punch";
            //string query = "SELECT emp_code,emp_name,basic FROM tbl_emp where vendor_code ='" + Session["User"].ToString() + "' ";
            //DataTable dt_emp;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
            //    {
            //        using (dt_emp = new DataTable())
            //        {

            //            sda.Fill(dt_emp);
            //            string MyString = dt_emp.Rows[0].ItemArray[0].ToString();
            //            //GridView2.DataSource = dt;
            //            //GridView2.DataBind();
            //        }
            //    }
            //}


            //------------------------------------//

            // int dtEmpRowCount = dt_emp.Rows.Count;
            int dtEmpRowCount = 1;
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
                    dr[10] = string.Empty;
                    dr[11] = string.Empty;

       
                }
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }


        private void BindTableInGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[12] { new DataColumn("id", typeof(int)),
           new DataColumn("work_order", typeof(string)),
            new DataColumn("emp_code",typeof(string)),
            new DataColumn("vendor_code",typeof(string)),
            new DataColumn("emp_name",typeof(string)),
            new DataColumn("aadhar_no",typeof(string)),
            new DataColumn("department",typeof(string)),
            new DataColumn("last_working_day",typeof(string)),
            new DataColumn("date_of_request",typeof(string)),
            new DataColumn("reason_for_separation",typeof(string)),
            new DataColumn("hr_approval",typeof(string)),
            new DataColumn("hr_remarks",typeof(string)),
      
            });

            //----------------------------------//
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select a.id, a.work_order,a.emp_code,a.vendor_code,a.emp_name,b.aadhar_no, a.department,a.last_working_day,a.date_of_request,a.reason_for_separation,a.hr_approval,a.hr_remarks from tbl_full_final_request a ,tbl_emp b  where a.emp_code=b.emp_code and a.vendor_code= b.vendor_code and a.work_order=b.workorderno and a.hr_approval !='Approved'";
           //// string query = "select * from tbl_full_final_request where hr_approval !='Approved' or hr_approval is null";
            ////string query = "select * from tbl_full_final_request where work_order= '" + ddlWorkdOrder.SelectedItem.Text + "'";
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
                            ////GridView2.DataSource = null;
                            ////GridView2.DataBind();
                            return;
                        }

                    }
                }
            }


            //------------------------------------//

            int dt1EmpRowCount = dt1.Rows.Count;
            int dt1EmpColCount = 11;
            DataRow dr;
            for (int i = 0; i < dt1EmpRowCount; i++)
            {
                dr = dt.NewRow();
                for (int j = 0; j < dt1EmpColCount; j++)
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
        private void Vendor_code()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(vendor_code) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' ";
            ////  string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlVendorCode.DataSource = dt;
                        ddlVendorCode.DataTextField = "vendor_code";
                        ddlVendorCode.DataValueField = "vendor_code";
                        ddlVendorCode.DataBind();
                    }
                }
            }
            ddlVendorCode.Items.Insert(0, new ListItem("Select", "Select"));
        }
        private void workorder()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct(workorder) FROM tbl_attendance where  hr_approval='Approved' and dept_approval='Approved' and vendor_code ='" + ddlVendorCode.SelectedItem.Text + "'";
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

    

        protected void ddlVendorCode_SelectedIndexChanged(object sender, EventArgs e)
        {
           //// workorder();
        }

        protected void ddlWorkdOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
          ////  BindTableInGrid();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            BindTableInGrid();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            BindTableInGrid();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GridView2.Rows[e.RowIndex].FindControl("id") as Label;
            TextBox rmrks = GridView2.Rows[e.RowIndex].FindControl("hr_remarks") as TextBox;
            approv = GridView2.Rows[e.RowIndex].FindControl("ddlHRApproval") as DropDownList;
            //DropDownList Shift = GvEmp.Rows[e.RowIndex].FindControl("ddlShift") as DropDownList;
            //DropDownList med_report = GvEmp.Rows[e.RowIndex].FindControl("ddlMedReport") as DropDownList;

            //'If approv.SelectedItem.Text = "Reject" Then
            //'    GvEmp.Columns(1).Visible = False
            //'End If

            if (approv.SelectedItem.Text == "Approved")
            {
                rmrks.Text = "";
            }
            //else if (approv.SelectedItem.Text == "Reject")
            //{
            //    if (rmrks.Text=="")
            //    {
            //        rmrks.Focus();
            //    }
            //}

            dbConnection();
            if ( id.Text != "")
            {
             // ' Dim Str As String = "Update tbl_emp set security_remarks='" & rmrks.Text & "', security_approval='" & approv.SelectedValue & "' where id=" & id.Text & ""
            //string Str = "Update tbl_emp set hr_remarks='" + rmrks.Text + "',medical_report='" + med_report.SelectedValue + "', shift='" + Shift.SelectedValue + "', hr_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";
            string Str = "Update tbl_full_final_request set hr_remarks='" + rmrks.Text + "',  hr_approval='" + approv.SelectedValue + "' where id=" + id.Text + "";

            SqlCommand cm = new SqlCommand(Str, con);
            cm.ExecuteNonQuery();

            con.Close();
            GridView2.EditIndex = -1;

            BindTableInGrid();
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void ddlHRApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl_hr_approv = (DropDownList)sender;
            string str = ddl_hr_approv.SelectedValue;
            if (str == "Reject")
                GridView2.Columns[8].Visible = true;
            else
                GridView2.Columns[8].Visible = false;

            // CheckBox chkbox = sender as CheckBox;
            GridViewRow currentRow = ddl_hr_approv.NamingContainer as GridViewRow;
            RequiredFieldValidator rfv = GridView2.Rows[currentRow.RowIndex]
                                               .FindControl("ReqValHRRemarks") as RequiredFieldValidator;
            if (ddl_hr_approv.SelectedItem.Text == "Reject")
            {
                rfv.Enabled = true;
            }
            else
            {
                rfv.Enabled = false;
            }
        }

      

    }
}