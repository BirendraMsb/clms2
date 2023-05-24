<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testChart.aspx.cs" Inherits="clms2.admin.testChart" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Chart ID="Chart1" runat="server" Height="515px" Width="904px">
            <series>
                <asp:Series Name="Series1" YValuesPerPoint="2">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
    </form>
</body>
</html>
