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
    public partial class vendor_detail_entry : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

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
                using (SqlCommand cmd = new SqlCommand("SELECT  distinct work_worder FROM tbl_vendor_work_order where vendor_reg_code=" + Session["User"] + " "))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlWorkOrder.DataSource = ds.Tables[0];
                        ddlWorkOrder.DataTextField = "work_worder";
                        ddlWorkOrder.DataValueField = "work_worder";
                        ddlWorkOrder.DataBind();
                    }
                }
            }
            //ddlWorkOrder.Items.Insert(0, new ListItem("--Select Work Order No.--", "0"));
            ddlWorkOrder.Items.Insert(0, new ListItem("Select", "Select"));
        }
        public void ShowWorkOrdeDetails()
        {
            /// display new wor_entry details int vendor update form '''
            // Call dbConnection()
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                ////using (SqlCommand cmd = new SqlCommand("select a.email,a.contact_no1,b.valid_from,b.valid_to,a.workers_authorised from tbl_vendor_info a,tbl_vendor_work_order b where a.work_worder = b.work_worder and b.work_worder= '" + ddlWorkOrder.SelectedItem.Text + "' and a.vendor_reg_code=" + Session["User"] + " "))
                using (SqlCommand cmd = new SqlCommand("select a.email,a.contact_no1,a.contact_no2,a.firm_address,a.firm_city,a.firm_state,a.firm_pin,a.license_no, b.valid_from,b.valid_to,a.un_skilled,a.semi_skilled ,a.skilled,a.high_skilled,a.workers_authorised,a.img_file,a.pfno,a.esicno,a.pano,gstno from tbl_vendor_info a,tbl_vendor_work_order b where a.work_worder = b.work_worder and b.work_worder= '" + ddlWorkOrder.SelectedItem.Text + "' and a.vendor_reg_code=" + Session["User"] + " "))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtEMail.Text = r["email"].ToString();
                        txtPhNo1.Text = r["contact_no1"].ToString();

                        txtPhNo2.Text = r["contact_no2"].ToString();
                        txtAddress.Text = r["firm_address"].ToString();
                        txtCity.Text = r["firm_city"].ToString();
                        //string state_name = r["firm_state"].ToString();
                        //ddlState.SelectedItem.Text = state_name;
                        //txtState.Text = r["firm_state"].ToString();
                        txtPIN.Text = r["firm_pin"].ToString();
                        txtLicenseNo.Text = r["license_no"].ToString();

                        txtValidFrom.Text = r["valid_from"].ToString();
                        txtValidTo.Text = r["valid_to"].ToString();

                        //txtValidFrom.Text =Convert.ToDateTime( r["valid_from"]).ToString("dd-MM-yyyy");
                        //txtValidTo.Text =Convert.ToDateTime( r["valid_to"]).ToString("dd-MM-yyyy");

                        txtUnskilled.Text = r["un_skilled"].ToString();
                        txtSemiSkilled.Text = r["semi_skilled"].ToString();
                        txtSkilled.Text = r["skilled"].ToString();
                        txtHighSkilled.Text = r["high_skilled"].ToString();
                        txtWAuthorised.Text = r["workers_authorised"].ToString();

                        txtPFNO.Text = r["pfno"].ToString();
                        txtESIC.Text = r["esicno"].ToString();
                        txtPANNo.Text = r["pano"].ToString();
                        txtGSTNo.Text = r["gstno"].ToString();
                    }
                    //////txtValidFrom.Text = Convert.ToDateTime(txtValidFrom.Text).ToString("MM-dd-yyyy");
                    //////txtValidTo.Text = Convert.ToDateTime(txtValidTo.Text).ToString("MM-dd-yyyy");
                    con.Close();
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMSG.Text = "";
            lblMSGError.Text = "";
            lblPFfileSizeMsg.Text = "";

            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            if ((!IsPostBack))
                work_order_no();

            if ((Session["User"].ToString()) == "")
            {
                Response.Redirect("../login/login.aspx");
            }
            else
            {
                lblUser.Text = Session["User"].ToString();
                if (!Page.IsPostBack)
                {
                    state();
                    pfRadio1.Checked = true;
                    ESICRadio1.Checked = true;
                    ////txtPFNO.Visible = false;
                    ////txtESIC.Visible = false;
                    PFileUpload.Visible = false;
                  
                    ESICFileUpload.Visible = false;
                    lblPFfileSizeMsg.Visible = false;
                    lblEsicfileSizeMsg.Visible = false;
                 
                    //LinkButton1.Visible = false;  // download UAN declartion
                    //LinkButton2.Visible = false;  //// download esic declartion

                    dbConnection();
                    // strSQL = "select * from tbl_vendor_info where vendor_reg_code = '" & Session("User") & "'"
                    strSQL = "select * from tbl_vendor_work_order where vendor_reg_code = '" + Session["User"] + "'";
                    SqlCommand cm = new SqlCommand(strSQL, con);
                    SqlDataReader r = cm.ExecuteReader();
                    if (r.Read())
                        txtVendorCode.Text = r["vendor_reg_code"].ToString();// '& " = " & Session("User")
                    r.Close();
                }
            }

        }

        

        private int Auto_ID()
        {
            int x=0;

            string StrSql = "Select max(id) from tbl_vendor_info";
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

            return x;
        }

     
        protected void pfRadio1_CheckedChanged(object sender, EventArgs e)
        {
            if (pfRadio1.Checked == true)
            {
                txtPFNO.Visible = true;
                PFileUpload.Visible = false;
                LinkButton1.Visible = false;
                lblPFfileSizeMsg.Visible = false;
                //btnDownloadPF.Visible = false;
               // HyperLinkPF.Visible = false;
              
            }

        }

        protected void pfRadio2_CheckedChanged(object sender, EventArgs e)
        {
            if (pfRadio2.Checked == true)
            {
                txtPFNO.Visible = false;
                PFileUpload.Visible = true;
                LinkButton1.Visible = true;
                lblPFfileSizeMsg.Visible = true;
               // HyperLinkPF.Visible = true;
                //btnDownloadPF.Visible = true;
            }

        }

        protected void ESICRadio1_CheckedChanged(object sender, EventArgs e)
        {
            if (ESICRadio1.Checked == true)
            {
                txtESIC.Visible = true;
                ESICFileUpload.Visible = false;
                LinkButton2.Visible = false;
                lblEsicfileSizeMsg.Visible = false;
                //HyperLinkESIC.Visible = false;
                //btnDownloadEsic.Visible = false;
            }

        }

        protected void ESICRadio2_CheckedChanged(object sender, EventArgs e)
        {
            if (ESICRadio2.Checked == true)
            {
                txtESIC.Visible = false;
                ESICFileUpload.Visible = true;
                LinkButton2.Visible = true;
                lblEsicfileSizeMsg.Visible = true;
               // HyperLinkESIC.Visible = true;
               // btnDownloadEsic.Visible = false;
            }

        }

        protected void ddlWorkOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
          if( ddlWorkOrder.SelectedItem.Text != "Select")
            ShowWorkOrdeDetails();
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            lblMSG.Text = "";
            lblMSGError.Text = "";
            lblPFfileSizeMsg.Text = "";
            try
            {
                dbConnection();
                // ''''======== old code for image saving in folder========== ''''''
                string crtime = DateTime.Now.ToString("hhmmssffffff");

                string imgName = FileUpload1.FileName;
                string PFileUpload1 = PFileUpload.FileName;
                string ESICFileUpload1 = ESICFileUpload.FileName;
                string POcopyUpload1 = POcopyUpload.FileName;


                string imgPath = "../vendors_pic/" + imgName;

                string PFilePath = "../pf_doc/" + PFileUpload1;
                string ESICFilePath = "../esic_doc/" + ESICFileUpload1;
                string POcopyPath = "../po_doc/" + POcopyUpload1;


                // ''get the size in bytes that



                ///// ============================================================//////
                // Dim extension As String = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName)
                // FileUpload1.PostedFile.SaveAs(imgPath & "vnd" & crtime & extension)

                // Dim imgSize As Integer = FileUpload1.PostedFile.ContentLength

                // Dim PFileSize As Integer = PFileUpload.PostedFile.ContentLength
                // Dim ESICFileSize As Integer = ESICFileUpload.PostedFile.ContentLength
                // Dim POcopySize As Integer = POcopyUpload.PostedFile.ContentLength

                // validates the posted file before saving

                // If (FileUpload1.PostedFile.FileName <> "") Then


                // 'If (FileUpload1.PostedFile.FileName = "") Then
                // '    imgName = "img"
                // 'Else

                // '    Dim img As System.Drawing.Image = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream)
                // '    Dim height As Integer = img.Height
                // '    Dim width As Integer = img.Width

                // '    Dim size As Decimal = Math.Round((CDec(FileUpload1.PostedFile.ContentLength) / CDec(1024)), 2)
                // '    ' 10240 KB means 10MB, You can change the value based on your requirement
                // '    If (size > 500) Then
                // '        'Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Alert", "<script> alert('File is too big');</script>", True)
                // '        lblMSG.Text = "File is too big to upload"
                // '    Else
                // '        'then save it to the Folder
                // '        FileUpload1.SaveAs(Server.MapPath(imgPath))
                // '    End If
                // 'End If

                // 'If (POcopyUpload.PostedFile.FileName = "") Then
                // '    POcopyUpload1 = "img"
                // 'Else
                // '    Dim POcopySize As Decimal = Math.Round((CDec(POcopyUpload.PostedFile.ContentLength) / CDec(1024)), 2)
                // '    If (POcopySize > 500) Then
                // '        lblMSG.Text = "File is too big to upload"
                // '    Else
                // '        POcopyUpload.SaveAs(Server.MapPath(POcopyPath))
                // '    End If
                // 'End If


                // If pfRadio1.Checked = True Then
                // PFileUpload1 = "img"
                // ElseIf pfRadio2.Checked = True Then

                // ''--------------------------------------------------------------''''
                // ' ''Dim PFileSize As Decimal = Math.Round((CDec(PFileUpload.PostedFile.ContentLength) / CDec(1024)), 2)

                // ' ''If (PFileSize > 500) Then
                // ' ''    lblMSG.Text = "File is too big to upload"
                // ' ''Else
                // ' ''    PFileUpload.SaveAs(Server.MapPath(PFilePath))
                // ' ''End If
                // End If


                // If (ESICRadio1.Checked = True) Then
                // ESICFileUpload1 = "img"
                // ElseIf (ESICRadio2.Checked = True) Then


                // '''-------------------------------------------------------'''''''''
                // ' ''Dim ESICFileSize As Decimal = Math.Round((CDec(ESICFileUpload.PostedFile.ContentLength) / CDec(1024)), 2)
                // ' ''If (ESICFileSize > 500) Then
                // ' ''    lblMSG.Text = "File is too big to upload"
                // ' ''Else
                // ' ''    ESICFileUpload.SaveAs(Server.MapPath(ESICFilePath))
                // ' ''End If
                // End If

                //////============================================///////////


                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                if (filename == "")
                {
                    lblMSGError.Text = "Upload Vendor Photo";
                    return;
                   // imgName = "img";
                }
                else if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    decimal size = Math.Round((System.Convert.ToDecimal(fileSize) / System.Convert.ToDecimal(1024)), 2);   // ' conveted to kb

                    if ((size > 20))
                    {
                        lblMSG.Text = "Vendor Photo is too big to upload , Max size is 20 KB";
                        return;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath(imgPath));
                    }
                }
                else
                {
                    lblMSG.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                    return;
                }




                if (pfRadio1.Checked == true)
                {
                    if (txtPFNO.Text=="")
                    {
                        lblMSGError.Text = "Enter UAN Number";
                        return;
                    }
                   // PFileUpload1 = "img";
                }
                else if (pfRadio2.Checked == true)
                {
                    if (PFileUpload1 == "")
                    {
                        lblMSGError.Text = "Upload UAN File";
                        return;
                        //PFileUpload1 = "img";
                    }
                    else
                    {
                        HttpPostedFile pfPostedFile = PFileUpload.PostedFile;
                        string pfFilename = Path.GetFileName(pfPostedFile.FileName);
                        string pfFileExtension = Path.GetExtension(pfFilename);
                        int pfFileSize = pfPostedFile.ContentLength;

                        decimal size = Math.Round((System.Convert.ToDecimal(pfFileSize) / System.Convert.ToDecimal(1024)), 2);   // ' conveted to kb

                        if ((size > 100))
                        {
                            lblMSG.Text = "UAN file is too big to upload , Max size is 100 KB";
                            return;
                        }
                        else
                        {
                            PFileUpload.SaveAs(Server.MapPath(PFilePath));
                        }
                    }

                    
                }


                if ((ESICRadio1.Checked == true))
                {
                    if (txtESIC.Text == "")
                    {
                        lblMSGError.Text = "Enter ESIC Number";
                        return;
                    }
                  //  ESICFileUpload1 = "img";

                }
                else if (ESICRadio2.Checked == true)
                {
                        if (ESICFileUpload1 == "")
                        {
                            lblMSGError.Text = "Upload ESCI File";
                            return;
                           // ESICFileUpload1 = "img";
                        }
                        else
                        {
                          HttpPostedFile esicPostedFile = ESICFileUpload.PostedFile;
                        string esicFilename = Path.GetFileName(esicPostedFile.FileName);
                        string esicFileExtension = Path.GetExtension(esicFilename);
                        int esicFileSize = esicPostedFile.ContentLength;

                        decimal size = Math.Round((System.Convert.ToDecimal(esicFileSize) / System.Convert.ToDecimal(1024)), 2);   // ' conveted to kb

                        if ((size > 500))
                        {
                            lblMSG.Text = "ESIC file is too big to upload , Max size is 500 KB";
                            return;
                        }
                        else
                        {
                            ESICFileUpload.SaveAs(Server.MapPath(ESICFilePath));
                        }
                        }
    
                    
                }

                if (POcopyUpload1 == "")
                {
                    lblMSGError.Text = "Upload PO File";
                    return;
                   // POcopyUpload1 = "img";
                }
                else 
                {
                    HttpPostedFile poPostedFile = POcopyUpload.PostedFile;
                    string poFilename = Path.GetFileName(poPostedFile.FileName);
                    string poFileExtension = Path.GetExtension(poFilename);
                    int poFileSize = poPostedFile.ContentLength;

                    decimal size = Math.Round((System.Convert.ToDecimal(poFileSize) / System.Convert.ToDecimal(1024)), 2);   // ' conveted to kb

                    if ((size > 100))
                    {
                        lblMSG.Text = "PO is too big to upload , Max size is 100 KB";
                        return;
                    }
                    else
                    {
                        POcopyUpload.SaveAs(Server.MapPath(POcopyPath));
                    }
                }
                /////========================================================================//////////
                //string fdt = Convert.ToDateTime(txtValidFrom.Text).ToString("dd-MM-yyyy");
                //string tdt = Convert.ToDateTime(txtValidTo.Text).ToString("dd-MM-yyyy");
                string fdt1 = txtValidFrom.Text;
                //DateTime fdt = DateTime.ParseExact(fdt1, "MM-dd-yyyy", System.Globalization.CultureInfo.InvariantCulture);

                string tdt1 = txtValidTo.Text;
                //DateTime tdt = DateTime.ParseExact(tdt1, "MM-dd-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                //----------------
                ////string Str = "update tbl_vendor_info set contact_no2='" + txtPhNo2.Text + "'," + "firm_address='" + txtAddress.Text + "'," + "firm_city='" + txtCity.Text + "'," + "firm_state='" + txtState.Text + "'," + "firm_pin='" + txtPIN.Text + "'," + "license_no='" + txtLicenseNo.Text + "'," + "valid_from='" + fdt + "'," + "valid_to= '" + tdt + "'," + "workers_authorised='" + txtWAuthorised.Text + "'," + "pfno='" + txtPFNO.Text + "'," + "esicno='" + txtESIC.Text + "', " + "img_file='" + imgName + "', " + "pfdoc='" + PFileUpload1 + "', " + "esicdoc='" + ESICFileUpload1 + "', " + "pano='" + txtPANNo.Text + "', " + "gstno='" + txtGSTNo.Text + "', " + "pocopy='" + POcopyUpload1 + "'  where vendor_reg_code='" + Session["User"] + "' ";
                ////SqlCommand cmd = new SqlCommand("str",con); 
                ////cmd.ExecuteNonQuery();
               
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;

                    cmd.CommandText = "update tbl_vendor_info set contact_no2='" + txtPhNo2.Text + "'," + "firm_address='" + txtAddress.Text + "'," + "firm_city='" + txtCity.Text + "'," + "firm_state='" + ddlState.SelectedItem.Text + "'," + "firm_pin='" + txtPIN.Text + "'," + "license_no='" + txtLicenseNo.Text + "'," + "valid_from='" + fdt1 + "'," + "valid_to= '" + tdt1 + "'," + "un_skilled='" + txtUnskilled.Text + "'," + "semi_skilled='" + txtSemiSkilled.Text + "'," + "skilled='" + txtSkilled.Text + "'," + "high_skilled='" + txtHighSkilled.Text + "'," + "workers_authorised='" + txtWAuthorised.Text + "'," + "pfno='" + txtPFNO.Text + "'," + "esicno='" + txtESIC.Text + "', " + "img_file='" + imgName + "'," + "status= 'P', " + "pfdoc='" + PFileUpload1 + "', " + "esicdoc='" + ESICFileUpload1 + "', " + "pano='" + txtPANNo.Text + "', " + "gstno='" + txtGSTNo.Text + "', " + "pocopy='" + POcopyUpload1 + "'  where  vendor_reg_code='" + Session["User"] + "' and work_worder= '" + ddlWorkOrder.SelectedItem.Text + "'";  // status P for Pending , A for Aproved and R for Rejected
                    cmd.ExecuteNonQuery();

                    cmd.Parameters.Clear();
                    cmd.CommandText = "update tbl_vendor_work_order set valid_from='" + fdt1 + "'," + "valid_to= '" + tdt1 + "'," + "status= 'P' where  vendor_reg_code='" + Session["User"] + "' and work_worder= '" + ddlWorkOrder.SelectedItem.Text + "'";
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                lblMSG.Text = "Data updated successfully";
            }
            catch (Exception ex)
            {
                lblMSGError.Text = ex.Message;
            }
                // ===============================================================================

                /// photo upload code by BK'''''''''''

              /*  HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    byte[] Imagebytes = binaryReader.ReadBytes(System.Convert.ToInt32(stream.Length));

                    decimal size = Math.Round((System.Convert.ToDecimal(fileSize) / System.Convert.ToDecimal(1024)), 2);   // ' conveted to kb
                    //decimal size = Math.Round((System.Convert.ToDecimal(fileSize) / (double)System.Convert.ToDecimal(1024)), 2);   // ' conveted to kb
                    // '''''---------------------------------------------------------''''

                    if ((size > 20))
                    {
                        lblMSG.Text = "Vendor Photo is too big to upload , Max size is 20 KB";
                        return;
                    }
                    else
                        FileUpload1.SaveAs(Server.MapPath(imgPath));
                    byte[] pfImagebytes = null;
                    if (pfRadio1.Checked == true)
                    {
                        PFileUpload1 = "img";
                        pfImagebytes = null;
                    }
                    //else if ((pfRadio2.Checked == true & ESICRadio2.Checked == false))
                    else if (pfRadio2.Checked)
                    {
                        HttpPostedFile pfPostedFile = PFileUpload.PostedFile;
                        string pfFilename = Path.GetFileName(pfPostedFile.FileName);
                        string pfFileExtension = Path.GetExtension(pfFilename);
                        int pfFileSize = pfPostedFile.ContentLength;
                        Stream pfStream = pfPostedFile.InputStream;
                        BinaryReader pfBinaryReader = new BinaryReader(pfStream);
                        pfImagebytes = pfBinaryReader.ReadBytes(System.Convert.ToInt32(pfStream.Length));
                        PFileUpload.SaveAs(Server.MapPath(PFilePath));
                        POcopyUpload.SaveAs(Server.MapPath(POcopyPath));
                        if (pfFilename != "")
                        {
                            string Str = "update tbl_vendor_info set contact_no2='" + txtPhNo2.Text + "'," + "firm_address='" + txtAddress.Text + "'," + "firm_city='" + txtCity.Text + "'," + "firm_state='" + txtState.Text + "'," + "firm_pin='" + txtPIN.Text + "'," + "license_no='" + txtLicenseNo.Text + "'," + "valid_from='" + fdt + "'," + "valid_to='" + tdt + "'," + "workers_authorised='" + txtWAuthorised.Text + "'," + "pfno='" + txtPFNO.Text + "'," + "esicno='" + txtESIC.Text + "', " + "img_file='" + imgName + "', " + "pfdoc='" + PFileUpload1 + "', " + "esicdoc='" + ESICFileUpload1 + "', " + "pano='" + txtPANNo.Text + "', " + "gstno='" + txtGSTNo.Text + "', " + "pocopy='" + POcopyUpload1 + "', " + "venImageData= @venImageData  " + "where vendor_reg_code='" + Session["User"] + "' ";


                            SqlCommand cm = new SqlCommand(Str, con);


                            SqlParameter venImageData1 = new SqlParameter()
                            {
                                ParameterName = "@venImageData",
                                Value = Imagebytes
                            };
                            cm.Parameters.Add(venImageData1);

                            // If pfImagebytes Is Nothing Then
                            // Dim pfImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@pfImageData",
                            // .Value = DBNull.Value
                            // }
                            // cm.Parameters.Add(pfImageData1)
                            // Else
                            // Dim pfImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@pfImageData",
                            // .Value = pfImagebytes
                            // }
                            // cm.Parameters.Add(pfImageData1)
                            // End If

                            cm.ExecuteNonQuery();
                            lblMSG.Text = "Data updated successfully";
                        }
                    }
                    // '''''---------------------------------------------------------''''
                  /*  byte[] esicImagebytes = null;
                    if ((ESICRadio1.Checked == true))
                    {
                        ESICFileUpload1 = "img";
                        esicImagebytes = null;
                    }
                    else if ((ESICRadio2.Checked == true & pfRadio2.Checked == false))
                    {
                        HttpPostedFile esicPostedFile = ESICFileUpload.PostedFile;
                        string esicFilename = Path.GetFileName(esicPostedFile.FileName);
                        string esicFileExtension = Path.GetExtension(esicFilename);
                        int esicFileSize = esicPostedFile.ContentLength;

                        Stream esicStream = esicPostedFile.InputStream;
                        BinaryReader esicBinaryReader = new BinaryReader(esicStream);
                        esicImagebytes = esicBinaryReader.ReadBytes(System.Convert.ToInt32(esicStream.Length));
                        ESICFileUpload.SaveAs(Server.MapPath(ESICFilePath));
                        POcopyUpload.SaveAs(Server.MapPath(POcopyPath));
                        if (esicFilename != "")
                        {
                            string Str = "update tbl_vendor_info set contact_no2='" + txtPhNo2.Text + "'," + "firm_address='" + txtAddress.Text + "'," + "firm_city='" + txtCity.Text + "'," + "firm_state='" + txtState.Text + "'," + "firm_pin='" + txtPIN.Text + "'," + "license_no='" + txtLicenseNo.Text + "'," + "valid_from='" + fdt + "'," + "valid_to='" + tdt + "'," + "workers_authorised='" + txtWAuthorised.Text + "'," + "pfno='" + txtPFNO.Text + "'," + "esicno='" + txtESIC.Text + "', " + "img_file='" + imgName + "', " + "pfdoc='" + PFileUpload1 + "', " + "esicdoc='" + ESICFileUpload1 + "', " + "pano='" + txtPANNo.Text + "', " + "gstno='" + txtGSTNo.Text + "', " + "pocopy='" + POcopyUpload1 + "', " + "venImageData= @venImageData  " + "where vendor_reg_code='" + Session["User"] + "' ";

                            SqlCommand cm = new SqlCommand(Str, con);

                            SqlParameter venImageData1 = new SqlParameter()
                            {
                                ParameterName = "@venImageData",
                                Value = Imagebytes
                            };
                            cm.Parameters.Add(venImageData1);

                            // If esicImagebytes Is Nothing Then
                            // Dim esicImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@esicImageData",
                            // .Value = DBNull.Value
                            // }
                            // cm.Parameters.Add(esicImageData1)
                            // Else
                            // Dim esicImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@esicImageData",
                            // .Value = esicImagebytes
                            // }
                            // cm.Parameters.Add(esicImageData1)
                            // End If

                            cm.ExecuteNonQuery();
                            lblMSG.Text = "Data updated successfully";
                        }
                    }
                    // '''''''''--------------------------------------------------'''''''
                    // '''----- NOT SELECTED  UAN and ESIC DOC THEN--update only vendor image '''''''''''
                    if ((pfRadio1.Checked == true & ESICRadio1.Checked == true))
                    {
                        PFileUpload1 = "img";
                        ESICFileUpload1 = "img";
                        POcopyUpload.SaveAs(Server.MapPath(POcopyPath));
                        string Str = "update tbl_vendor_info set contact_no2='" + txtPhNo2.Text + "'," + "firm_address='" + txtAddress.Text + "'," + "firm_city='" + txtCity.Text + "'," + "firm_state='" + txtState.Text + "'," + "firm_pin='" + txtPIN.Text + "'," + "license_no='" + txtLicenseNo.Text + "'," + "valid_from='" + fdt + "'," + "valid_to='" + tdt + "'," + "workers_authorised='" + txtWAuthorised.Text + "'," + "pfno='" + txtPFNO.Text + "'," + "esicno='" + txtESIC.Text + "', " + "img_file='" + imgName + "', " + "pfdoc='" + PFileUpload1 + "', " + "esicdoc='" + ESICFileUpload1 + "', " + "pano='" + txtPANNo.Text + "', " + "gstno='" + txtGSTNo.Text + "', " + "pocopy='" + POcopyUpload1 + "', " + "venImageData= @venImageData  " + "where vendor_reg_code='" + Session["User"] + "' ";


                        SqlCommand cm = new SqlCommand(Str, con);


                        SqlParameter venImageData1 = new SqlParameter()
                        {
                            ParameterName = "@venImageData",
                            Value = Imagebytes
                        };
                        cm.Parameters.Add(venImageData1);
                        cm.ExecuteNonQuery();
                        lblMSG.Text = "Data updated successfully";
                    }
                    // ===============================================================================     
                    // '''----if  SELECTED  UAN and ESIC DOC  THEN--update  image '''''''''''

                    if ((pfRadio2.Checked == true & ESICRadio2.Checked == true))
                    {
                        HttpPostedFile pfPostedFile = PFileUpload.PostedFile;
                        string pfFilename = Path.GetFileName(pfPostedFile.FileName);
                        string pfFileExtension = Path.GetExtension(pfFilename);
                        int pfFileSize = pfPostedFile.ContentLength;
                        Stream pfStream = pfPostedFile.InputStream;
                        BinaryReader pfBinaryReader = new BinaryReader(pfStream);
                        pfImagebytes = pfBinaryReader.ReadBytes(System.Convert.ToInt32(pfStream.Length));

                        HttpPostedFile esicPostedFile = ESICFileUpload.PostedFile;
                        string esicFilename = Path.GetFileName(esicPostedFile.FileName);
                        string esicFileExtension = Path.GetExtension(esicFilename);
                        int esicFileSize = esicPostedFile.ContentLength;
                        Stream esicStream = esicPostedFile.InputStream;
                        BinaryReader esicBinaryReader = new BinaryReader(esicStream);
                        esicImagebytes = esicBinaryReader.ReadBytes(System.Convert.ToInt32(esicStream.Length));

                        PFileUpload.SaveAs(Server.MapPath(PFilePath));
                        ESICFileUpload.SaveAs(Server.MapPath(ESICFilePath));
                        POcopyUpload.SaveAs(Server.MapPath(POcopyPath));

                        if ((pfFilename != "" & esicFilename != ""))
                        {
                            string Str = "update tbl_vendor_info set contact_no2='" + txtPhNo2.Text + "'," + "firm_address='" + txtAddress.Text + "'," + "firm_city='" + txtCity.Text + "'," + "firm_state='" + txtState.Text + "'," + "firm_pin='" + txtPIN.Text + "'," + "license_no='" + txtLicenseNo.Text + "'," + "valid_from='" + fdt + "'," + "valid_to='" + tdt + "'," + "workers_authorised='" + txtWAuthorised.Text + "'," + "pfno='" + txtPFNO.Text + "'," + "esicno='" + txtESIC.Text + "', " + "img_file='" + imgName + "', " + "pfdoc='" + PFileUpload1 + "', " + "esicdoc='" + ESICFileUpload1 + "', " + "pano='" + txtPANNo.Text + "', " + "gstno='" + txtGSTNo.Text + "', " + "pocopy='" + POcopyUpload1 + "', " + "venImageData= @venImageData  " + "where vendor_reg_code='" + Session["User"] + "' ";



                            SqlCommand cm = new SqlCommand(Str, con);


                            SqlParameter venImageData1 = new SqlParameter()
                            {
                                ParameterName = "@venImageData",
                                Value = Imagebytes
                            };
                            cm.Parameters.Add(venImageData1);

                            // If pfImagebytes Is Nothing Then
                            // Dim pfImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@pfImageData",
                            // .Value = DBNull.Value
                            // }
                            // cm.Parameters.Add(pfImageData1)
                            // Else
                            // Dim pfImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@pfImageData",
                            // .Value = pfImagebytes
                            // }
                            // cm.Parameters.Add(pfImageData1)
                            // End If


                            // If esicImagebytes Is Nothing Then
                            // Dim esicImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@esicImageData",
                            // .Value = DBNull.Value
                            // }
                            // cm.Parameters.Add(esicImageData1)
                            // Else
                            // Dim esicImageData1 As SqlParameter = New SqlParameter() With {
                            // .ParameterName = "@esicImageData",
                            // .Value = esicImagebytes
                            // }
                            // cm.Parameters.Add(esicImageData1)
                            // End If

                            cm.ExecuteNonQuery();
                            lblMSG.Text = "Data updated successfully";
                        }
                    }
                }
                else
                    lblMSG.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded"; 
            } // endif  */
          
 
            
           

           }



        //protected void btnDownloandPF_Click(object sender, EventArgs e)
        //{
        //    var path = Server.MapPath("../attd_down_doc");
        //    var filePath = Path.Combine(path, "Atted_Format.csv");
        //    FileInfo file = new FileInfo(filePath);
        //    if (file.Exists)
        //    {
        //        // Clear Rsponse reference  
        //        Response.Clear();
        //        // Add header by specifying file name  
        //        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
        //        // Add header for content length  
        //        Response.AddHeader("Content-Length", file.Length.ToString());
        //        // Specify content type  
        //        Response.ContentType = "text/plain";
        //        // Clearing flush  
        //        Response.Flush();
        //        // Transimiting file  
        //        Response.TransmitFile(file.FullName);
        //        Response.End();
        //    }
        //    Response.Write("Requested file is not available to download");
        //}

        //protected void btnDownloandEsic_Click(object sender, EventArgs e)
        //{
        //    var path = Server.MapPath("~/attd_down_doc");
        //    var filePath = Path.Combine(path, "Atted_Format.csv");
        //    FileInfo file = new FileInfo(filePath);
        //    if (file.Exists)
        //    {
        //        // Clear Rsponse reference  
        //        Response.Clear();
        //        // Add header by specifying file name  
        //        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
        //        // Add header for content length  
        //        Response.AddHeader("Content-Length", file.Length.ToString());
        //        // Specify content type  
        //        Response.ContentType = "text/plain";
        //        // Clearing flush  
        //        Response.Flush();
        //        // Transimiting file  
        //        Response.TransmitFile(file.FullName);
        //        Response.End();
        //    }
        //    Response.Write("Requested file is not available to download");

        //}

        protected void btnDownloandPF_Click(object sender, EventArgs e)
        {
            var path = Server.MapPath("../pf_doc_for_download");
            var filePath = Path.Combine(path, "DECLARATION-FOR-EPF.pdf");
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

        protected void btnDownloandEsic_Click(object sender, EventArgs e)
        {
            var path = Server.MapPath("../esic_doc_for_download");
            var filePath = Path.Combine(path, "DECLARATION-FOR-ESIC.pdf");
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

        protected void txtUnskilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtWAuthorised.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();
        }

        protected void txtSemiSkilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtWAuthorised.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();

        }

        protected void txtSkilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtWAuthorised.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();

        }

        protected void txtHighSkilled_TextChanged(object sender, EventArgs e)
        {
            if (txtUnskilled.Text == "")
                txtUnskilled.Text = "0";
            if (txtSemiSkilled.Text == "")
                txtSemiSkilled.Text = "0";
            if (txtSkilled.Text == "")
                txtSkilled.Text = "0";
            if (txtHighSkilled.Text == "")
                txtHighSkilled.Text = "0";

            txtWAuthorised.Text = (Convert.ToInt32(txtUnskilled.Text) + Convert.ToInt32(txtSemiSkilled.Text) + Convert.ToInt32(txtSkilled.Text) + Convert.ToInt32(txtHighSkilled.Text)).ToString();

        }
      

    }
}