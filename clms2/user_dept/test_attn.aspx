<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html>
<html>
<head><title>Test Query</title></head>
<body>
<%
    string connStr = ConfigurationManager.ConnectionStrings["const"].ConnectionString;
    using (SqlConnection con = new SqlConnection(connStr))
    {
        con.Open();
        Response.Write("<h3>tbl_attendance</h3>");
        using (SqlCommand cmd = new SqlCommand("SELECT top 10 id, emp_code, emp_name, workorder, department, dept_approval, hr_approval, year1, month1 FROM tbl_attendance", con))
        {
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    Response.Write(string.Format("id: {0}, emp_code: {1}, emp_name: {2}, workorder: {3}, department: {4}, dept_approval: {5}, hr_approval: {6}, year: {7}, month: {8}<br/>",
                        dr["id"], dr["emp_code"], dr["emp_name"], dr["workorder"], dr["department"], dr["dept_approval"], dr["hr_approval"], dr["year1"], dr["month1"]));
                }
            }
        }
        Response.Write("<h3>tbl_vendor_work_order departments</h3>");
        using (SqlCommand cmd = new SqlCommand("SELECT distinct work_worder, department FROM tbl_vendor_work_order", con))
        {
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    Response.Write(string.Format("work_worder: {0}, department: {1}<br/>", dr["work_worder"], dr["department"]));
                }
            }
        }
    }
%>
</body>
</html>
