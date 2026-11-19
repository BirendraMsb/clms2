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
            string usrnm = Session["User"] != null ? Session["User"].ToString() : "";
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");

            if (!IsPostBack)
            {
                VendorCode();
                month();
                year();
                if (ddlVendorCode.SelectedItem != null && ddlVendorCode.SelectedValue != "Select")
                {
                    txtVendorCode.Text = ddlVendorCode.SelectedValue;
                }
                ShowWagesDetails();
                TotValidGatePass();
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

        private void VendorCode()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string u = Session["User"] != null ? Session["User"].ToString() : "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT distinct vendor_reg_code as vendor_code FROM tbl_vendor_info UNION SELECT distinct vendor_code FROM tbl_attendance order by vendor_code";

                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddlVendorCode.DataSource = dt;
                    ddlVendorCode.DataTextField = "vendor_code";
                    ddlVendorCode.DataValueField = "vendor_code";
                    ddlVendorCode.DataBind();
                }
            }
            ddlVendorCode.Items.Insert(0, new ListItem("Select", "Select"));

            if (!string.IsNullOrEmpty(u))
            {
                ListItem item = ddlVendorCode.Items.FindByValue(u);
                if (item != null)
                {
                    ddlVendorCode.ClearSelection();
                    item.Selected = true;
                    txtVendorCode.Text = u;
                }
            }
        }

        public string GetSelectedVendorCode()
        {
            if (ddlVendorCode != null && ddlVendorCode.SelectedItem != null && ddlVendorCode.SelectedValue != "Select" && !string.IsNullOrEmpty(ddlVendorCode.SelectedValue))
            {
                return ddlVendorCode.SelectedValue.Trim();
            }
            if (!string.IsNullOrEmpty(txtVendorCode.Text))
            {
                return txtVendorCode.Text.Trim();
            }
            if (Session["User"] != null && !string.IsNullOrEmpty(Session["User"].ToString()))
            {
                return Session["User"].ToString().Trim();
            }
            return "";
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
        }

        public void ShowWagesDetails()
        {
            string u = GetSelectedVendorCode();
            if (string.IsNullOrEmpty(u) || ddlMonth.SelectedValue == "Select" || ddlYear.SelectedItem == null || ddlYear.SelectedItem.Text == "Select")
            {
                return;
            }

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select a.vendor_code,count(a.emp_code) as no_of_emp_paid,count(a.emp_code) as esi_contr_in_no,count(a.emp_code) as pf_contr_in_no, a.month1, cast(sum(a.present) as decimal(10,0)) as no_of_days_workdone ,cast(sum(e.[basic]/8) as decimal(10,2)) as daily_rate_of_wages, cast(sum( (( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction)as decimal(10,2)) as Basic_wages,sum(e.basic*0) as Dearness_Allowances , cast(sum(a.monthly_ot_hrs * e.[basic]/8)as decimal(10,2)) as overtime,sum(e.allowance) as other_cash_payment, cast(sum((( a.Present * (e.basic +  e.allowance)) - (a.Present * (e.basic + e.allowance )) * 12/100  - (((a.Present * e.basic)  + (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) - e.other_deduction  + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) as decimal(10,2)) as Total, cast(sum((a.Present * (e.basic +e.allowance) ) * 12/100) as decimal(10,2)) as PF_Deduction, cast(sum((((a.Present * e.basic) +  (a.monthly_ot_hrs * (e.basic + e.allowance)/8))) * 0.75/100) as decimal(10,2)) as ESIC_deduction,sum(e.other_deduction) as other_deduction, cast(sum((((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) - ((a.Present * e.basic ) * 12/100 ) - ((a.Present * e.basic) + e.basic*0 + (a.monthly_ot_hrs * e.[basic]/8) + e.allowance) * 0.75/100) - e.other_deduction) as decimal(10,2))  as Net_Amount_Paid   from tbl_attendance a,tbl_emp e where e.emp_code = a.emp_code and a.vendor_code = e.vendor_code   and a.month1='" + ddlMonth.SelectedValue + "' and a.year1='" + ddlYear.SelectedItem.Text + "'  and a.vendor_code='" + u + "' group by a.vendor_code,a.month1"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtNoOfEmpPaid.Text = r["no_of_emp_paid"] != DBNull.Value ? r["no_of_emp_paid"].ToString() : "";
                        txtManDays.Text = r["no_of_days_workdone"] != DBNull.Value ? r["no_of_days_workdone"].ToString() : "";

                        txtGrossWagesPaid.Text = r["Total"] != DBNull.Value ? r["Total"].ToString() : "";
                        txtPFAmountDeposited.Text = r["PF_Deduction"] != DBNull.Value ? r["PF_Deduction"].ToString() : "";
                        txtEsiAmtDeposited.Text = r["ESIC_deduction"] != DBNull.Value ? r["ESIC_deduction"].ToString() : "";
                        txtEsiContribution.Text = r["esi_contr_in_no"] != DBNull.Value ? r["esi_contr_in_no"].ToString() : "";
                        txtPFContribution.Text = r["pf_contr_in_no"] != DBNull.Value ? r["pf_contr_in_no"].ToString() : "";
                    }
                  
                    con.Close();
                }
            }
        }

        public void TotValidGatePass()
        {
            string u = GetSelectedVendorCode();
            if (string.IsNullOrEmpty(u))
            {
                txtTotValidGP.Text = "0";
                return;
            }

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "select count(e.emp_code) as tot_valid_gatepass from tbl_emp e,tbl_vendor_work_order vwo where e.vendor_code=vwo.vendor_reg_code and convert(date, vwo.valid_to , 103 ) > convert(date , GETDATE() , 103) and e.hr_approval='Approved' and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved' and vwo.vendor_reg_code='" + u + "'";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    object result = null;
                    try
                    {
                        result = cmd.ExecuteScalar();
                    }
                    catch
                    {
                        cmd.CommandText = "select count(e.emp_code) as tot_valid_gatepass from tbl_emp e where e.hr_approval='Approved' and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved' and e.vendor_code='" + u + "'";
                        result = cmd.ExecuteScalar();
                    }

                    if (result != null && result != DBNull.Value)
                    {
                        int count = Convert.ToInt32(result);
                        if (count == 0)
                        {
                            cmd.CommandText = "select count(e.emp_code) from tbl_emp e where e.hr_approval='Approved' and e.dept_approval='Approved' and e.safety_approval='Approved' and e.security_approval='Approved' and e.vendor_code='" + u + "'";
                            object fallback = cmd.ExecuteScalar();
                            if (fallback != null && fallback != DBNull.Value && Convert.ToInt32(fallback) > 0)
                            {
                                count = Convert.ToInt32(fallback);
                            }
                        }
                        txtTotValidGP.Text = count.ToString();
                    }
                    else
                    {
                        txtTotValidGP.Text = "0";
                    }
                    con.Close();
                }
            }
        }

        public string checkDuplicateWegesDocRecord()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string u = GetSelectedVendorCode();
            string query = "SELECT * FROM tbl_wages_document where month='" + ddlMonth.SelectedValue + "' and year='" + ddlYear.SelectedItem.Text + "'  and vendor_code= '" + u + "' ";
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            con.Close();
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
               return "true";
            else
                return "false"; 
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            string venCode = GetSelectedVendorCode();
            txtVendorCode.Text = venCode;

            string duplicate = checkDuplicateWegesDocRecord();
            if (duplicate == "true")
            {
                lblMSGError.Text = "Duplicate";
                return;
            }

            dbConnection();
            Auto_ID();

            string crtime = DateTime.Now.ToString("hhmmssffffff");
            string pffile = PFChallanUpload.FileName;
            string escicfile = EsicChallanUpload.FileName;
            string bankStatmentFile = BankStatementUpload.FileName;

            string pf_ecrfile = PFEcrUpload.FileName;
            string esi_ecrfie = EsiEcrUpload.FileName;

            // sets the image path
            string PfimgPath = "../wages_doc_uplouad/pf_doc/" + pffile;
            string EsicimgPath = "../wages_doc_uplouad/esic_doc/" + escicfile;
            string BankStatementPath = "../wages_doc_uplouad/bank_doc/" + bankStatmentFile;

            string PfEcrImgPath = "../wages_doc_uplouad/pf_ecr_doc/" + pf_ecrfile;
            string EsiEcrImgPath = "../wages_doc_uplouad/esi_ecr_doc/" + esi_ecrfie;

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

                if (pf_ecrfile != "")
                {
                    decimal pf_ecrfilesize = Math.Round((System.Convert.ToDecimal(PFEcrUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);
                    if ((pf_ecrfilesize > 100))
                        lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                    else
                        PFEcrUpload.SaveAs(Server.MapPath(PfEcrImgPath));
                }
                else
                {
                    lblMSGError.Text = "Select PF ECR PDF";
                    return;
                }

                if (esi_ecrfie != "")
                {
                    decimal esi_ecrfiesize = Math.Round((System.Convert.ToDecimal(EsiEcrUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);
                    if ((esi_ecrfiesize > 100))
                        lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                    else
                        EsiEcrUpload.SaveAs(Server.MapPath(EsiEcrImgPath));
                }
                else
                {
                    lblMSGError.Text = "Select ESI ECR PDF";
                    return;
                }

                string Str = "insert into tbl_wages_document(id,vendor_code,month, year, total_valid_gp,no_of_emp_paid,man_days,gross_wages_paid,pf_amt_deposited,pf_challan_no,pf_challan_date,esi_amt_deposited,esi_challan_no,esi_challan_date,esi_contribution,pf_contribution,pf_challan_pdf,esic_challan_pdf,bank_statement_pdf,pf_ecr_file,esi_ecr_file,hr_approval,hr_remarks" + ")";
                Str = Str + " values(" + txtID.Text + ",'" + txtVendorCode.Text + "', " + ddlMonth.SelectedValue + ", " + ddlYear.SelectedItem.Text + "," + txtTotValidGP.Text + "," + txtNoOfEmpPaid.Text + ", " + txtManDays.Text + ", " + txtGrossWagesPaid.Text + "," + txtPFAmountDeposited.Text + ", '" + txtPFChallanNo.Text + "','" + txtPFChallanDate.Text + "'," + txtEsiAmtDeposited.Text + ", '" + txtEsiChallanNo.Text + "', '" + txtEsiChallanDate.Text + "','" + txtEsiContribution.Text + "', '" + txtPFContribution.Text + "','" + pffile + "', '" + escicfile + "', '" + bankStatmentFile + "','" + pf_ecrfile + "','" + esi_ecrfie + "','Pending',' ')";

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
            txtEsiChallanNo.Text = "";
            txtEsiChallanDate.Text = "";
            txtEsiContribution.Text = "";
            txtPFContribution.Text = "";
        }

        protected void ddlVendorCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            clear_Field();
            lblMSGError.Text = "";
            lblMSG.Text = "";
            if (ddlVendorCode.SelectedItem != null && ddlVendorCode.SelectedValue != "Select")
            {
                txtVendorCode.Text = ddlVendorCode.SelectedValue;
            }
            ShowWagesDetails();
            TotValidGatePass();
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            clear_Field();
            lblMSGError.Text = "";
            lblMSG.Text = "";
            ShowWagesDetails();
            TotValidGatePass();
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            clear_Field();
            lblMSGError.Text = "";
            lblMSG.Text = "";
            ShowWagesDetails();
            TotValidGatePass();
        }
    }
}
