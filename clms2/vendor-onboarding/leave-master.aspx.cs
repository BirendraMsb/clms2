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
    public partial class leave_master : System.Web.UI.Page
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
            string query = "SELECT * FROM tbl_leave";
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
            string StrSql = "Select max(id) from tbl_leave";
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
            string LeaveCode = (row.FindControl("txtLeaveCode") as TextBox).Text;
            string LeaveType = (row.FindControl("txtLeaveType") as TextBox).Text;
            //string LeaveType = (row.FindControl("txtLeaveType") as DropDownList).SelectedItem.Text;
            string isPaid = (row.FindControl("txtPaid") as TextBox).Text;
            string query = "UPDATE tbl_leave SET leave_code=@LeaveCode,leave_type=@LeaveType,isPaid=@isPaid WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
                    cmd.Parameters.AddWithValue("@LeaveCode", LeaveCode);
                    cmd.Parameters.AddWithValue("@LeaveType", LeaveType);
                    cmd.Parameters.AddWithValue("@isPaid", isPaid);

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
            string query = "insert into tbl_leave (id,leave_code,Leave_type,isPaid) values(@id,@leave_code,@Leave_type,@isPaid)";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@leave_code", txtLeaveCode.Text);
                    cmd.Parameters.AddWithValue("@Leave_type", ddlLeaveType.Text);
                    cmd.Parameters.AddWithValue("@isPaid", ddlPaid.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        private  DataTable getLeaveType()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_leave";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            ////----------alert for deleting row ----------------//
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[4].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }



            ////--- showing leave type in dropdownlist box-----////
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            //    {
            //        DropDownList ddLeaveType = (DropDownList)e.Row.FindControl("txtLeaveType");

            //        //return DataTable havinf department data
            //        DataTable dt = getLeaveType();
            //        ddLeaveType.DataSource = dt;
            //        ddLeaveType.DataTextField = "leave_type";
            //        ddLeaveType.DataValueField = "id";
            //        ddLeaveType.DataBind();

            //        DataRowView dr = e.Row.DataItem as DataRowView;
            //        ddLeaveType.SelectedValue = dr["id"].ToString();
            //    }
            //}
            /////-----------------------------------------------------------------///
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "Delete from tbl_leave WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", Id);
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