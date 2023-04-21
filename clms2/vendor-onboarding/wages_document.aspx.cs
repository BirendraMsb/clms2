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
    public partial class wages_document : System.Web.UI.Page
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

            if (!IsPostBack)
            {
               // workorder();
                txtVendorCode.Text = usrnm;
                month();
                year();
                
               
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



        private int Auto_ID()
        {
            int x = 0;
            string StrSql = "Select max(id) from tbl_wages_document";
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

        private void month()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_month";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlMonth.DataSource = dt;
                        ddlMonth.DataTextField = "month";
                        ddlMonth.DataValueField = "id";
                        ddlMonth.DataBind();
                    }
                }
            }
            //ddlEmpCode.Items.Insert(0, new ListItem("Select", "0"));
        }

        private void workorder()
        {
            //string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            //string query = "SELECT distinct(a.workorder),vendor_code FROM tbl_Attendance a,tbl_vendor_info v where vendor_code ='" + Session["User"].ToString() + "' ";
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
            //    {
            //        using (DataTable dt = new DataTable())
            //        {
            //            sda.Fill(dt);
            //            ddlWorkdOrder.DataSource = dt;
            //            ddlWorkdOrder.DataTextField = "workorder";
            //            ddlWorkdOrder.DataValueField = "workorder";
            //            ddlWorkdOrder.DataBind();
            //        }
            //    }
            //}
            ////ddlEmpCode.Items.Insert(0, new ListItem("Select", "0"));
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            dbConnection();
            Auto_ID();
           
            string crtime = DateTime.Now.ToString("hhmmssffffff");
            string pffile = PFChallanUpload.FileName;
            string escicfile = EsicChallanUpload.FileName;
            string bankStatmentFile = BankStatementUpload.FileName;
         
            // sets the image path

            string PfimgPath = "../wages_doc_uplouad/pf_doc/" + pffile;
            string EsicimgPath = "../wages_doc_uplouad/esic_doc/" + escicfile;
            string BankStatementPath = "../wages_doc_uplouad/bank_doc/" + bankStatmentFile;

            try
            {

                    if (pffile != "")
                    {
                        decimal PFsize = Math.Round((System.Convert.ToDecimal(PFChallanUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);
                        if ((PFsize > 100))
                        {
                            lblMSGError.Text = "File is too big to upload , Max Size is 100 KB";
                            return;
                        }
                        else
                            PFChallanUpload.SaveAs(Server.MapPath(PfimgPath));
                    }
                    else
                    {
                        lblMSGError.Text = "Select PF PDF";
                        return;
                    }

                    // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-ESIC File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0


                    if (escicfile != "")
                    {

                        decimal ESICsize = Math.Round((System.Convert.ToDecimal(EsicChallanUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                        if ((ESICsize > 100))
                            lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                        else
                            EsicChallanUpload.SaveAs(Server.MapPath(EsicimgPath));
                    }
                    else
                    {
                        lblMSGError.Text = "Select ESIC PDF";
                        return;
                    }

                    if (bankStatmentFile != "")
                    {

                        decimal BankStatementsize = Math.Round((System.Convert.ToDecimal(BankStatementUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                        if ((BankStatementsize > 100))
                            lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                        else
                            BankStatementUpload.SaveAs(Server.MapPath(BankStatementPath));
                    }
                    else
                    {
                        lblMSGError.Text = "Select Bank Statement PDF";
                        return;
                    }

                    //string Str = "insert into tbl_wages_document(id,vendor_code,month, year, total_valid_gp,no_of_emp_paid,man_days,gross_wages_paid,pf_amt_deposited,pf_challan_no,pf_challan_date,esi_amt_deposited,esi_challan_no,esi_challan_date,esi_contribution,pf_contribution,pf_challan_pdf,esic_challan_pdf,bank_statement_pdf" + ")";
                    //Str = Str + " values(" + txtID.Text + ",'" + txtVendorCode.Text + "', " + ddlMonth.SelectedValue + ", " + ddlYear.SelectedItem.Text + "," + txtTotValidGP.Text + ", " + txtNoOfEmpPaid.Text + ", " + txtManDays.Text + ", " + txtGrossWagesPaid.Text + "," + txtPFAmountDeposited.Text + ", " + txtPFChallanNo.Text + ",'" + txtPFChallanDate.Text + "', " + txtEsiAmtDeposited.Text + ", '" + txtEsiChallanNo.Text + "', '" + txtEsiChallanDate.Text + "'," + txtEsiContribution + ", " + txtPFContribution.Text + ",'" + pffile + "', '" + escicfile + "', '" + bankStatmentFile + "')";

                    string Str = "insert into tbl_wages_document(id,vendor_code,month, year, total_valid_gp,no_of_emp_paid,man_days,gross_wages_paid,pf_amt_deposited,pf_challan_no,pf_challan_date,esi_amt_deposited,esi_challan_no,esi_challan_date,esi_contribution,pf_contribution,pf_challan_pdf,esic_challan_pdf,bank_statement_pdf" + ")";
                    Str = Str + " values(" + txtID.Text + ",'" + txtVendorCode.Text + "', " + ddlMonth.SelectedValue + ", " + ddlYear.SelectedItem.Text + "," + txtTotValidGP.Text + "," + txtNoOfEmpPaid.Text + ", " + txtManDays.Text + ", " + txtGrossWagesPaid.Text + "," + txtPFAmountDeposited.Text + ", " + txtPFChallanNo.Text + ",'" + txtPFChallanDate.Text + "'," + txtEsiAmtDeposited.Text + ", '" + txtEsiChallanNo.Text + "', '" + txtEsiChallanDate.Text + "','" + txtEsiContribution.Text + "', '" + txtPFContribution.Text + "','" + pffile + "', '" + escicfile + "', '" + bankStatmentFile + "')";
                
                SqlCommand cmd = new SqlCommand(Str, con);
                    cmd.ExecuteNonQuery();

                    lblMSG.Text = "Data Saved successfully";
                    clear_Field();
            }
            catch (Exception ex)
            {
                lblMSGError.Text = ex.Message;
            }
          




        }


        protected void clear_Field()
        {
            txtTotValidGP.Text = "";
            txtNoOfEmpPaid.Text = "";
            txtManDays.Text = "";
            txtGrossWagesPaid.Text = "";
            txtPFAmountDeposited.Text = "";
            txtPFChallanNo.Text = "";
            txtPFChallanDate.Text = "";
            txtEsiAmtDeposited.Text = "";
            txtPFChallanNo.Text = "";
            txtPFChallanDate.Text = "";
            txtEsiAmtDeposited.Text = "";
            txtEsiChallanNo.Text = "";
            txtEsiChallanDate.Text = "";
            txtEsiContribution.Text = "";
            txtPFContribution.Text = "";
           
 ;

        }





    }



}