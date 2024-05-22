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
    public partial class annual_return : System.Web.UI.Page
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
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");

            if (!Page.IsPostBack)
            {
                year();
                //VendorCode();
                details_of_Anual_Return();
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

        private void details_of_Anual_Return()
        {
            dbConnection();
            try
            {
                string query = "select pe.principal_employer , pe.pe_address,pe.name_of_establishment,pe.district_of_establishment,pe.address_of_establishment,pe.nature_of_operation_estb,pe.name_of_manager_control_estb,sum(vi.workers_authorised) as max_no_workman_as_contract_Lab,sum(vi.workers_authorised) as max_no_workman_as_employed_directly,pe.nature_of_work_cont_lab_employed from tbl_principal_employer pe , tbl_vendor_info vi   group by pe.principal_employer , pe.pe_address,pe.name_of_establishment,pe.district_of_establishment,pe.address_of_establishment,pe.nature_of_operation_estb,pe.name_of_manager_control_estb,pe.nature_of_work_cont_lab_employed ";
               /// string query = "select pe.principal_employer,pe.pe_address,vi.vendor_name as name_of_establishment ,vi.firm_city,vi.firm_address,vi.vendor_owner_name as name_of_manager,vi.workers_authorised max_no_workman_as_contract_Lab,sum(a.Present) Tot_no_of_days_cont_lab_employed,sum(a.Present) Tot_no_of_man_days_work_by_cont_lab,vi.workers_authorised max_no_workman_as_employed_directly,sum(a.Present) Tot_no_of_days_directly_lab_employed,sum(a.Present) Tot_no_of_man_days_wosrked_by_directly_lab,vwo.nature_of_work from tbl_vendor_info vi ,tbl_principal_employer pe ,tbl_attendance a, tbl_vendor_work_order vwo   where  vi.vendor_reg_code=a.vendor_code and vwo.vendor_reg_code= a.vendor_code and month1 between 1 and 12 and a.vendor_code='" + ddlVendorCode.SelectedItem.Text + "'  group by pe.principal_employer,pe.pe_address,vi.vendor_name,vi.firm_city,vi.firm_address,vwo.nature_of_work,vi.vendor_owner_name,vi.workers_authorised ";
                ////string query = "select  e.id ,vi.vendor_owner_name, vi.owner_address, vo.nature_of_work, vo.job_location, vi.vendor_name, vi.firm_address, pe.principal_employer, pe.pe_address from tbl_principal_employer pe, tbl_vendor_work_order vo, tbl_vendor_info vi, tbl_emp e , tbl_full_final_settlement ffs where e.hr_approval='Approved'and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved'and vi.vendor_reg_code=vo.vendor_reg_code  and  vi.vendor_reg_code ='" + Session["User"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                {
                    txtPrincipalEmpName.Text = r["principal_employer"].ToString();
                    txtPrincipalEmpAddress.Text = r["pe_address"].ToString();
                    txtNameOfEstb.Text = r["name_of_establishment"].ToString();
                    txtDistrict.Text = r["district_of_establishment"].ToString();
                    txtPostalAddr.Text = r["address_of_establishment"].ToString();
                    txtNatureOfOperation.Text = r["nature_of_operation_estb"].ToString(); ;
                    txtNameResSupervsr.Text = r["name_of_manager_control_estb"].ToString();

                    txtMaxNumWorkmanEmployedAsContractLab.Text = r["max_no_workman_as_contract_Lab"].ToString();
                    //txtTot_no_of_days_cont_lab_employed.Text = r["Tot_no_of_days_cont_lab_employed"].ToString();
                    //txtTot_no_of_man_days_work_by_cont_lab.Text = r["Tot_no_of_man_days_work_by_cont_lab"].ToString();
                    txtMax_no_workman_as_employed_directly.Text = r["max_no_workman_as_employed_directly"].ToString();

                    //txtTot_no_of_days_directly_lab_employed.Text = r["Tot_no_of_days_directly_lab_employed"].ToString();
                    //txtTot_no_of_man_days_wosrked_by_directly_lab.Text = r["Tot_no_of_man_days_wosrked_by_directly_lab"].ToString();
                    txtNature_of_work.Text = r["nature_of_work_cont_lab_employed"].ToString();
                    //txtAmtOfSecurityDepByContractor.Text ="";
                    //txtAmtofSecurityDepForfeited.Text = "";
                    //txtChangeInManagement.Text = "";

                }
                r.Close();
               

                ///--------Show from Attendance Table-------------------------------------------------------------------------//
                string query1 = "select  sum(a.Present) Tot_no_of_days_cont_lab_employed,sum(a.Present) Tot_no_of_man_days_work_by_cont_lab,sum(a.Present) Tot_no_of_days_directly_lab_employed,sum(a.Present) Tot_no_of_man_days_wosrked_by_directly_lab from tbl_attendance a where year1 = '" + ddlYear.SelectedItem.Text + "'";
 
                SqlCommand cmd1 = new SqlCommand(query1, con);

                SqlDataReader r1 = cmd1.ExecuteReader();
                if (r1.Read())
                {


                    txtTot_no_of_days_cont_lab_employed.Text = r1["Tot_no_of_days_cont_lab_employed"].ToString();
                    txtTot_no_of_man_days_work_by_cont_lab.Text = r1["Tot_no_of_man_days_work_by_cont_lab"].ToString();


                    txtTot_no_of_days_directly_lab_employed.Text = r1["Tot_no_of_days_directly_lab_employed"].ToString();
                    txtTot_no_of_man_days_wosrked_by_directly_lab.Text = r1["Tot_no_of_man_days_wosrked_by_directly_lab"].ToString();

                    txtAmtOfSecurityDepByContractor.Text = "";
                    txtAmtofSecurityDepForfeited.Text = "";
                    txtChangeInManagement.Text = "";

                }
                r1.Close();
                con.Close();





            }
            catch (Exception ex)
            {
                //Interaction.MsgBox("Can't load Web page" + Constants.vbCrLf + ex.Message);
            }
        }

        private void VendorCode()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;

            string query = "SELECT distinct vendor_code FROM tbl_Attendance a,tbl_vendor_info v where a.vendor_code=v.vendor_reg_code   ";
            /////string query = "SELECT distinct(a.workorder),a.vendor_code FROM tbl_Attendance a,tbl_vendor_info v where a.vendor_code = v.vendor_reg_code ";
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

        protected void ddlVendorCode_SelectedIndexChanged(object sender, EventArgs e)
        {
           //// details_of_Anual_Return();
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            details_of_Anual_Return();
        }
    }
}