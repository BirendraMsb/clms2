using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace clms2.contractor_cell
{
    public partial class emp_chart_report : System.Web.UI.Page
    {
        public string strSQL;
        private static string Conn = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
        private SqlConnection con = new SqlConnection(Conn);
        protected void Page_Load(object sender, EventArgs e)
        {
            string usrnm = Session["User"].ToString();
            lblUser.Text = usrnm;
            lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            if (!this.IsPostBack)
            {
                this.dept_chart();
                cast_chart();
                gender_chart();
                State_chart();
                education_chart();
                skill_cat_chart();
            }

        }

        protected void dept_chart()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select department ,COUNT(department) no_of_dept from tbl_emp group by department";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);

                        string[] x = new string[dt.Rows.Count];
                        int[] y = new int[dt.Rows.Count];

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            x[i] = dt.Rows[i][0].ToString();
                            y[i] = Convert.ToInt32(dt.Rows[i][1]);
                        }
                        Series series = Chart1.Series["Series1"];
                        Chart1.Series[0].Points.DataBindXY(x, y);
                        Chart1.Series[0].ChartType = SeriesChartType.Pie;
                        Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

                        Chart1.Series["Series1"].Label = "#PERCENT{P2}";
                        Chart1.Series["Series1"].LegendText = "#VALX";
                        Chart1.Legends[0].LegendStyle = LegendStyle.Column;
                        Chart1.Legends[0].Docking = Docking.Right;
                        Chart1.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        Chart1.Legends[0].Enabled = true;


                        //GridView1.DataSource = dt;
                        //GridView1.DataBind();
                    }
                }
            }
        }

        protected void cast_chart()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select emp_cast ,COUNT(emp_cast) as no_of_cast from tbl_emp  group by emp_cast";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);

                        string[] x = new string[dt.Rows.Count];
                        int[] y = new int[dt.Rows.Count];

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            x[i] = dt.Rows[i][0].ToString();
                            y[i] = Convert.ToInt32(dt.Rows[i][1]);
                        }
                        Series series = Chart2.Series["Series2"];
                        Chart2.Series[0].Points.DataBindXY(x, y);
                        Chart2.Series[0].ChartType = SeriesChartType.Pie;
                        Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;

                        Chart2.Series["Series2"].Label = "#PERCENT{P2}";
                        Chart2.Series["Series2"].LegendText = "#VALX";
                        Chart2.Legends[0].LegendStyle = LegendStyle.Column;
                        Chart2.Legends[0].Docking = Docking.Right;
                        Chart2.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        Chart2.Legends[0].Enabled = true;



                    }
                }
            }
        }

        protected void gender_chart()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select gender ,COUNT(gender) as no_of_gender from tbl_emp  group by gender";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);

                        string[] x = new string[dt.Rows.Count];
                        int[] y = new int[dt.Rows.Count];

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            x[i] = dt.Rows[i][0].ToString();
                            y[i] = Convert.ToInt32(dt.Rows[i][1]);
                        }
                        Series series = Chart3.Series["Series3"];
                        Chart3.Series[0].Points.DataBindXY(x, y);
                        Chart3.Series[0].ChartType = SeriesChartType.Pie;
                        Chart3.ChartAreas["ChartArea3"].Area3DStyle.Enable3D = true;

                        Chart3.Series["Series3"].Label = "#PERCENT{P2}";
                        Chart3.Series["Series3"].LegendText = "#VALX";
                        Chart3.Legends[0].LegendStyle = LegendStyle.Column;
                        Chart3.Legends[0].Docking = Docking.Right;
                        Chart3.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        Chart3.Legends[0].Enabled = true;

                    }
                }
            }
        }

        protected void State_chart()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select state ,COUNT(state) as no_of_state from tbl_emp  group by state";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);

                        string[] x = new string[dt.Rows.Count];
                        int[] y = new int[dt.Rows.Count];

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            x[i] = dt.Rows[i][0].ToString();
                            y[i] = Convert.ToInt32(dt.Rows[i][1]);
                        }
                        Series series = Chart4.Series["Series4"];
                        Chart4.Series[0].Points.DataBindXY(x, y);
                        Chart4.Series[0].ChartType = SeriesChartType.Pie;
                        Chart4.ChartAreas["ChartArea4"].Area3DStyle.Enable3D = true;

                        Chart4.Series["Series4"].Label = "#PERCENT{P2}";
                        Chart4.Series["Series4"].LegendText = "#VALX";
                        Chart4.Legends[0].LegendStyle = LegendStyle.Column;
                        Chart4.Legends[0].Docking = Docking.Right;
                        Chart4.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        Chart4.Legends[0].Enabled = true;

                    }
                }
            }
        }

        protected void education_chart()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select education ,COUNT(education) as no_of_edu_emp from tbl_emp  group by education";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);

                        string[] x = new string[dt.Rows.Count];
                        int[] y = new int[dt.Rows.Count];

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            x[i] = dt.Rows[i][0].ToString();
                            y[i] = Convert.ToInt32(dt.Rows[i][1]);
                        }
                        Series series = Chart5.Series["Series5"];
                        Chart5.Series[0].Points.DataBindXY(x, y);
                        Chart5.Series[0].ChartType = SeriesChartType.Pie;
                        Chart5.ChartAreas["ChartArea5"].Area3DStyle.Enable3D = true;

                        Chart5.Series["Series5"].Label = "#PERCENT{P2}";
                        Chart5.Series["Series5"].LegendText = "#VALX";
                        Chart5.Legends[0].LegendStyle = LegendStyle.Column;
                        Chart5.Legends[0].Docking = Docking.Right;
                        Chart5.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        Chart5.Legends[0].Enabled = true;

                    }
                }
            }
        }

        protected void skill_cat_chart()
        {
            string constr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
            string query = "select skill_category ,COUNT(skill_category) as no_of_skill_cat from tbl_emp  group by skill_category";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);

                        string[] x = new string[dt.Rows.Count];
                        int[] y = new int[dt.Rows.Count];

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            x[i] = dt.Rows[i][0].ToString();
                            y[i] = Convert.ToInt32(dt.Rows[i][1]);
                        }
                        Series series = Chart6.Series["Series6"];
                        Chart6.Series[0].Points.DataBindXY(x, y);
                        Chart6.Series[0].ChartType = SeriesChartType.Pie;
                        Chart6.ChartAreas["ChartArea6"].Area3DStyle.Enable3D = true;

                        Chart6.Series["Series6"].Label = "#PERCENT{P2}";
                        Chart6.Series["Series6"].LegendText = "#VALX";
                        Chart6.Legends[0].LegendStyle = LegendStyle.Column;
                        Chart6.Legends[0].Docking = Docking.Right;
                        Chart6.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        Chart6.Legends[0].Enabled = true;

                    }
                }
            }
        }


    }
}