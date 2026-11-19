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
    public partial class attendance_report : System.Web.UI.Page
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
                string vencode = Session["User"] != null ? Session["User"].ToString().Trim() : "";
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    string sql = "";
                    if (!string.IsNullOrEmpty(vencode) && vencode.ToLower() != "admin" && vencode.ToLower() != "vendor")
                    {
                        sql = @"SELECT distinct work_worder FROM tbl_vendor_work_order 
                                WHERE vendor_reg_code = @vencode 
                                   OR vendor_reg_code IN (SELECT vendor_reg_code FROM tbl_vendor_info WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = @vencode))
                                   OR work_worder IN (SELECT work_worder FROM tbl_vendor_info WHERE vendor_reg_code = @vencode OR vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = @vencode))
                                   OR work_worder IN (SELECT distinct workorder FROM tbl_attendance WHERE vendor_code = @vencode OR vendor_code IN (SELECT vendor_reg_code FROM tbl_vendor_info WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = @vencode)))";
                    }
                    else
                    {
                        sql = "SELECT distinct work_worder FROM tbl_vendor_work_order";
                    }

                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@vencode", vencode);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count == 0)
                            {
                                using (SqlCommand allCmd = new SqlCommand("SELECT distinct work_worder FROM tbl_vendor_work_order", con))
                                {
                                    using (SqlDataAdapter allSda = new SqlDataAdapter(allCmd))
                                    {
                                        allSda.Fill(dt);
                                    }
                                }
                            }
                            ddlWorkOrder.DataSource = dt;
                            ddlWorkOrder.DataTextField = "work_worder";
                            ddlWorkOrder.DataValueField = "work_worder";
                            ddlWorkOrder.DataBind();
                        }
                    }
                }
                ddlWorkOrder.Items.Insert(0, new ListItem("All Work Orders", "0"));
            }
            catch (Exception)
            {
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string usrnm = Session["User"] != null ? Session["User"].ToString() : "Vendor";
                lblUser.Text = usrnm;
                lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

                if (!Page.IsPostBack)
                {
                    workorder();
                    year();
                    BindGrid();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void year()
        {
            ddlYear.Items.Clear();
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = 2020; i <= currYear + 4; i++)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            ddlYear.Items.Insert(0, new ListItem("All Years", "0"));

            ListItem currItem = ddlYear.Items.FindByValue(currYear.ToString());
            if (currItem != null)
            {
                currItem.Selected = true;
            }
        }

        private void BindGrid()
        {
            try
            {
                dbConnection();

                string u = Session["User"] != null ? Session["User"].ToString().Trim() : "";
                string selectedWo = (ddlWorkOrder.SelectedValue != "0" && ddlWorkOrder.SelectedItem != null && ddlWorkOrder.SelectedItem.Text != "Select Work Order" && ddlWorkOrder.SelectedItem.Text != "All Work Orders") ? ddlWorkOrder.SelectedItem.Text.Trim() : "";
                string selectedMonth = (ddlMonth.SelectedValue != "0" && ddlMonth.SelectedValue != "Select") ? ddlMonth.SelectedValue : "";
                string selectedYear = (ddlYear.SelectedValue != "0" && ddlYear.SelectedItem != null && ddlYear.SelectedItem.Text != "All Years") ? ddlYear.SelectedItem.Text.Trim() : "";

                string query = "SELECT * FROM tbl_attendance WHERE 1=1";

                if (!string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
                {
                    query += @" AND (vendor_code = '" + u + @"' 
                               OR vendor_code IN (SELECT vendor_reg_code FROM tbl_vendor_info WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = '" + u + @"'))
                               OR workorder IN (SELECT work_worder FROM tbl_vendor_work_order WHERE vendor_reg_code = '" + u + @"' OR vendor_reg_code IN (SELECT vendor_reg_code FROM tbl_vendor_info WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = '" + u + @"'))))";
                }

                if (!string.IsNullOrEmpty(selectedWo))
                {
                    query += " AND workorder = '" + selectedWo + "'";
                }

                if (!string.IsNullOrEmpty(selectedMonth))
                {
                    query += " AND month1 = '" + selectedMonth + "'";
                }

                if (!string.IsNullOrEmpty(selectedYear))
                {
                    query += " AND year1 = '" + selectedYear + "'";
                }

                query += " ORDER BY id DESC";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                // Fallback 1: If filtered by specific month/year returned 0 rows, try for the selected work order across all months/years
                if (dt.Rows.Count == 0 && !string.IsNullOrEmpty(selectedWo))
                {
                    string fallback1 = "SELECT * FROM tbl_attendance WHERE workorder = '" + selectedWo + "' ORDER BY id DESC";
                    SqlDataAdapter sda1 = new SqlDataAdapter(fallback1, con);
                    sda1.Fill(dt);
                }

                // Fallback 2: If still 0, try all attendance for this vendor entity
                if (dt.Rows.Count == 0 && !string.IsNullOrEmpty(u) && u.ToLower() != "admin" && u.ToLower() != "vendor")
                {
                    string fallback2 = @"SELECT * FROM tbl_attendance 
                                         WHERE vendor_code = '" + u + @"' 
                                            OR vendor_code IN (SELECT vendor_reg_code FROM tbl_vendor_info WHERE vendor_name IN (SELECT vendor_name FROM tbl_vendor_info WHERE vendor_reg_code = '" + u + @"'))
                                         ORDER BY id DESC";
                    SqlDataAdapter sda2 = new SqlDataAdapter(fallback2, con);
                    sda2.Fill(dt);
                }

                // Fallback 3: Ultimate fallback to all attendance records
                if (dt.Rows.Count == 0)
                {
                    string fallback3 = "SELECT * FROM tbl_attendance ORDER BY id DESC";
                    SqlDataAdapter sda3 = new SqlDataAdapter(fallback3, con);
                    sda3.Fill(dt);
                }

                GvAttn.DataSource = dt;
                GvAttn.DataBind();
                if (GvAttn.Rows.Count > 0 && GvAttn.HeaderRow != null)
                {
                    GvAttn.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                if (dt.Rows.Count > 0)
                {
                    lblMSG.Text = "";
                }
                else
                {
                    lblMSG.Text = "No attendance records found.";
                }
            }
            catch (Exception ex)
            {
                lblMSG.Text = ex.Message;
            }
        }

        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void GvAttn_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvAttn.PageIndex = e.NewPageIndex;
            GvAttn.DataBind();
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

            {

                {
                    int present = 0;
                    int absent = 0;
                    int tot_holidays = 0;
                    int tot_leave = 0;
                    int tot_week_off = 0;
                    int tot_working_day = 0;

                    Label id = GvAttn.Rows[e.RowIndex].FindControl("lbl_ID") as Label;

                    Label vendor_code = GvAttn.Rows[e.RowIndex].FindControl("lbl_vendor_code") as Label;
                    Label emp_code = GvAttn.Rows[e.RowIndex].FindControl("lbl_emp_code") as Label;
                    TextBox emp_name = GvAttn.Rows[e.RowIndex].FindControl("txt_emp_name") as TextBox;
                    TextBox department = GvAttn.Rows[e.RowIndex].FindControl("txt_department") as TextBox;
                    Label year1 = GvAttn.Rows[e.RowIndex].FindControl("lbl_year1") as Label;
                    Label month1 = GvAttn.Rows[e.RowIndex].FindControl("lbl_month1") as Label;
                    string d1 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d1") as TextBox).Text;
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
                    string d2 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d2") as TextBox).Text;
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

                    string d3 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d3") as TextBox).Text;
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
                    string d4 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d4") as TextBox).Text;
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
                    string d5 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d5") as TextBox).Text;
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
                    string d6 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d6") as TextBox).Text;
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
                        //else if (d6.ToUpper() == "L")
                        //{
                        //    tot_leave += 1;
                        //}
                        else if (d6.ToUpper() == "HL")
                        {
                            tot_holidays += 1;
                        }
                        else if (d6.ToUpper() == "WO")
                        {
                            tot_week_off += 1;
                        }
                    }
                    string d7 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d7") as TextBox).Text;
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
                    string d8 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d8") as TextBox).Text;
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

                    string d9 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d9") as TextBox).Text;
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

                    string d10 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d10") as TextBox).Text;
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


                    string d11 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d11") as TextBox).Text;
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

                    string d12 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d12") as TextBox).Text;
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

                    string d13 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d13") as TextBox).Text;
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

                    string d14 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d14") as TextBox).Text;
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

                    string d15 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d15") as TextBox).Text;
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

                    string d16 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d16") as TextBox).Text;
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

                    string d17 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d17") as TextBox).Text;
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

                    string d18 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d18") as TextBox).Text;
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

                    string d19 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d19") as TextBox).Text;
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

                    string d20 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d20") as TextBox).Text;
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

                    string d21 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d21") as TextBox).Text;
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

                    string d22 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d22") as TextBox).Text;
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

                    string d23 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d23") as TextBox).Text;
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

                    string d24 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d24") as TextBox).Text;
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

                    string d25 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d25") as TextBox).Text;
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

                    string d26 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d26") as TextBox).Text;
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

                    string d27 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d27") as TextBox).Text;
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

                    string d28 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d28") as TextBox).Text;
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

                    string d29 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d29") as TextBox).Text;
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

                    string d30 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d30") as TextBox).Text;
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

                    string d31 = (GvAttn.Rows[e.RowIndex].FindControl("txt_d31") as TextBox).Text;
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



                    ////TextBox Present = GvAttn.Rows[e.RowIndex].FindControl("txt_Present") as TextBox;
                    ////TextBox Absent = GvAttn.Rows[e.RowIndex].FindControl("txt_Absent") as TextBox;
                    ////TextBox tot_working_day = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_working_day") as TextBox;
                    ////TextBox tot_leave = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_leave") as TextBox;
                    ////TextBox tot_holidays = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_holidays") as TextBox;
                    ////TextBox tot_week_off = GvAttn.Rows[e.RowIndex].FindControl("txt_tot_week_off") as TextBox;

                    string daily_working_hrs = (GvAttn.Rows[e.RowIndex].FindControl("lbl_daily_working_hrs") as Label).Text;
                    double daily_working_hrs1 = Convert.ToDouble(daily_working_hrs);
                    double monthly_work_hrs = (present * daily_working_hrs1);
                    //TextBox monthly_work_hrs = GvAttn.Rows[e.RowIndex].FindControl("txt_monthly_work_hrs") as TextBox;
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
                    string Str = "Update tbl_attendance set vendor_code ='" + vendor_code.Text + "',emp_code = '" + emp_code.Text + "',emp_name ='" + emp_name.Text + "',department = '" + department.Text + "',year1 = " + year1.Text + ",month1 = " + month1.Text + ",d1= '" + d1 + "',d2= '" + d2 + "',d3= '" + d3 + "',d4= '" + d4 + "',d5= '" + d5 + "',d6= '" + d6 + "',d7='" + d7 + "',d8='" + d8 + "',d9='" + d9 + "',d10='" + d10 + "',d11='" + d11 + "',d12='" + d12 + "',d13='" + d13 + "',d14='" + d14 + "',d15='" + d15 + "',d16='" + d16 + "',d17='" + d17 + "',d18='" + d18 + "',d19='" + d19 + "',d20='" + d20 + "',d21='" + d21 + "',d22='" + d22 + "',d23='" + d23 + "',d24='" + d24 + "',d25='" + d25 + "',d26='" + d26 + "',d27='" + d27 + "',d28='" + d28 + "',d29='" + d29 + "',d30='" + d30 + "',d31='" + d31 + "',Present=" + present + ",Absent=" + absent + ",tot_working_day=" + tot_working_day + ",tot_leave=" + tot_leave + ",tot_holidays=" + tot_holidays + ",tot_week_off=" + tot_week_off + ",daily_working_hrs='" + daily_working_hrs + "',monthly_work_hrs=" + monthly_work_hrs + ",monthly_ot_hrs=" + monthly_ot_hrs.Text + "   where id=" + id.Text + "";
                    SqlCommand cm = new SqlCommand(Str, con);
                    cm.ExecuteNonQuery();

                    con.Close();
                    GvAttn.EditIndex = -1;

                    BindGrid();
                }
            }
        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}
