﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace clms2.vendor_onboarding
{
    public partial class emp_onboarding : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        int count_emp = 0;
        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        public void work_order_no()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT  distinct work_worder FROM tbl_vendor_work_order where status='A' and vendor_reg_code=" + Session["User"] + " "))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtWorkOrderNo.DataSource = ds.Tables[0];
                        txtWorkOrderNo.DataTextField = "work_worder";
                        txtWorkOrderNo.DataValueField = "work_worder";
                        txtWorkOrderNo.DataBind();
                    }
                }
            }
           /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            txtWorkOrderNo.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void cast()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_cast"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlCast.DataSource = ds.Tables[0];
                        ddlCast.DataTextField = "cast";
                        ddlCast.DataValueField = "cast";
                        ddlCast.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlCast.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void blood_group()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_blood_group"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlBloodGrp.DataSource = ds.Tables[0];
                        ddlBloodGrp.DataTextField = "blood_group";
                        ddlBloodGrp.DataValueField = "blood_group";
                        ddlBloodGrp.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlBloodGrp.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void designation()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_designation"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlDesignation.DataSource = ds.Tables[0];
                        ddlDesignation.DataTextField = "designation";
                        ddlDesignation.DataValueField = "designation";
                        ddlDesignation.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlDesignation.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void education()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_education"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlEducation.DataSource = ds.Tables[0];
                        ddlEducation.DataTextField = "education";
                        ddlEducation.DataValueField = "education";
                        ddlEducation.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlEducation.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void non_matric()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_non_matric"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }

            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void matric()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_matric"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }

            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void ITI()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_ITI"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }

            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }

     
        public void Intermediate()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_intermediate"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }

            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void Engineering()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_engineering"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }

            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void Graduation()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_graduation"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }
            
            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void master_degree()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_master_degree"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlTrade.DataSource = ds.Tables[0];
                        ddlTrade.DataTextField = "trade";
                        ddlTrade.DataValueField = "trade";
                        ddlTrade.DataBind();
                    }
                }
            }

            ddlTrade.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void skill_category()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_skill_cat"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlSkill.DataSource = ds.Tables[0];
                        ddlSkill.DataTextField = "skill_cat";
                        ddlSkill.DataValueField = "id";
                        ddlSkill.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlSkill.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void state()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_state"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlState.DataSource = ds.Tables[0];
                        ddlState.DataTextField = "state";
                        ddlState.DataValueField = "state";
                        ddlState.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlState.Items.Insert(0, new ListItem("Select", "Select"));
        }

        public void domicile_state()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_state"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlDomState.DataSource = ds.Tables[0];
                        ddlDomState.DataTextField = "state";
                        ddlDomState.DataValueField = "state";
                        ddlDomState.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlDomState.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void bank()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from tbl_bank"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlBankName.DataSource = ds.Tables[0];
                        ddlBankName.DataTextField = "bank_name";
                        ddlBankName.DataValueField = "bank_name";
                        ddlBankName.DataBind();
                    }
                }
            }
            /// txtWorkOrderNo.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlBankName.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void shift_name()
        {
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT  * FROM tbl_shift_master"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        txtShift.DataSource = ds.Tables[0];
                        txtShift.DataTextField = "ShiftName";
                        txtShift.DataValueField = "ShiftName";
                        txtShift.DataBind();
                    }
                }
            }
            ///txtShift.Items.Insert(0, new ListItem("--Select Shift--", "0"));
            txtShift.Items.Insert(0, new ListItem("Select", "Select"));
        }

        // ' show  vendor reg code on selecting work order no''
        public void vendor_reg_code()
        {
            dbConnection();
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT  distinct vendor_reg_code,department FROM tbl_vendor_work_order where work_worder= '" + txtWorkOrderNo.SelectedValue + "' and status='A'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();

                    if ((r.Read()))
                    {
                        txtVendorCode.Text = r["vendor_reg_code"].ToString();
                        txtDepart.Text = r["department"].ToString();
                    }
                       
                    r.Close();
                    con.Close();
                }
            }
        }

        ////public void check_DOB()
        ////{
        ////    if ((txtDOB.Text != string.Empty))
        ////    {
        ////        var userBirthDateText = txtDOB.Text;
        ////        var userBirthDate = DateTime.ParseExact(userBirthDateText.Replace("/", "-"), "dd-MM-yyyy", null/* TODO Change to default(_) if this is not a reference type */);
        ////        var currentDate = DateTime.Now;
        ////        var age = Math.Floor(currentDate.Subtract(userBirthDate).TotalDays / 365);

        ////        if ((age < 18 | age > 60))
        ////        {
        ////            lblDobError.Text = "Age should be between 18 and 60 Years";
        ////            lblDobError.ForeColor = System.Drawing.Color.Red;
        ////            return;
        ////        }
        ////        else
        ////        {
        ////            lblDobError.ForeColor = System.Drawing.Color.Black;
        ////            lblDobError.Text = string.Empty;
        ////        }
             
        ////    }
        ////}
        protected void Page_Load(object sender, EventArgs e)
        {
            // If (Session("User") = "") Then
            // Response.Redirect("../login/login.aspx")
            // Else
            //lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            /// String.Format("{0:dd/MM/yyyy}", txtMCID.Text);

            if ((!IsPostBack))
            {
                domicile_state();
                txtBasic.Text = "0";
                txtPFNO.Visible = false;
                txtESIC.Visible = false;
                PFileUpload.Visible = false;
                ESICFileUpload.Visible = false;
                lblPFfileSizeMsg.Visible = false;
                lblEsicfileSizeMsg.Visible=false;
      
                work_order_no();
                shift_name();
                cast();
                designation();
                blood_group();
                education();
                skill_category();
                state();
                bank();
        
            }
            //-------this updte is not working----------//
            ////try
            ////{
            ////    lblUser.Text = Session["User"].ToString();
            ////    if (!Page.IsPostBack)
            ////    {
            ////        txtPFNO.Visible = false;
            ////        PFileUpload.Visible = false;
            ////        txtESIC.Visible = false;
            ////        ESICFileUpload.Visible = false;

            ////        if ((Convert.ToInt16((Session["EmpID"])) < 0 | Session["User"] == null/* TODO Change to default(_) if this is not a reference type */))
            ////        {
            ////        }
            ////        else
            ////        {
            ////            dbConnection();
            ////            string gv_id = Session["EmpID"].ToString();

            ////            strSQL = "select * from tbl_emp where id = " + gv_id + "";
            ////            SqlCommand cm = new SqlCommand(strSQL, con);
            ////            SqlDataReader r = cm.ExecuteReader();
            ////            if (r.Read())
            ////            {
            ////                txtEmpName.Text = r["emp_name"].ToString();
            ////                txtWorkOrderNo.Text = r["workorderno"].ToString();
            ////                txtVendorCode.Text = r["vendor_code"].ToString();
            ////                txtEmpCode.Text = r["emp_code"].ToString();
            ////                txtAddress.Text = r["emp_add"].ToString();
            ////                txtEMail.Text = r["email"].ToString();
            ////                txtPhNo1.Text = r["emp_ph_no1"].ToString();
            ////                txtPhNo2.Text = r["emp_ph_no2"].ToString();
            ////                txtDOB.Text = r["dob"].ToString();
            ////                ddlGender.Text = r["gender"].ToString();
            ////                ddlCast.Text = r["emp_cast"].ToString();
            ////                ddlBloodGrp.Text = r["blood_grp"].ToString();
            ////                // RadioButton1.Checked = True
            ////                // RadioButton2.Checked = True
            ////                txtDiseaseName.Text = r["any_disease"].ToString();
            ////                txtNationality.Text = r["nationality"].ToString();
            ////                txtAadharNo.Text = r["aadhar_no"].ToString();
            ////                ddlDesignation.Text = r["designation"].ToString();
            ////                // pfRadio1.Checked = True
            ////                // pfRadio2.Checked = True
            ////                txtPFNO.Text = r["pfno"].ToString();
            ////                // PFileUpload
            ////                // ESICRadio1.Checked = True
            ////                // ESICRadio2.Checked = True
            ////                txtESIC.Text = r["escic"].ToString();
            ////                // ESICFileUpload
            ////                ddlEducation.Text = r["education"].ToString();
            ////                ddlSkill.Text = r["skill_category"].ToString();
            ////                // txtPoliceVerification.Text = r("")
            ////                txtPVD.Text = r["police_veryfication_dt"].ToString();
            ////                txtPVD.Text = (Convert.ToDateTime(txtPVD.Text)).ToString("MM-dd-yyyy");
            ////                // txtMedicalExamination.Text = r("")
            ////                txtMCID.Text = r["medical_certificate_dt"].ToString();
            ////                txtMCID.Text = (Convert.ToDateTime(txtMCID.Text)).ToString("MM-dd-yyyy");
            ////                ddlBankName.Text = r["bank_name"].ToString();
            ////                txtAccountNo.Text = r["acc_no"].ToString();
            ////                txtIFSC.Text = r["ifs_code"].ToString();
            ////                txtContactPerson.Text = r["emergency_contact_person_name"].ToString();
            ////                txtContactNo.Text = r["ecpn_ph_no"].ToString();
            ////                // FileUpload1


            ////                cmdSave.Text = "Update";
            ////            }
            ////            r.Close();
            ////            Session["EmpID"] = 0;
            ////        }
            ////    }
            ////}
            ////// End If -   /////


            ////catch (Exception ex)
            ////{
            ////}

        }

        private void Auto_Emp_Code()
        {
          
            // ------------cont vendor and workorderwise ---------//

            using (SqlConnection con1 = new SqlConnection(Conn))
            {
                using (SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) As Count FROM tbl_emp where vendor_code ='" + Session["User"] + "' and workorderno ='" + txtWorkOrderNo.SelectedItem.Text + "'", con1))
                {
                    cmd1.CommandType = CommandType.Text;
                    con1.Open();
                    object o = cmd1.ExecuteScalar();
                    if (o != null)
                    {
                        count_emp = (int)o;

                        if (count_emp >= 0)
                        {
                            count_emp = count_emp + 1;
                        }
                      
                    }
                  
                    con1.Close();
                }

                txtEmpCode.Text = Session["User"].ToString() + "-" + txtWorkOrderNo.SelectedItem.Text + "-" + count_emp;

            }

            //-------------------------------------------------------
           // int x = 0;
           // string StrSql = "Select max(Emp_Code) from tbl_emp";
           // SqlCommand cmd = new SqlCommand(StrSql, con);
           // if (con.State == ConnectionState.Closed)
           //     con.Open();
           // SqlDataReader dr = cmd.ExecuteReader();
           // try
           // {
           //     if ((dr.Read()))
           //     {
           //         if ((dr[0] == DBNull.Value))
           //             x = 1;
           //         else
           //             x = (Convert.ToInt16(dr[0]) + 1);
           //     }
           //     else
           //             x = 1;
           // }
           // catch (Exception ex)
           // {
           // }
           // dr.Close();
           //// x = Convert.ToInt16(txtID.Text);
           // return x;
        }
        private int Auto_ID()
        {
            int x=0;

            string StrSql = "Select max(id) from tbl_emp";
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
                        txtID.Text =(Convert.ToInt16(dr[0]) + 1).ToString();
                }
                else
                    txtID.Text = "1";
            }
            catch (Exception ex)
            {
            }
            dr.Close();

            return x;
        }

       

        //private void cmdSave_Click(object sender, System.EventArgs e)
        //{
        //dbConnection();
        //Auto_ID();
        //check_DOB();
        //string imgName = FileUpload1.FileName;
        //string pffile = PFileUpload.FileName;
        //string escicfile = ESICFileUpload.FileName;
        //string policeverification = PVFileUpload.FileName;
        //string medicalexamination = MVFileUpload.FileName;

        //// sets the image path
        //string empimgPath = "../emp_pic/" + imgName;
        //string PfimgPath = "../pf_doc/" + pffile;
        //string EsicimgPath = "../esic_doc/" + escicfile;
        //string PoliceVerimgPath = "../police_verification_doc/" + policeverification;
        //string MedicalExamimgPath = "../medical_examination_doc/" + medicalexamination;
        //// get the size in bytes that

        //string crtime = DateTime.Now.ToString("hhmmssffffff");

        //// Dim extension As String = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName)
        //// FileUpload1.PostedFile.SaveAs(imgPath & "vnd" & crtime & extension)

        //int imgSize = FileUpload1.PostedFile.ContentLength;

        //// validates the posted file before saving

        //if ((PVFileUpload.PostedFile.FileName != "" & MVFileUpload.PostedFile.FileName != ""))
        //{

        //    // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-UAN File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0



        //    if (pffile != "")
        //    {
        //        // ''Dim PFimg As System.Drawing.Image = System.Drawing.Image.FromStream(PFileUpload.PostedFile.InputStream)
        //        // ''Dim PFheight As Integer = PFimg.Height
        //        // ''Dim PFwidth As Integer = PFimg.Width
        //        decimal PFsize = Math.Round((System.Convert.ToDecimal(PFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);
        //        if ((PFsize > 100))
        //        {
        //            lblMSG.Text = "File is too big to upload , Max Size is 100 KB";
        //            return;
        //        }
        //        else
        //            PFileUpload.SaveAs(Server.MapPath(PfimgPath));
        //    }

        //    // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-ESIC File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0


        //    if (escicfile != "")
        //    {

        //        // ''Dim ESICimg As System.Drawing.Image = System.Drawing.Image.FromStream(ESICFileUpload.PostedFile.InputStream)
        //        // ''Dim ESICheight As Integer = ESICimg.Height
        //        // ''Dim ESICwidth As Integer = ESICimg.Width
        //        decimal ESICsize = Math.Round((System.Convert.ToDecimal(ESICFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

        //        if ((ESICsize > 100))
        //            lblMSG.Text = "File is too big to upload, Max Size is 100 KB";
        //        else
        //            ESICFileUpload.SaveAs(Server.MapPath(EsicimgPath));
        //    }

        //    // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-Police Verification File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0
        //    HttpPostedFile pvPostedFile = PVFileUpload.PostedFile;
        //    string pvFilename = Path.GetFileName(pvPostedFile.FileName);
        //    string pvFileExtension = Path.GetExtension(pvFilename);
        //    int pvFileSize = pvPostedFile.ContentLength;

        //    // ''Dim pvStream As Stream = pvPostedFile.InputStream
        //    // ''Dim pvBinaryReader As BinaryReader = New BinaryReader(pvStream)
        //    // ''Dim pvImagebytes As Byte() = pvBinaryReader.ReadBytes(CInt(pvStream.Length))


        //    decimal Policesize = Math.Round((System.Convert.ToDecimal(PVFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

        //    if ((Policesize > 100))
        //    {
        //        lblMSG.Text = "File is too big to upload , Max Size is 100 KB";
        //        return;
        //    }
        //    else
        //        PVFileUpload.PostedFile.SaveAs(Server.MapPath(PoliceVerimgPath));

        //    // '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        //    // ''Dim Policeimg As System.Drawing.Image = System.Drawing.Image.FromStream(PVFileUpload.PostedFile.InputStream)
        //    // Dim Policeimg As HttpPostedFile = PVFileUpload.PostedFile
        //    // 'Dim Policeheight As Integer = Policeimg.Height
        //    // 'Dim Policewidth As Integer = Policeimg.Width

        //    // Dim Policesize As Decimal = Math.Round((CDec(PVFileUpload.PostedFile.ContentLength) / CDec(1024)), 2)

        //    // If (Policesize > 100) Then
        //    // lblMSG.Text = "File is too big to upload"
        //    // Else

        //    // PVFileUpload.PostedFile.SaveAs(Server.MapPath(PoliceVerimgPath))

        //    // End If
        //    // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-Medical Examination File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0

        //    HttpPostedFile mvPostedFile = MVFileUpload.PostedFile;
        //    string mvFilename = Path.GetFileName(mvPostedFile.FileName);
        //    string mvFileExtension = Path.GetExtension(mvFilename);
        //    int mvFileSize = mvPostedFile.ContentLength;

        //    // Dim mvStream As Stream = mvPostedFile.InputStream
        //    // Dim mvBinaryReader As BinaryReader = New BinaryReader(mvStream)
        //    // Dim mvImagebytes As Byte() = mvBinaryReader.ReadBytes(CInt(mvStream.Length))


        //    decimal Medicalsize = Math.Round((System.Convert.ToDecimal(MVFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

        //    if ((Medicalsize > 100))
        //    {
        //        lblMSG.Text = "File is too big to upload";
        //        return;
        //    }
        //    else
        //        MVFileUpload.PostedFile.SaveAs(Server.MapPath(MedicalExamimgPath));

        //    // '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


        //    // ''Dim Medicalimg As System.Drawing.Image = System.Drawing.Image.FromStream(MVFileUpload.PostedFile.InputStream)
        //    // Dim Medicalimg As HttpPostedFile = PVFileUpload.PostedFile
        //    // 'Dim Medicalheight As Integer = Medicalimg.Height
        //    // 'Dim Medicalwidth As Integer = Medicalimg.Width

        //    // Dim Medicalsize As Decimal = Math.Round((CDec(MVFileUpload.PostedFile.ContentLength) / CDec(1024)), 2)

        //    // If (Medicalsize > 100) Then
        //    // lblMSG.Text = "File is too big to upload"
        //    // Else

        //    // MVFileUpload.PostedFile.SaveAs(Server.MapPath(MedicalExamimgPath))

        //    // End If
        //    // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-employee photo-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0
        //    /// photo upload code old''''''''

        //    if ((empimgPath != ""))
        //    {
        //        // Dim empimg As System.Drawing.Image = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream)
        //        // Dim empheight As Integer = empimg.Height
        //        // Dim empwidth As Integer = empimg.Width

        //        // Dim empsize As Decimal = Math.Round((CDec(FileUpload1.PostedFile.ContentLength) / CDec(1024)), 2)

        //        // ' 
        //        // If (empsize > 100) Then
        //        // lblMSG.Text = "File is too big to upload"
        //        // Else
        //        // FileUpload1.SaveAs(Server.MapPath(empimgPath))

        //        // End If
        //        return;
        //        }
        //        // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0
               
        //        // dob1 = (txtDOB.Text);

        //         string dob = Convert.ToDateTime(txtDOB.Text).ToString("yyyy-MM-dd");

        //    // ===============================================================================
        //    /// photo upload code by BK''''''''
        //    HttpPostedFile postedFile = FileUpload1.PostedFile;
        //    string filename = Path.GetFileName(postedFile.FileName);
        //    string fileExtension = Path.GetExtension(filename);
        //    int fileSize = postedFile.ContentLength;

        //    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
        //    {
        //        Stream stream = postedFile.InputStream;
        //        BinaryReader binaryReader = new BinaryReader(stream);
        //        byte[] Imagebytes = binaryReader.ReadBytes(System.Convert.ToInt32(stream.Length));
        //        decimal empsize = Math.Round((System.Convert.ToDecimal(fileSize) / System.Convert.ToDecimal(1024)), 2);
        //        //decimal empsize = Math.Round((System.Convert.ToDecimal(fileSize) / (double)System.Convert.ToDecimal(1024)), 2);
        //        if ((empsize > 20))
        //        {
        //            lblMSG.Text = "File is too big to upload, Max Size is 20 KB";
        //            return;
        //        }
        //        else
        //        {
        //        }
        //        // ===============================================================================
        //        string Str = "insert into tbl_emp(id, " + "vendor_code, " + "emp_name, emp_add, " + "emp_ph_no1,emp_ph_no2, " + "email, " + "gender,dob, " + "emp_cast,blood_grp, " + "nationality, aadhar_no, " + "pfno,pf_declaration, " + "escic,esic_declaration, " + "education, " + "police_verification, " + "medical_examination, " + "bank_name, acc_no, ifs_code, " + "emergency_contact_person_name, ecpn_ph_no, img_file, " + "status,remarks, " + "dept_approval,dept_remarks, " + "hr_approval,hr_remarks, " + "safety_approval,safety_remarks, " + "security_approval,security_remarks, " + "workorderno,any_disease, " + "designation,skill_category, " + "police_veryfication_dt,medical_certificate_dt,shift,basic,ImageData" + ")";
        //        Str = Str + " values(" + txtID.Text + "," + "'" + Session["User"] + "', " + "'" + txtEmpName.Text + "', '" + txtAddress.Text + "', " + "'" + txtPhNo1.Text + "', '" + txtPhNo2.Text + "', '" + txtEMail.Text + "', " + "'" + ddlGender.Text + "','" + txtDOB.Text + "', '" + ddlCast.Text + "', " + "'" + ddlBloodGrp.Text + "', '" + txtNationality.Text + "', " + "'" + txtAadharNo.Text + "', " + "'" + txtPFNO.Text + "','" + pffile + "', " + "'" + txtESIC.Text + "', '" + escicfile + "', " + "'" + ddlEducation.SelectedValue + "', " + "'" + policeverification + "', '" + medicalexamination + "', " + "'" + txtBankName.Text + "', '" + txtAccountNo.Text + "', '" + txtIFSC.Text + "', " + "'" + txtContactPerson.Text + "', '" + txtContactNo.Text + "', '" + imgName + "', " + "'P','-','N','-','N','-','N','-','N','-','" + txtWorkOrderNo.Text + "', " + "'" + txtDiseaseName.Text + "', " + "'" + ddlDesignation.SelectedValue + "','" + ddlSkill.SelectedValue + "', " + "'" + txtPVD.Text + "','" + txtMCID.Text + "','" + txtShift.Text + "','" + txtBasic.Text + "', @ImageData)";

        //        SqlCommand cm = new SqlCommand(Str, con);
        //        // ' cm.Parameters.Add("@ImageData", SqlDbType.Image).Value = Imagebytes
        //        SqlParameter paramImageData = new SqlParameter()
        //        {
        //            ParameterName = "@ImageData",
        //            Value = Imagebytes
        //        };
        //        // ''Dim pvImageData As SqlParameter = New SqlParameter() With {
        //        // '' .ParameterName = "@pvImageData",
        //        // '' .Value = pvImagebytes
        //        // ''}

        //        // ''Dim mvImageData As SqlParameter = New SqlParameter() With {
        //        // '' .ParameterName = "@mvImageData",
        //        // '' .Value = mvImagebytes
        //        // ''}
        //        cm.Parameters.Add(paramImageData);
        //        // ''cm.Parameters.Add(pvImageData)
        //        // ''cm.Parameters.Add(mvImageData)
        //        cm.ExecuteNonQuery();

        //        // ============================================================================
        //        lblMSG.Text = "Data Saved successfully";
        //    }
        //    else
        //        lblMSG.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
        //}
        //else
        //    lblMSG.Text = "Upload both Police Verication and Medical Examination Document.......";

        //// ===============================================================================  

        //// ''' police varification expiry alert
        //if (txtPVD.Text != "")
        //{
        //    DateTime PolVarDate = Convert.ToDateTime(txtPVD.Text);
        //    DateTime PolVarExpDate1 = PolVarDate.AddMonths(1);
        //    string PolVarExpDate2 = string.Format("{0:dd/MM/yyyy}", PolVarExpDate1);
        //    lblPoliceExpiry.Text = "Police Verification expiry Date is : " + PolVarExpDate2;
        //}
        //}

        private void txtWorkOrderNo_Load(object sender, EventArgs e)
        {
        }

     

        // Protected Sub DownloadFile(ByVal sender As Object, ByVal e As EventArgs) Handles btn1.Click

        // Dim FileName As String = "Image1.jpg"
        // Dim response As System.Web.HttpResponse = System.Web.HttpContext.Current.Response
        // response.ClearContent()
        // response.Clear()
        // response.ContentType = "image/jpg"
        // response.AddHeader("Content-Disposition", "attachment; filename=" & FileName & ";")
        // response.TransmitFile(Server.MapPath("~/emp_pic/Image1.jpg"))
        // response.Flush()
        // response.End()





        // ''File to be downloaded.
        // 'Dim fileName As String = "ESIC Registration.pdf"

        // ''Path of the File to be downloaded.
        // 'Dim filePath As String = Server.MapPath(String.Format("~/esic_doc_for_download/{0}", fileName))

        // ''Content Type and Header.
        // 'Response.ContentType = "application/pdf"
        // 'Response.AppendHeader("Content-Disposition", ("attachment; filename=" + fileName))

        // ''Writing the File to Response Stream.
        // 'Response.WriteFile(filePath)

        // ''Flushing the Response.
        // 'Response.Flush()
        // 'Response.End()
        // End Sub


       

        protected void txtWorkOrderNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            vendor_reg_code();
            Auto_Emp_Code();
            lblMSG.Text = "";
            lblMSGError.Text = "";
            lblPoliceExpiry.Text = "";
            lblMedicalExpiry.Text = "";
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            txtDiseaseName.ReadOnly = false;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            txtDiseaseName.Text = "";
            txtDiseaseName.ReadOnly = true;
        }
     
        //protected void pfRadio1_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (pfRadio1.Checked == true)
        //    {
        //        txtPFNO.Visible = true;
        //        PFileUpload.Visible = false;
        //        HyperLinkPF.Visible = false;
        //    }
        //}

        //protected void pfRadio2_CheckedChanged(object sender, EventArgs e)
        //{
        //     if (pfRadio2.Checked == true)
        //     {
        //         txtPFNO.Visible = false;
        //         PFileUpload.Visible = true;
        //         HyperLinkPF.Visible = true;
        //     }

        //}

        //protected void ESICRadio1_CheckedChanged(object sender, EventArgs e)
        //{
        //     if (ESICRadio1.Checked == true)
        //     {
        //         txtESIC.Visible = true;
        //         ESICFileUpload.Visible = false;
        //         HyperLinkESIC.Visible = false;
        //     }
        //}

        //protected void ESICRadio2_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ESICRadio2.Checked == true)
        //    {
        //        txtESIC.Visible = false;
        //        ESICFileUpload.Visible = true;
        //        HyperLinkESIC.Visible = true;
        //    }
        //}

        protected void ddlSkill_SelectedIndexChanged(object sender, EventArgs e)
        {
             if ((ddlSkill.SelectedIndex == 0))
                  txtBasic.Text = "0";
             else if((ddlSkill.SelectedIndex == 1))
                 txtBasic.Text = "400";
             else if ((ddlSkill.SelectedIndex == 2))
                 txtBasic.Text = "500";
             else if ((ddlSkill.SelectedIndex == 3))
                 txtBasic.Text = "600";
             else if ((ddlSkill.SelectedIndex == 4))
                 txtBasic.Text = "700";
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            lblDobError.Text = "";
            lblMedicalExpiry.Text = "";
            lblPoliceExpiry.Text = "";
            lblMSG.Text = "";
            lblMSGError.Text = "";

            try
            {
   
            dbConnection();
            Auto_ID();
          
            string imgName = FileUpload1.FileName;
            string pffile = PFileUpload.FileName;
            string escicfile = ESICFileUpload.FileName;
            string policeverification = PVFileUpload.FileName;
            string medicalexamination = MVFileUpload.FileName;
            string DomCerificate = DomFileUpload.FileName;

            string AgeCertFileName = AgeCertFileUpload.FileName;
            string EduCertFileName = EduCertUpload.FileName;

            // sets the image path
            string empimgPath = "../emp_pic/" + imgName;
            string PfimgPath = "../pf_doc/" + pffile;
            string EsicimgPath = "../esic_doc/" + escicfile;
            string PoliceVerimgPath = "../police_verification_doc/" + policeverification;
            string MedicalExamimgPath = "../medical_examination_doc/" + medicalexamination;
            string DomCerificatePath = "../domicile_doc/" + DomCerificate;

            string AgeCertFilePath = "../age_proof_doc/" + AgeCertFileName;
            string EduCertFilePath = "../education_doc/" + EduCertFileName;
            // get the size in bytes that

            string crtime = DateTime.Now.ToString("hhmmssffffff");

            // Dim extension As String = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName)
            // FileUpload1.PostedFile.SaveAs(imgPath & "vnd" & crtime & extension)

            int imgSize = FileUpload1.PostedFile.ContentLength;

            // validates the posted file before saving

            //if ((PVFileUpload.PostedFile.FileName != "" & MVFileUpload.PostedFile.FileName != ""))
            //{

                // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-UAN File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0
                ////check DOB
                if ((txtDOB.Text != string.Empty))
                {
                    var userBirthDateText = txtDOB.Text;
                    var userBirthDate = DateTime.ParseExact(userBirthDateText.Replace("/", "-"), "dd-MM-yyyy", null/* TODO Change to default(_) if this is not a reference type */);
                    var currentDate = DateTime.Now;
                    var age = Math.Floor(currentDate.Subtract(userBirthDate).TotalDays / 365);

                    if ((age < 18 | age > 60))
                    {
                        lblDobError.Text = "Age should be between 18 and 60 Years";
                        lblDobError.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                    else
                    {
                        lblDobError.ForeColor = System.Drawing.Color.Black;
                        lblDobError.Text = string.Empty;
                    }

                }

                if (PFRadioButtonList1.SelectedItem.Text=="N")
                {      
                    if (pffile != "")
                    {
                        // ''Dim PFimg As System.Drawing.Image = System.Drawing.Image.FromStream(PFileUpload.PostedFile.InputStream)
                        // ''Dim PFheight As Integer = PFimg.Height
                        // ''Dim PFwidth As Integer = PFimg.Width
                        decimal PFsize = Math.Round((System.Convert.ToDecimal(PFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);
                        if ((PFsize > 100))
                        {
                            lblMSGError.Text = "File is too big to upload , Max Size is 100 KB";
                            return;
                        }
                        else
                        {
                            PFileUpload.SaveAs(Server.MapPath(PfimgPath));
                        }
   
                    }
                    else
                    {
                        lblMSGError.Text = "Upload UAN File";
                        return;
                    }
                }
               
                if (PFRadioButtonList1.SelectedItem.Text=="Y")
                {
                    if (txtPFNO.Text=="")
                    {
                        lblMSGError.Text = "Enter UAN Number";
                        return;
                    }
                }

                // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-ESIC File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0

                if (ESICRadioButtonList1.SelectedItem.Text=="N")
                {
                    if (escicfile != "")
                    {

                        decimal ESICsize = Math.Round((System.Convert.ToDecimal(ESICFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                        if ((ESICsize > 100))
                            lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                        else
                            ESICFileUpload.SaveAs(Server.MapPath(EsicimgPath));
                    }
                    else
                    {
                        lblMSGError.Text = "Upload ESIC File";
                        return;
                    }

                }
                if (ESICRadioButtonList1.SelectedItem.Text == "Y")
                {
                    if (txtESIC.Text == "")
                    {
                        lblMSGError.Text = "Enter ESIC Number";
                        return;
                    }
                }
                   

                if (DomCerificate != "")
                {
                    decimal DomCerificateSize = Math.Round((System.Convert.ToDecimal(DomFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                    if ((DomCerificateSize > 100))
                    {
                        lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                        return;
                    }
                     else
                    {
                        DomFileUpload.SaveAs(Server.MapPath(DomCerificatePath));
                    }
                      
                }
            
             

                // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-Police Verification File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0
              if((PVFileUpload.PostedFile.FileName != "" & MVFileUpload.PostedFile.FileName != ""))
               {
                HttpPostedFile pvPostedFile = PVFileUpload.PostedFile;
                string pvFilename = Path.GetFileName(pvPostedFile.FileName);
                string pvFileExtension = Path.GetExtension(pvFilename);
                int pvFileSize = pvPostedFile.ContentLength;

                decimal Policesize = Math.Round((System.Convert.ToDecimal(PVFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                if ((Policesize > 100))
                {
                    lblMSGError.Text = "File is too big to upload , Max Size is 100 KB";
                    return;
                }
                else
                    PVFileUpload.PostedFile.SaveAs(Server.MapPath(PoliceVerimgPath));

 
                // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-Medical Examination File-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0

                HttpPostedFile mvPostedFile = MVFileUpload.PostedFile;
                string mvFilename = Path.GetFileName(mvPostedFile.FileName);
                string mvFileExtension = Path.GetExtension(mvFilename);
                int mvFileSize = mvPostedFile.ContentLength;

                // Dim mvStream As Stream = mvPostedFile.InputStream
                // Dim mvBinaryReader As BinaryReader = New BinaryReader(mvStream)
                // Dim mvImagebytes As Byte() = mvBinaryReader.ReadBytes(CInt(mvStream.Length))


                decimal Medicalsize = Math.Round((System.Convert.ToDecimal(MVFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                if ((Medicalsize > 100))
                {
                    lblMSGError.Text = "File is too big to upload";
                    return;
                }
                else
                    MVFileUpload.PostedFile.SaveAs(Server.MapPath(MedicalExamimgPath));

               }
               else
              {
                  lblMSGError.Text = "Upload both Police Verication and Medical Examination Document.......";
                  return;
              }

              if (AgeCertFileName != "")
              {
                  decimal AgeCerificateSize = Math.Round((System.Convert.ToDecimal(AgeCertFileUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                  if ((AgeCerificateSize > 100))
                  {
                      lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                      return;
                  }
                  else
                  {
                      AgeCertFileUpload.SaveAs(Server.MapPath(AgeCertFilePath));
                  }

              }

              if (EduCertFileName != "")
              {
                  decimal EduCerificateSize = Math.Round((System.Convert.ToDecimal(EduCertUpload.PostedFile.ContentLength) / System.Convert.ToDecimal(1024)), 2);

                  if ((EduCerificateSize > 100))
                  {
                      lblMSGError.Text = "File is too big to upload, Max Size is 100 KB";
                      return;
                  }
                  else
                  {
                      EduCertUpload.SaveAs(Server.MapPath(EduCertFilePath));
                  }

              }
                
    
                // 0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-employee photo-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0
                /// photo upload code old''''''''

              if ((imgName != ""))
              {

                  //decimal empsize = Math.Round((System.Convert.ToDecimal(FileUpload1.PostedFile.ContentLength) / (System.Convert.ToDecimal(1024))), 2);
                 //if (empsize > 100)
                  //{
                  //    lblMSGError.Text = "File is too big to upload";
                  //}
                  //else
                  //{
                  //    FileUpload1.SaveAs(Server.MapPath(empimgPath));
                  //}
                  /// photo upload code by BK''''''''
                  HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    byte[] Imagebytes = binaryReader.ReadBytes(System.Convert.ToInt32(stream.Length));
                    decimal empsize = Math.Round((System.Convert.ToDecimal(fileSize) / System.Convert.ToDecimal(1024)), 2);
                    //decimal empsize = Math.Round((System.Convert.ToDecimal(fileSize) / (double)System.Convert.ToDecimal(1024)), 2);
                    if ((empsize > 20))
                    {
                        lblMSGError.Text = "File is too big to upload, Max Size is 20 KB";
                        return;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath(empimgPath));
                    }
                 
                 }
                 else
                {
                    lblMSGError.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                    return;
                }

              }
              else
              {
                  lblMSGError.Text = "Select Employee Image";
                  return;
              }
                   
                    ///////// ===============================================================================
                 

                    // dob1 = (txtDOB.Text);

                    string dob = Convert.ToDateTime(txtDOB.Text).ToString("yyyy-MM-dd");

                    // ===============================================================================
                    string Str = "insert into tbl_emp(id, " + "vendor_code, " + "emp_name, emp_add, " + "emp_ph_no1,emp_ph_no2, " + "email, " + "gender,dob, " + "emp_cast,blood_grp, " + "nationality, aadhar_no, " + "pfno,pf_declaration, " + "escic,esic_declaration, " + "education, " + "police_verification, " + "medical_examination, " + "bank_name, acc_no, ifs_code, " + "emergency_contact_person_name, ecpn_ph_no, img_file, " + "status,remarks, " + "dept_approval,dept_remarks, " + "hr_approval,hr_remarks, " + "safety_approval,safety_remarks, " + "security_approval,security_remarks, " + "workorderno,any_disease, " + "designation,skill_category, " + "police_veryfication_dt,medical_certificate_dt,shift,basic,emp_code,city,state,experience,department,domicile_state,domicile_certificate,trade,age_certificate,education_certificate,father_husband_name,Local_address" + ")";
                    Str = Str + " values(" + txtID.Text + "," + "'" + Session["User"] + "', " + "'" + txtEmpName.Text + "', '" + txtAddress.Text + "', " + "'" + txtPhNo1.Text + "', '" + txtPhNo2.Text + "', '" + txtEMail.Text + "', " + "'" + ddlGender.Text + "','" + txtDOB.Text + "', '" + ddlCast.Text + "', " + "'" + ddlBloodGrp.Text + "', '" + txtNationality.Text + "', " + "'" + txtAadharNo.Text + "', " + "'" + txtPFNO.Text + "','" + pffile + "', " + "'" + txtESIC.Text + "', '" + escicfile + "', " + "'" + ddlEducation.SelectedValue + "', " + "'" + policeverification + "', '" + medicalexamination + "', " + "'" + ddlBankName.Text + "', '" + txtAccountNo.Text + "', '" + txtIFSC.Text + "', " + "'" + txtContactPerson.Text + "', '" + txtContactNo.Text + "', '" + imgName + "', " + "'P','-','Pending','-','Pending','-','Pending','-','Pending','-','" + txtWorkOrderNo.Text + "', " + "'" + txtDiseaseName.Text + "', " + "'" + ddlDesignation.SelectedValue + "','" + ddlSkill.SelectedItem.Text + "', " + "'" + txtPVD.Text + "','" + txtMCID.Text + "','" + txtShift.Text + "','" + txtBasic.Text + "','" + txtEmpCode.Text + "','" + txtCity.Text + "','" + ddlState.Text + "','" + txtExp.Text + "','" + txtDepart.Text + "','" + ddlDomState.SelectedItem.Text + "','" + DomCerificate + "','" + ddlTrade.SelectedItem.Text + "','" + AgeCertFileName + "','" + EduCertFileName + "','" + txtFatherHusband.Text + "','" + txtLocalAddress.Text + "')";  //, @ImageData

                    SqlCommand cm = new SqlCommand(Str, con);
                   ////// //// ' cm.Parameters.Add("@ImageData", SqlDbType.Image).Value = Imagebytes
                   ////// //SqlParameter paramImageData = new SqlParameter()
                   ////// //{
                   ////// //    ParameterName = "@ImageData",
                   ////// //    Value = Imagebytes
                   ////// //};
                   ////// // ''Dim pvImageData As SqlParameter = New SqlParameter() With {
                   ////// // '' .ParameterName = "@pvImageData",
                   ////// // '' .Value = pvImagebytes
                   ////// // ''}

                   ////// // ''Dim mvImageData As SqlParameter = New SqlParameter() With {
                   ////// // '' .ParameterName = "@mvImageData",
                   ////// // '' .Value = mvImagebytes
                   ////// // ''}

                   //////// cm.Parameters.Add(paramImageData);
                   ////// // ''cm.Parameters.Add(pvImageData)
                   ////// // ''cm.Parameters.Add(mvImageData)
                    cm.ExecuteNonQuery();

                    // ============================================================================
                    lblMSG.Text = "Data Saved successfully";

             
          

            // ===============================================================================  

            // ''' police varification expiry alert
            if (txtPVD.Text != "")
            {
                DateTime PolVarDate = Convert.ToDateTime(txtPVD.Text);
                DateTime PolVarExpDate1 = PolVarDate.AddMonths(1);
                string PolVarExpDate2 = string.Format("{0:dd-MM-yyyy}", PolVarExpDate1);
                lblPoliceExpiry.Text = "Police Verification expiry Date is : " + PolVarExpDate2;
            }
            // ''' Medical varification expiry alert
            if (txtMCID.Text != "")
            {
                DateTime MedVarDate = Convert.ToDateTime(txtMCID.Text);
                DateTime MedVarExpDate1 = MedVarDate.AddMonths(1);
                string MedVarExpDate2 = string.Format("{0:dd-MM-yyyy}", MedVarExpDate1);
                lblMedicalExpiry.Text = "Medical Verification expiry Date is : " + MedVarExpDate2;
            }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

            ////clear_fields();

        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            clear_fields();

            lblDobError.Text = "";
            lblMedicalExpiry.Text = "";
            lblPoliceExpiry.Text = "";
            lblMSG.Text = "";
            lblMSGError.Text = "";
           
            
        }

        private void clear_fields()
        {
            txtID.Text = "";
            txtWorkOrderNo.SelectedIndex = -1;
            txtVendorCode.Text = "";
            txtEmpCode.Text = "";
            txtDepart.Text = "";
            txtEmpName.Text = "";
            txtAddress.Text = "";
            txtPhNo1.Text = "";
            txtPhNo2.Text = "";
            txtEMail.Text = "";
            ddlGender.Text ="" ;
            txtDOB.Text = "";
            ddlCast.SelectedIndex = -1;
            txtNationality.Text = "";
            txtAadharNo.Text = "";
            txtPFNO.Text = "";
            txtESIC.Text = "";

            ddlEducation.SelectedIndex = -1;
            ddlBankName.SelectedIndex = -1;
            txtAccountNo.Text = "";
            txtIFSC.Text = "";
            txtContactPerson.Text = "";
            txtContactNo.Text = "";
            txtWorkOrderNo.SelectedIndex = -1;
            txtDiseaseName.Text = "";
            ddlDesignation.SelectedIndex = -1;
            ddlSkill.SelectedIndex = -1;
            txtPVD.Text = "";
            txtMCID.Text = "";
            txtShift.SelectedIndex = -1;
            txtBasic.Text = "";
            txtEmpCode.Text = "";
            txtCity.Text = "";
            ddlState.SelectedIndex = -1;
            txtExp.Text = "";
            //txtDomDesc.Text = "";
            ddlTrade.SelectedIndex = -1;
        }
        protected void PFRadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PFRadioButtonList1.SelectedItem.Text =="Y")
            {
                txtPFNO.Visible = true;
                PFileUpload.Visible = false;
                lblPFfileSizeMsg.Visible = false;
                //HyperLinkPF.Visible = false;
            }
            else if(PFRadioButtonList1.SelectedItem.Text=="N")
            {
                txtPFNO.Visible = false;
                PFileUpload.Visible = true;
                lblPFfileSizeMsg.Visible = true;
                //HyperLinkPF.Visible = true;
            }
        }

        protected void ESICRadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ESICRadioButtonList1.SelectedItem.Text == "Y")
            {
                txtESIC.Visible = true;
                ESICFileUpload.Visible = false;
                lblEsicfileSizeMsg.Visible = false;
                //HyperLinkESIC.Visible = false;
            }
            else if (ESICRadioButtonList1.SelectedItem.Text == "N")
            {
                txtESIC.Visible = false;
                ESICFileUpload.Visible = true;
                lblEsicfileSizeMsg.Visible = true;
                //HyperLinkESIC.Visible = true;
            }
        }

        protected void pfLinkButton1_Click(object sender, EventArgs e)
        {
            var path = Server.MapPath("../pf_doc_for_download");
            var filePath = Path.Combine(path, "DECLARATION-FOR-EPF.docx");
            FileInfo file = new FileInfo(filePath);
            if (file.Exists)
            {
                // Clear Rsponse reference  
                Response.Clear();
                // Add header by specifying file name  
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                // Add header for content length  
                Response.AddHeader("Content-Length", file.Length.ToString());
                // Specify content type  
                Response.ContentType = "text/plain";
                // Clearing flush  
                Response.Flush();
                // Transimiting file  
                Response.TransmitFile(file.FullName);
                Response.End();
            }
            Response.Write("Requested file is not available to download");
        }

        protected void esicLinkButton2_Click(object sender, EventArgs e)
        {
            var path = Server.MapPath("../esic_doc_for_download");
            var filePath = Path.Combine(path, "DECLARATION-FOR-ESIC.docx");
            FileInfo file = new FileInfo(filePath);
            if (file.Exists)
            {
                // Clear Rsponse reference  
                Response.Clear();
                // Add header by specifying file name  
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                // Add header for content length  
                Response.AddHeader("Content-Length", file.Length.ToString());
                // Specify content type  
                Response.ContentType = "text/plain";
                // Clearing flush  
                Response.Flush();
                // Transimiting file  
                Response.TransmitFile(file.FullName);
                Response.End();
            }
            Response.Write("Requested file is not available to download");

        }

        protected void ddlEducation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEducation.SelectedItem.Text.ToUpper().Trim() == "NON-MATRIC")
            {
               non_matric();
            }
            else if (ddlEducation.SelectedItem.Text.ToUpper().Trim() == "MATRIC")
            {
                matric();
            }
            else if (ddlEducation.SelectedItem.Text.ToUpper().Trim() == "ITI")
            {
                ITI();
            }
            if (ddlEducation.SelectedItem.Text.ToUpper().Trim() == "INTERMEDIATE")
            {
                Intermediate();
            }
            if (ddlEducation.SelectedItem.Text.ToUpper().Trim() == "ENGINEERING")
            {
                Engineering();
            }
            else if (ddlEducation.SelectedItem.Text.ToUpper().Trim() == "GRADUATION")
            {
                Graduation();
            }
            else if(ddlEducation.SelectedItem.Text.ToUpper().Trim()=="MASTER DEGREE".Trim())
            {
                master_degree();
            }

        }



       
    }
}