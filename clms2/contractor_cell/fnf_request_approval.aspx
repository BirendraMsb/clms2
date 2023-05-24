<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fnf_request_approval.aspx.cs" Inherits="clms2.contractor_cell.fnf_request_approval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <title></title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="/public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="~/public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="~/public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="~/public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="~/public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="~/public/newfront/assets/css/app.min.css" />
    <link rel="stylesheet" href="~/public/common/css/commoncss.min.css" />
    <link rel="apple-touch-icon" sizes="57x57" href="~/public/common/icons/apple-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="60x60" href="~/public/common/icons/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="~/public/common/icons/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="~/public/common/icons/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="~/public/common/icons/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="~/public/common/icons/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="~/public/common/icons/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="~/public/common/icons/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="~/public/common/icons/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="~/public/common/icons/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/public/common/icons/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="~/public/common/icons/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="~/public/common/icons/favicon-16x16.png" />

    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />
    <style>
        .nav-link {
            padding: 0.32rem 0.75rem;
        }

        .bg-dark {
            background-color: #292e40 !important;
        }

        .icon-svg, .icon-svg.icon-svg-lg {
            width: 3rem;
            height: 3rem;
        }

        img, svg {
            vertical-align: middle;
        }

            svg:not(:root) {
                overflow: hidden;
            }
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar navbar-expand-lg transparent navbar-dark bg-dark">
                        <div class="container-fluid">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="dashboard.aspx">
                                    <span>
                                        <img src="../public/common/images/straight_logo_greenhrm.png" class="logo-lg logo-light" alt="GreenHRM Solutions | Breaking Stereotypes Logo" width="188" height="50" />
                                    </span>
                                </a>
                            </div>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarColor02">
                                <ul class="navbar-nav me-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="dashboard.aspx">Dashboard
                                <span class="visually-hidden">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Work Order <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="work-order-entry.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>New Work Order
                                                </a>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="work-order-details-all.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>View work order
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="work-order-detail.aspx?vl=awo">
                                                    <i class="fa fa-angle-right me-1"></i>Pending Work Order
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/purposed-emp-detail-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Approval
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/purposed-emp-detail-block.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Blocking
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Attendance <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/attendance-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Attendance Approval
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Compliances <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/purposed-wages-doc-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Wages Document 
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Statutory <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/register-of-contractor.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>From XII
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/annual-return.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form XXV
                                                </a>
                                            </li>


                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee Offboarding <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="fnf_request_approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Pending Full and Final Request
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="fnf_request_approved.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Approved Full and Final Request
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Report <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/emp_chart_report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Chart
                                                </a>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/emp_bar_chart.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Bar Chart
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/vendor_chart.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Vendor Chart
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/vendor_bar_chart.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Vendor Bar Chart
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mail <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/mail_sending_form.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Mail
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">

                                            <li>
                                                <a class="dropdown-item" href="../login/new-password.aspx">
                                                    <i class="fa fa-lock me-1"></i>Change Password
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../logout.aspx">
                                                    <i class="fa fa-power-off me-1"></i>Logout
                                                </a>
                                            </li>
                                        </ul>
                                    </li>

                                    <%-- <li class="nav-item">
                            <a class="nav-link">User</a>
                        </li>--%>

                                    <%--<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>--%>
                                </ul>
                                <form class="d-flex">
                                    <asp:Label ID="lblDate" runat="server" class="form-control bg-dark" Text="Date" Style="color: white; font-size: 15px; width: auto"></asp:Label>
                                    &nbsp;&nbsp;
                         <img src="../images/k2.png" alt="Department" width="50" height="50" />&nbsp;&nbsp;  
                       <asp:Label ID="lblUser" runat="server" Text="" Style="color: #FFFFCC; font-size: 15px"></asp:Label>&nbsp;&nbsp;
                     <%-- <input class="form-control me-sm-2" type="search" placeholder="Search">--%>
                                    <%--  <button class="btn btn-secondary my-2 my-sm-0" type="submit" fdprocessedid="i5uef7">Search</button>--%>
                                </form>
                            </div>
                        </div>
                    </nav>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="page-wrapper">
                        <div class="page-content-tab">
                            <div class="container-fluid">
                                <br />
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">Full and Final Request Approval</div>
                                    <div class="card-body">
                                        <asp:TextBox ID="txtID" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                        <asp:TextBox ID="txtID1" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <%-- <asp:Button ID="cmdSubmit" runat="server" Text="Submit" Width="150px" class="btn btn-info"  ></asp:Button>--%>
                                                    <%-- <asp:Button ID="btnBulkInsert" runat="server" Text="Insert" Width="150px" class="btn btn-info" OnClick="btnBulkInsert_Click"></asp:Button>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="width: 1000px">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <%--   <label>Vendor code</label>--%>
                                                    <asp:DropDownList ID="ddlVendorCode" class="form-control" runat="server" Visible="false" MaxLength="50" AutoPostBack="true" OnSelectedIndexChanged="ddlVendorCode_SelectedIndexChanged">
                                                        <asp:ListItem>Select</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <%--<label>Work Order</label>--%>
                                                    <asp:DropDownList ID="ddlWorkdOrder" class="form-control" runat="server" Visible="false" MaxLength="50" AutoPostBack="True" OnSelectedIndexChanged="ddlWorkdOrder_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%--      <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>Month</label>
                                                    <asp:DropDownList ID="ddlMonth" runat="server" class="form-control" AutoPostBack="true" Width="150px" MaxLength="150" >
                                                     
                                                        <asp:ListItem Value="1">Jan</asp:ListItem>
                                                        <asp:ListItem Value="2">Feb</asp:ListItem>
                                                        <asp:ListItem Value="3">Mar</asp:ListItem>
                                                        <asp:ListItem Value="4">Apr</asp:ListItem>
                                                        <asp:ListItem Value="5">May</asp:ListItem>
                                                        <asp:ListItem Value="6">Jun</asp:ListItem>
                                                        <asp:ListItem Value="7">Jul</asp:ListItem>
                                                        <asp:ListItem Value="8">Aug</asp:ListItem>
                                                        <asp:ListItem Value="9">Sep</asp:ListItem>
                                                        <asp:ListItem Value="10">Oct</asp:ListItem>
                                                        <asp:ListItem Value="11">Nov</asp:ListItem>
                                                        <asp:ListItem Value="12">Dec</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            <%--      <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>Year</label>
                                                    <asp:DropDownList ID="ddlYear" runat="server" class="form-control" Width="150px" MaxLength="50"></asp:DropDownList>
                                                </div>
                                            </div>--%>


                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <%-- <label>Emloyee Name</label>--%>
                                                    <asp:TextBox ID="txtEmpName" runat="server" class="form-control" Visible="false" MaxLength="50"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="25%" ForeColor="#333333" GridLines="None">
                                                <AlternatingRowStyle BackColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>
                                        <hr class="my-5" />
                                        <br />
                                        <br />
                                        <%--========================================================================================--%>
                                        <div>
                                            <div class="table-responsive" style="overflow: auto;">
                                                <%-- <div class="table-responsive" style="width:50%;">--%>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                    GridLines="Vertical" AllowPaging="false" PageSize="5" DataKeyNames="id" EmptyDataText="No records has been added."
                                                    Class="table table-bordered nowrap w-70" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDataBound="GridView2_RowDataBound" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl. No">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Work Order" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="work_order" runat="server" Text='<%# Eval("work_order") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="150px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Vendor Code" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="vendor_code" runat="server" Text='<%# Eval("vendor_code") %>'></asp:Label>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Emmployee Name" ItemStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="emp_name" runat="server" Text='<%# Eval("emp_name") %>'></asp:Label>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Department" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="department" runat="server" Text='<%# Eval("department") %>'></asp:Label>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Last Working Day" ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="last_working_day" runat="server" Text='<%# Eval("last_working_day") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date of Request" ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="date_of_request" runat="server" Text='<%# Eval("date_of_request") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Reason For Separation" ItemStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="reason_for_separation" runat="server" Text='<%# Eval("reason_for_separation") %>'></asp:Label>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Approval By HR" ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="hr_approval" runat="server" Text='<%#Eval("hr_approval") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlHRApproval" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlHRApproval_SelectedIndexChanged">
                                                                    <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                                                    <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="HR Remarks" Visible="false" ItemStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="hr_remarks" runat="server" Text='<%#Eval("hr_remarks") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="hr_remarks" runat="server" Text='<%#Eval("hr_remarks")%>'></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqValHRRemarks" runat="server" Enabled="false" ControlToValidate="hr_remarks" ErrorMessage="Remarks" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Label ID="id" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                                <asp:Button ID="btn_Update" runat="server" Text="OK" CommandName="Update" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <AlternatingRowStyle BackColor="#FFFFFF" />
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle CssClass="GridPager" BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#B2DFDB" ForeColor="Black" />
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <%--========================================================================================--%>
                                        <hr class="my-5" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:Label ID="lblError" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                                    <asp:Label ID="lblMsg" runat="server" Text="" Font-Size="Large" ForeColor="blue" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="lblMsgError" runat="server" ForeColor="#CC0000" Font-Bold="True"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <footer class="py-3 bg-dark mt-auto navbar-fixed-bottom">
                        <div class="container-fluid">
                            <div class="text-center small">
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</div>

                                <%--<div class="text-light d-none d-sm-inline-block float-end">
				 <a href="https://shitij.in">Kshitij Info Solutions</a>
			</div>--%>
                            </div>
                        </div>
                    </footer>
                </td>
            </tr>
        </table>
        <script type="text/jscript" src="~/public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="~/public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="~/public/newfront/assets/js/app.js" defer></script>
        <script type="text/jscript" src="~/public/newfront/datatables/datatables.min.js" defer></script>
        <script type="text/jscript" src="~/public/newfront/js/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <script type="text/jscript" defer>
            $(window).on("load", function () {
                $('.loading').fadeOut(1000);
                tool_tip();
                $('a[href="#"]').on("click", function (e) {
                    e.preventDefault ? e.preventDefault() :
                e.returnValue = false
                });
                $(".alert").fadeTo(5000, 500).slideUp(500, function () {
                    $(".alert").slideUp(500);
                });
                function tool_tip() {
                    $('[data-bs-toggle="tooltip"]').tooltip({ container: 'body' });
                }
                function fademeout() {
                    $(".loading").fadeOut(1000);
                }
                $(document).ajaxSend(function () {
                    fademeout();
                });
                $(document).ajaxComplete(function () {
                    tool_tip();
                });
            });
        </script>


    </form>
</body>

</html>
