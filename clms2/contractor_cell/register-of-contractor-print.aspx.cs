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
    public partial class register_of_contractor_print : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        private void load_report()
        {
            dbConnection();
            try
            {

                string strSQL = "select vwo.id, pe.principal_employer , pe.pe_address ,vi.vendor_name,vi.firm_address,vwo.nature_of_work,vwo.job_location,vwo.valid_from,vwo.valid_to from  tbl_vendor_work_order  vwo, tbl_vendor_info vi, tbl_principal_employer pe where vwo.vendor_reg_code =vi.vendor_reg_code and vwo.status='A'";

                SqlCommand c = new SqlCommand(strSQL, con);
                SqlDataAdapter s = new SqlDataAdapter(c);
                DataTable dt = new DataTable();
                s.Fill(dt);


                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/contractor_cell/register-of-contractor-report.rdlc");
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
           
            }
            catch (Exception ex)
            {
                //Interaction.MsgBox("Can't load Web page" + Constants.vbCrLf + ex.Message);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_report();
            }
        }
    }
}