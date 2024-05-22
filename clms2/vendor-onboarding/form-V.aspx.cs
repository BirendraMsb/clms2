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
      
    public partial class form_V : System.Web.UI.Page
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
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if ((!IsPostBack))
               // workorder();
           // year();
            dbConnection();
            VendorDetails();
        }

        public void VendorDetails()
        {
            /// display new wor_entry details int vendor update form '''
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "select vi.vendor_name  from tbl_vendor_info vi  where vi.vendor_reg_code='" + Session["User"].ToString() + "' ";
               // string query = "select vi.vendor_name  from tbl_attendance a,tbl_vendor_info vi  where a.workorder=vi.work_worder  and a.hr_approval='Approved' and a.dept_approval='Approved'  and a.vendor_code='" + Session["User"].ToString() + "' ";
               // string query = "select vi.vendor_name ,vi.firm_address, a.emp_name as Name_of_Workman,vo.nature_of_work,vo.job_location,a.year1 , a.month1 , a.present as no_of_days_workdone, a.monthly_ot_hrs as ot_hrs, e.basic as daily_basic, e.allowance as daily_other_allowance, cast(e.basic*a.present + e.allowance * a.present as decimal(10,2))  as basic_earnings , e.allowance *0 as other_allowance_earnings,cast(a.monthly_ot_hrs * e.[basic]/8 as decimal(10,2))  as ot_earning , cast((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0) as decimal(10,2)) as total_earnings , cast((a.Present * (e.basic +e.allowance) ) * 12/100 as decimal(10,2)) as PF_Deduction , cast( (((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100 as decimal(10,2) )as ESIC_deduction , e.other_deduction , cast( (((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction) as decimal(10,2)) as total_duduction ,cast( (((e.basic*a.present + e.allowance * a.present)  + (a.monthly_ot_hrs * e.[basic]/8)+ (e.allowance *0)) - ((((a.Present * (e.basic +e.allowance) ) * 12/100 ) + ((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) + e.other_deduction))) as decimal(10,2)) as total_payable,a.sign from tbl_attendance a,tbl_emp e,tbl_vendor_work_order vo ,tbl_vendor_info vi  where a.emp_code = e.emp_code and a.workorder = e.workorderno and a.workorder = vo.work_worder and a.workorder=vi.work_worder  and a.hr_approval='Approved' and a.dept_approval='Approved'  and a.month1='" + ddlMonthSearch.SelectedValue + "' and a.year1='" + ddlYearSearch.SelectedItem.Text + "' and a.workorder='" + ddlWorkorder.SelectedItem.Text + "' and a.vendor_code='" + Session["User"].ToString() + "' ";

                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    ////if (r.Read())
                    if(r.HasRows)
                    {
                        if (r.Read())
                        lblVendorName.Text = r["vendor_name"].ToString();
                        else
                            lblVendorName.Text = "----------------";

                    }
                    else
                    {
                        
                    }


                    con.Close();
                }
            }
        }
    }
}