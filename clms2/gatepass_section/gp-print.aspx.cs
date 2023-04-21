using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.gatepass_section
{
    public partial class gp_print : System.Web.UI.Page
    {
        private int rcnt;
        private string wrkord;
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        public void Emp_Name_show()
        {
            // Call dbConnection()

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
              //  strSQL = "SELECT * FROM tbl_emp where hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and vendor_code='" + Request.QueryString["Id"] + "'";
                using (SqlCommand cmd = new SqlCommand("select * from tbl_emp  where hr_approval='Approved' and dept_approval='Approved' and safety_approval='Approved' and security_approval='Approved'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtSearch.DataSource = ds.Tables[0];
                        txtSearch.DataTextField = "emp_name";
                        txtSearch.DataValueField = "emp_code";
                        txtSearch.DataBind();
                    }
                }
            }
            txtSearch.Items.Insert(0, new ListItem("--Selec Emp Name--", "0"));
        }
       
        protected void Page_Load(object sender, EventArgs e)
        {

            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            // lblUser1.Text = usrnm
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if ((!IsPostBack))
                Emp_Name_show();
            dbConnection();
        }

        protected void txtSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbConnection();
            try
            {
                if ((IsPostBack))
                {
                    // 'strSQL = "select * from tbl_vendor_work_order where vendor_reg_code = '" & Request.QueryString("vcd") & "'"
                    strSQL = "select b.emp_code, a.valid_from,a.work_worder,a.valid_to,b.emp_name,b.gender,b.blood_grp,a.department,b.vendor_code, b.escic,b.pfno from tbl_vendor_work_order a,tbl_emp b where a.vendor_reg_code = b.vendor_code and b.emp_code='" + txtSearch.SelectedValue + "'";
                    // 'strSQL = "select * from tbl_emp where emp_name = '" + txtSearch.Text + "'"
                    SqlCommand cm = new SqlCommand(strSQL, con);

                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                    {
                        lblGPNo.Text = "100"; //r["valid_from"].ToString(); 
                        lblValidFrom.Text = r["valid_from"].ToString();
                        lblOrderNo.Text = r["work_worder"].ToString();
                        lblValidTo.Text = r["valid_to"].ToString();
                        lblName.Text = r["emp_name"].ToString();
                        lblIdentityMark.Text = "";
                        lblGender.Text = r["gender"].ToString();
                        lblBloodGrp.Text = r["blood_grp"].ToString();
                        lblDepartment.Text = r["department"].ToString();
                        lblVendor.Text = "";
                        lblVendorCode.Text = r["vendor_code"].ToString();
                        lblESICNo.Text = r["escic"].ToString();
                        lblPFNO.Text = r["pfno"].ToString();
                        lblLIC.Text = "";
                    }
                    r.Close();

                    strSQL = "select a.*, b.vendor_name from tbl_emp a, tbl_vendor_info b where a.vendor_code =b.vendor_reg_code and a.emp_code = '" + txtSearch.SelectedValue + "'";    //Request.QueryString["vcd"]
                  ///  strSQL = "select a.*, b.vendor_name from tbl_emp a, tbl_vendor_info b where a.vendor_code =b.vendor_reg_code and a.vendor_code = '" + txtSearch.SelectedValue + "'";    //Request.QueryString["vcd"]
                    SqlCommand cm1 = new SqlCommand(strSQL, con);
                    SqlDataReader r1 = cm1.ExecuteReader();
                    if (r1.Read())
                    {
                        lblGPNo.Text = r1["emp_code"].ToString(); 
                        lblName.Text = r1["emp_name"].ToString();
                        lblIdentityMark.Text = "";
                        lblGender.Text = r1["gender"].ToString();
                        lblBloodGrp.Text = r1["blood_grp"].ToString();
                        lblVendor.Text = r1["vendor_name"].ToString();
                        lblESICNo.Text = r1["escic"].ToString();
                        lblPFNO.Text = r1["pfno"].ToString();
                        string img_name = r1["img_file"].ToString();
                        Image1.ImageUrl = "../emp_pic/" + img_name;
                        lblLIC.Text = "";
                    }
                    r1.Close();
                    con.Close();
                    /// ========= showing image from database-----------'''''

                    //strSQL = "select ImageData from tbl_emp where id = '" + txtSearch.Text + "'";
                    //// '" & txtSearch.SelectedValue & "' "
                    //SqlCommand cm2 = new SqlCommand(strSQL, con);
                    //byte[] bytes = (byte[])cm2.ExecuteScalar();
                    //string strBase64 = Convert.ToBase64String(bytes);
                    //Image1.ImageUrl = "data:Image/png;base64," + strBase64;
                    //con.Close();
                }
            }
            catch (Exception ex)
            {
                //Interaction.MsgBox("Can't load Web page" + Constants.vbCrLf + ex.Message);
            }
        }


    }
}