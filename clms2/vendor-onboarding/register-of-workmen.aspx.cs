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
    public partial class register_of_workmen : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if (!this.IsPostBack)
            {
                Header_of_reg_of_workman();
                this.BindGrid();
            }
        }

        private void Header_of_reg_of_workman()
        {
            dbConnection();
            try
            {
                string query = "select  e.id ,vi.vendor_owner_name, vi.owner_address, vo.nature_of_work, vo.job_location, vi.vendor_name, vi.firm_address, pe.principal_employer, pe.pe_address from tbl_principal_employer pe, tbl_vendor_work_order vo, tbl_vendor_info vi, tbl_emp e , tbl_full_final_settlement ffs where e.hr_approval='Approved'and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved'and vi.vendor_reg_code=vo.vendor_reg_code  and  vi.vendor_reg_code ='" + Session["User"].ToString() + "'";
               //// string query = "select  e.id ,vi.vendor_owner_name, vi.owner_address, vo.nature_of_work, vo.job_location, vi.vendor_name, vi.firm_address, pe.principal_employer, pe.pe_address, e.emp_name, e.dob as emp_age, e.gender, e.father_husband_name,  e.designation, e.emp_add, e.Local_address,e.date_of_joining ,e.date_of_termination,e.Reason_of_termination  from tbl_principal_employer pe, tbl_vendor_work_order vo, tbl_vendor_info vi, tbl_emp e , tbl_full_final_settlement ffs where e.hr_approval='Approved'and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved'and vi.vendor_reg_code=vo.vendor_reg_code  and  vi.vendor_reg_code ='" + Session["User"].ToString() + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    vendor_owner_name.Text = r["vendor_owner_name"].ToString();
                    owner_address.Text = r["owner_address"].ToString();
                    nature_of_work.Text = r["nature_of_work"].ToString();
                    job_location.Text = r["job_location"].ToString();
                    vendor_name.Text = r["vendor_name"].ToString();
                    firm_address.Text = r["firm_address"].ToString();
                    principal_employer.Text = r["principal_employer"].ToString();
                    pe_address.Text = r["pe_address"].ToString();
                }
                r.Close();
                con.Close();

             
            }
            catch (Exception ex)
            {
                //Interaction.MsgBox("Can't load Web page" + Constants.vbCrLf + ex.Message);
            }
        }
        private void BindGrid()
        {

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select  e.id ,e.vendor_code, vi.vendor_owner_name, vi.owner_address, vo.nature_of_work, vo.job_location, vi.vendor_name, vi.firm_address, pe.principal_employer, pe.pe_address, e.emp_name, e.dob as emp_age, e.gender, e.father_husband_name,  e.designation, e.emp_add, e.Local_address,e.date_of_joining ,e.date_of_termination,e.Reason_of_termination  from tbl_principal_employer pe, tbl_vendor_work_order vo, tbl_vendor_info vi, tbl_emp e , tbl_full_final_settlement ffs where e.hr_approval='Approved'and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved'and vi.vendor_reg_code=vo.vendor_reg_code and e.vendor_code=vo.vendor_reg_code  and  e.vendor_code ='" + Session["User"].ToString() + "'";
           /// string query = "select  e.id ,vi.vendor_owner_name, vi.owner_address, vo.nature_of_work, vo.job_location, vi.vendor_name, vi.firm_address, pe.principal_employer, pe.pe_address, e.emp_name, e.dob as emp_age, e.gender, e.father_husband_name,  e.designation, e.emp_add, e.Local_address,e.date_of_joining ,e.date_of_termination,e.Reason_of_termination  from tbl_principal_employer pe, tbl_vendor_work_order vo, tbl_vendor_info vi, tbl_emp e , tbl_full_final_settlement ffs where e.hr_approval='Approved'and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved'and vi.vendor_reg_code=vo.vendor_reg_code  and  vi.vendor_reg_code ='" + Session["User"].ToString() + "'";
            //string query = "SELECT top 3 * FROM tbl_emp";
            // string query = "SELECT * FROM tbl_emp where vendor_code ='" + Session["User"].ToString() + "' and workorderno= '" + ddlWorkdOrder.SelectedItem.Text + "'  and hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and security_approval='Approved'";
            //// string query = "SELECT * FROM tbl_emp";
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
        //protected void OnPaging(object sender, GridViewPageEventArgs e)
        //{

        //}

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}