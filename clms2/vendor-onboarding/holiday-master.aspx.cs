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
    public partial class holiday_master : System.Web.UI.Page
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
            string query = "SELECT * FROM tbl_holiday";
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
            string StrSql = "Select max(id) from tbl_holiday";
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
            string holiday_dt = (row.FindControl("txtHoliday_dt") as TextBox).Text;
            string holiday_code = (row.FindControl("txtHoliday_code") as TextBox).Text;
            string holiday_name = (row.FindControl("txtHoliday_name") as TextBox).Text;
            string holiday_type = (row.FindControl("txtHoliday_type") as TextBox).Text;
            string query = "UPDATE tbl_holiday SET holiday_dt=@holiday_dt,holiday_code=@holiday_code,holiday_name=@holiday_name,holiday_type=@holiday_type WHERE id=@id";

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
                    cmd.Parameters.AddWithValue("@holiday_dt", (Convert.ToDateTime(holiday_dt).ToString("yyyy-MM-dd")));
                    cmd.Parameters.AddWithValue("@holiday_code", holiday_code);
                    cmd.Parameters.AddWithValue("@holiday_name", holiday_name);
                    cmd.Parameters.AddWithValue("@holiday_type", holiday_type);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            int id = Auto_ID();
            string query = "insert into tbl_holiday (id,holiday_dt,holiday_code,holiday_name,holiday_type) values(@id,@holiday_dt,@holiday_code,@holiday_name,@holiday_type)";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@holiday_dt", txtHolidaDate.Text);
                    cmd.Parameters.AddWithValue("@holiday_code", txtHolidayCode.Text);
                    cmd.Parameters.AddWithValue("@holiday_name", txtHolidayName.Text);
                    cmd.Parameters.AddWithValue("@holiday_type", txtHolidaytype.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }



    }
}