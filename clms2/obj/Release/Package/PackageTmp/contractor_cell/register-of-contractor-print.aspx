﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register-of-contractor-print.aspx.cs" Inherits="clms2.contractor_cell.register_of_contractor_print" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="padding:15px " >
         <div style="align:center">
             <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="1100px" Width="1064px"></rsweb:ReportViewer>
         </div>
    </div>
    </form>
</body>
</html>
