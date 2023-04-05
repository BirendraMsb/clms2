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
    public partial class shift_master : System.Web.UI.Page
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
                this.BindGrid();

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_shift_master";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        private int Auto_ID()
        {
            int x = 0;
            string StrSql = "Select max(shiftcode) from tbl_shift_master";
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

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            int ShiftCode = Auto_ID();
            string query = "insert into tbl_shift_master (shiftcode,ShiftName,InTime,OutTime,WorkingHrs,WeekOffDay) values(@shiftcode,@ShiftName,@InTime,@OutTime,@WorkingHrs,@WeekOffDay)";
            //string query = "UPDATE tbl_emp SET vendor_code=@vendor_code, emp_name=@emp_name ,skill_category=@skill_category,basic=@basic,allowance=@allowance WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@ShiftCode", ShiftCode);
                    cmd.Parameters.AddWithValue("@ShiftName", txtShiftName.Text);
                    cmd.Parameters.AddWithValue("@InTime", (Convert.ToDateTime(txtInTime.Text).ToString("HH:mm:ss")));
                    cmd.Parameters.AddWithValue("@OutTime", (Convert.ToDateTime(txtOutTime.Text).ToString("HH:mm:ss")));
                    cmd.Parameters.AddWithValue("@WorkingHrs", (Convert.ToDateTime(txtWorkingHrs.Text).ToString("HH:mm:ss")));
                    cmd.Parameters.AddWithValue("@WeekOffDay", ddlWeekOff1.SelectedItem.Text);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string ShiftName = (row.FindControl("txtShiftName") as TextBox).Text;
            string InTime = (row.FindControl("txtInTime") as TextBox).Text;
            string OutTime = (row.FindControl("txtOutTime") as TextBox).Text;
            string query = "UPDATE tbl_shift_master SET ShiftName=@ShiftName,InTime=@InTime,OutTime=@OutTime WHERE shiftcode=@id";
            //string query = "UPDATE tbl_emp SET vendor_code=@vendor_code, emp_name=@emp_name ,skill_category=@skill_category,basic=@basic,allowance=@allowance WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
                    cmd.Parameters.AddWithValue("@ShiftName", ShiftName);
                    cmd.Parameters.AddWithValue("@InTime", InTime);
                    cmd.Parameters.AddWithValue("@OutTime", OutTime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void txtOutTime_TextChanged(object sender, EventArgs e)
        {
            TimeSpan intime = TimeSpan.Parse(txtInTime.Text);
            TimeSpan outtime = TimeSpan.Parse(txtOutTime.Text);
            TimeSpan hrs = outtime - intime;
            txtWorkingHrs.Text = hrs.ToString();
        }


    }
}