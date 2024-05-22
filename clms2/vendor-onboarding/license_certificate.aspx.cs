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
    public partial class license_certificate : System.Web.UI.Page
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
                detals_of_contractor();
            }
        }

        private void detals_of_contractor()
        {
            dbConnection();
            try
            {

                string query = "select vi.vendor_owner_name , vi.owner_address,vi.vendor_name,vi.firm_address,pe.principal_employer,pe.pe_address,vi.valid_from,vi.valid_to,vi.workers_authorised  from tbl_vendor_info vi ,tbl_principal_employer pe ,tbl_attendance a  where vi.work_worder = a.workorder and vi.vendor_reg_code=a.vendor_code and month1 between 1 and 2 and a.vendor_code='111111' group by vi.vendor_owner_name , vi.owner_address,vi.vendor_name,vi.firm_address ,pe.principal_employer,pe.pe_address,vi.valid_from,vi.valid_to,a.daily_working_hrs,vi.workers_authorised ";
                ////string query = "select  e.id ,vi.vendor_owner_name, vi.owner_address, vo.nature_of_work, vo.job_location, vi.vendor_name, vi.firm_address, pe.principal_employer, pe.pe_address from tbl_principal_employer pe, tbl_vendor_work_order vo, tbl_vendor_info vi, tbl_emp e , tbl_full_final_settlement ffs where e.hr_approval='Approved'and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved'and vi.vendor_reg_code=vo.vendor_reg_code  and  vi.vendor_reg_code ='" + Session["User"].ToString() + "'";
               SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    vendor_owner_name.Text = r["vendor_owner_name"].ToString();
                    owner_address.Text = r["owner_address"].ToString();
                    vendor_name.Text = r["vendor_name"].ToString();
                    firm_address.Text = r["firm_address"].ToString();
                    vendor_name.Text = r["vendor_name"].ToString();
                    firm_address.Text = r["firm_address"].ToString();
                    principal_employer.Text = r["principal_employer"].ToString();
                    pe_address.Text = r["pe_address"].ToString();
                    valid_from.Text = r["valid_from"].ToString();
                    valid_to.Text = r["valid_to"].ToString();
                    workers_authorised.Text = r["workers_authorised"].ToString();
                }
                r.Close();
                con.Close();


            }
            catch (Exception ex)
            {
                //Interaction.MsgBox("Can't load Web page" + Constants.vbCrLf + ex.Message);
            }
        }
    }
}