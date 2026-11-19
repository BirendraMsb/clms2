using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.user_dept
{
    public partial class attendance_approval : System.Web.UI.Page
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
              
                string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string dept = Session["User"] != null ? Session["User"].ToString() : "";
                    using (SqlCommand cmd = new SqlCommand("SELECT distinct work_worder from tbl_vendor_work_order where department=@dept"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@dept", dept);
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

        private void BindGrid()
        {
            try
            {
                dbConnection();

                string dept = Session["User"] != null ? Session["User"].ToString() : "";
                strSQL = "SELECT * FROM tbl_attendance where  workorder = '" + ddlWorkOrder.Text + "' and department='" + dept + "' and dept_approval='Pending' and  hr_approval ='Pending' and  year1='" + ddlYear.Text + "' and month1='" + ddlMonth.Text + "' order by month1 desc";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvAttn.DataSource = dt;
                GvAttn.DataBind();
                if (GvAttn.Rows.Count > 0)
                {
                    GvAttn.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception ex)
            {
                lblMSG.Text = ex.Message;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string usrnm = Session["User"] != null ? Session["User"].ToString() : "user_dept";
                lblUser.Text = usrnm;
                // lblUser1.Text = usrnm
                lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
                if (!Page.IsPostBack)
                {
                    workorder();
                    year();
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GvAttn_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvAttn.PageIndex = e.NewPageIndex;
            BindGrid();
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
            Label id = GvAttn.Rows[e.RowIndex].FindControl("lbl_ID") as Label
                    ?? GvAttn.Rows[e.RowIndex].FindControl("lbl_id") as Label;
            string recordId = (id != null && !string.IsNullOrEmpty(id.Text))
                            ? id.Text
                            : (GvAttn.DataKeys[e.RowIndex] != null ? GvAttn.DataKeys[e.RowIndex].Value.ToString() : "");

            TextBox rmrks = GvAttn.Rows[e.RowIndex].FindControl("txt_DeptRemarks") as TextBox;
            string remarksText = rmrks != null ? rmrks.Text : "";

            approv = GvAttn.Rows[e.RowIndex].FindControl("ddlDeptApproval") as DropDownList;
            string approvalValue = approv != null ? approv.SelectedValue : "Approved";

            dbConnection();
            string Str = "Update tbl_attendance set dept_remarks=@dept_remarks, dept_approval=@dept_approval where id=@id";
            SqlCommand cm = new SqlCommand(Str, con);
            cm.Parameters.AddWithValue("@dept_remarks", remarksText);
            cm.Parameters.AddWithValue("@dept_approval", approvalValue);
            cm.Parameters.AddWithValue("@id", recordId);
            cm.ExecuteNonQuery();

            con.Close();
            GvAttn.EditIndex = -1;

            BindGrid();

        }

        protected void ddlDeptApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl_approv = (DropDownList)sender;
            string str = ddl_approv.SelectedValue;
            if (str == "Reject")
                GvAttn.Columns[48].Visible = true;  //Remarks
            else
                GvAttn.Columns[48].Visible = false;

            // CheckBox chkbox = sender as CheckBox;
            GridViewRow currentRow = ddl_approv.NamingContainer as GridViewRow;
            RequiredFieldValidator rfv = GvAttn.Rows[currentRow.RowIndex]
                                               .FindControl("ReqValDeptRemarks") as RequiredFieldValidator;
            if (ddl_approv.SelectedItem.Text == "Reject")
            {
                rfv.Enabled = true;
            }
            else
            {
                rfv.Enabled = false;
            }
        }

        protected void year()
        {
            int currYear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            for (int i = 2010; i < currYear + 5; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
            ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
        }
        protected void btnProcess_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}