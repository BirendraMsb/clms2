﻿using System;
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
    public partial class vendor_detailNew : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        public void dbConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        protected void GvEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvEmp.PageIndex = e.NewPageIndex;
              GvEmp.DataBind();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            if (!Page.IsPostBack)
            {
            }

            BindGrid();

        }

        private void BindGrid()
        {
            try
            {
                dbConnection();

                // '''''''''''''''''''''''''''''''''''''''''''
               ///// strSQL = "SELECT * FROM tbl_vendor_info";  
                 strSQL = "SELECT * FROM tbl_vendor_info where vendor_reg_code='" + Session["User"].ToString() + "'";

                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GvEmp.DataSource = dt;
                GvEmp.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        protected void GvEmp_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["EmpID"] = GvEmp.SelectedValue;
             Response.Redirect("vendor_detail_entry.aspx");

        }

        protected void GvEmp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    DataRowView dr = (DataRowView)e.Row.DataItem;
            //    string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["venImageData"]);
            //    (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            //    //(Image)e.Row.FindControl("image1").ImageUrl = imageUrl;
            //}

        }

     
      
    }
}