using System;
using System.Collections;
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
    public partial class manual_correction : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"] != null ? Session["User"].ToString() : "";
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void cmdShow_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            lblError.Text = "";
            lblMsg.Text = "";
            lblMsgError.Text = "";

            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "SELECT * FROM tbl_manual_punch WHERE 1=1";

            string dt1 = txtdate1.Text.Trim();
            string dt2 = txtdate2.Text.Trim();

            DateTime fromDate, toDate;
            bool hasFrom = DateTime.TryParseExact(dt1, new string[] { "dd-MM-yyyy", "dd/MM/yyyy", "yyyy-MM-dd" }, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out fromDate);
            bool hasTo = DateTime.TryParseExact(dt2, new string[] { "dd-MM-yyyy", "dd/MM/yyyy", "yyyy-MM-dd" }, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out toDate);

            if (hasFrom && hasTo)
            {
                query += " AND TRY_CONVERT(date, [date], 103) >= @dt1 AND TRY_CONVERT(date, [date], 103) <= @dt2";
            }
            else if (hasFrom)
            {
                query += " AND TRY_CONVERT(date, [date], 103) >= @dt1";
            }
            else if (hasTo)
            {
                query += " AND TRY_CONVERT(date, [date], 103) <= @dt2";
            }
            else if (!string.IsNullOrEmpty(dt1) && !string.IsNullOrEmpty(dt2))
            {
                query += " AND [date] >= @dt1Raw AND [date] <= @dt2Raw";
            }
            else if (!string.IsNullOrEmpty(dt1))
            {
                query += " AND [date] >= @dt1Raw";
            }
            else if (!string.IsNullOrEmpty(dt2))
            {
                query += " AND [date] <= @dt2Raw";
            }

            query += " ORDER BY id DESC";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (hasFrom)
                    {
                        cmd.Parameters.AddWithValue("@dt1", fromDate.Date);
                    }
                    if (hasTo)
                    {
                        cmd.Parameters.AddWithValue("@dt2", toDate.Date);
                    }
                    if (!hasFrom && !string.IsNullOrEmpty(dt1))
                    {
                        cmd.Parameters.AddWithValue("@dt1Raw", dt1);
                    }
                    if (!hasTo && !string.IsNullOrEmpty(dt2))
                    {
                        cmd.Parameters.AddWithValue("@dt2Raw", dt2);
                    }

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            try
                            {
                                sda.Fill(dt);
                                GridView2.DataSource = dt;
                                GridView2.DataBind();
                            }
                            catch (Exception ex)
                            {
                                lblError.Text = "Error loading data: " + ex.Message;
                            }
                        }
                    }
                }
            }
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            lblMsg.Text = "";
            lblMsgError.Text = "";

            int updatedCount = 0;
            int selectedCount = 0;

            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = row.FindControl("chkRow") as CheckBox;
                    if (chkRow != null && chkRow.Checked)
                    {
                        selectedCount++;
                        int id = 0;

                        // Try reading ID from GridView DataKeys first
                        if (GridView2.DataKeys != null && GridView2.DataKeys.Count > row.RowIndex && GridView2.DataKeys[row.RowIndex] != null && GridView2.DataKeys[row.RowIndex].Value != null)
                        {
                            int.TryParse(GridView2.DataKeys[row.RowIndex].Value.ToString(), out id);
                        }

                        // Fallback to row template control
                        if (id == 0)
                        {
                            Label lblId = row.FindControl("id") as Label;
                            if (lblId != null)
                            {
                                int.TryParse(lblId.Text, out id);
                            }
                        }

                        TextBox txtIn = row.FindControl("in_time") as TextBox;
                        TextBox txtOut = row.FindControl("out_time") as TextBox;

                        string inTime = txtIn != null ? txtIn.Text.Trim() : "";
                        string outTime = txtOut != null ? txtOut.Text.Trim() : "";

                        if (id > 0)
                        {
                            int res = BulkUpdateManPunch(id, inTime, outTime);
                            if (res > 0)
                            {
                                updatedCount++;
                            }
                        }
                    }
                }
            }

            if (selectedCount == 0)
            {
                lblError.Text = "Please select at least one record to update.";
            }
            else if (updatedCount > 0)
            {
                lblMsg.Text = updatedCount + " punch record(s) updated successfully.";
                BindGrid();
            }
            else
            {
                lblError.Text = "No records were updated.";
            }
        }

        public int BulkUpdateManPunch(int csvIDs, string inTime, string outTime)
        {
            SqlConnection cn = null;
            SqlCommand cmd = null;
            int counter = 0;
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            try
            {
                cn = new SqlConnection(constr);
                cmd = new SqlCommand();
                cmd.Connection = cn;
                cmd.CommandText = "UPDATE tbl_manual_punch SET in_time = @in_time, out_time = @out_time WHERE id = @ids";
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ids", csvIDs);
                cmd.Parameters.AddWithValue("@in_time", string.IsNullOrEmpty(inTime) ? (object)DBNull.Value : inTime);
                cmd.Parameters.AddWithValue("@out_time", string.IsNullOrEmpty(outTime) ? (object)DBNull.Value : outTime);

                cn.Open();
                counter = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                {
                    cn.Close();
                }
            }
            return counter;
        }

        public int BulkUpdateManPunch(int csvIDs, DateTime inTime, DateTime outTime)
        {
            return BulkUpdateManPunch(csvIDs, inTime.ToString("HH:mm:ss"), outTime.ToString("HH:mm:ss"));
        }
    }
}