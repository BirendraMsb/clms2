using Microsoft.Reporting.WebForms;
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
    public partial class emp_details_print : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                load_report();
            }
        }

        private void load_report()
        {
            dbConnection();
            try
            {

                string strSQL = "SELECT emp_name, emp_add, emp_ph_no1, emp_ph_no2, email, gender, dob, emp_cast, blood_grp, nationality, aadhar_no, pfno, pf_declaration, escic, esic_declaration, education, police_verification, medical_examination, bank_name, acc_no, ifs_code, emergency_contact_person_name, ecpn_ph_no, img_file, status, remarks, dept_approval, dept_remarks, hr_approval, hr_remarks, safety_approval, safety_remarks, security_approval, security_remarks, workorderno, any_disease, designation, skill_category, police_veryfication_dt, medical_certificate_dt, shift, basic, allowance, start_date_of_blocking, end_date_of_blocking, medical_report, emp_code, city, state, experience, department, domicile_state, domicile_certificate, other_deduction, trade, safety_training, date_of_joining, blocking_by_hr, hr_rem_of_blocking, age_certificate, education_certificate, father_husband_name, Local_address, date_of_termination, Reason_of_termination, id FROM tbl_emp";

                SqlCommand c = new SqlCommand(strSQL, con);
                SqlDataAdapter s = new SqlDataAdapter(c);
                DataTable dt = new DataTable();
                s.Fill(dt);


                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("emp-details.rdlc");
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
              

            }
            catch (Exception ex)
            {
                //Interaction.MsgBox("Can't load Web page" + Constants.vbCrLf + ex.Message);
            }
        }
    }
}