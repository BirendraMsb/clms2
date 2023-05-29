<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attendance-view.aspx.cs" Inherits="clms2.vendor_onboarding.attendance_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />

    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css" />

    <link rel="apple-touch-icon" sizes="60x60" href="../public/common/icons/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="../public/common/icons/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="../public/common/icons/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="../public/common/icons/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="../public/common/icons/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="../public/common/icons/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="../public/common/icons/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="../public/common/icons/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="../public/common/icons/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../public/common/icons/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="../public/common/icons/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../public/common/icons/favicon-16x16.png" />

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

        .gridview-container {
            overflow: auto;
            width: 1000px; /* set your desired width here */
        }
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <%--<div class="loading">
            <div class="loader"></div>
        </div>--%>
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">File <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">

                                            <li>
                                                <a class="dropdown-item" href="shift-master.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Shift Master
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="leave-master.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Leave Master
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="holiday-master.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Holiday Master
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Vendor Registration <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="vendor_detail_entry.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Vendor Update
                                                </a>
                                            </li>

                                            <%-- <li>
                                                <a class="dropdown-item" href="site-incharge.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Site Incharge
                                                </a>
                                            </li>--%>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee Onboarding <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="emp_onboarding.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Detail Entry
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb2" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Attendance <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="show-gen-shift.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Generate Shift
                                                </a>
                                            </li>
                                           <%-- <li>
                                                <a class="dropdown-item" href="shift-master.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Update Leave Register
                                                </a>
                                            </li>--%>
                                            <li>
                                                <a class="dropdown-item" href="upload_attendance.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Upload Attendance
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="attendance-view.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Attendance View
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="manual-punching.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Manual Punching
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="manual-correction.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Manual Corrections
                                                </a>
                                            </li>


                                        </ul>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Payroll <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="AllowancesMaster.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Allowances
                                                </a>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="payroll_process.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Payroll Process
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="annual_bonus.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Annual Bonus
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="leave_status.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Leave Status
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="wage-slip.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Pay Slip
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Compliances <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">


                                            <li>
                                                <a class="dropdown-item" href="wages_document.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Wages document
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Statutory<span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                             <li>
                                                <a class="dropdown-item" href="form16.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form XVI
                                                </a>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="form17.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form XVII
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="form-V.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form V
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="register-of-workmen.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form XIII
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="register-of-fines.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form XXI
                                                </a>
                                            </li>
                                            
                                            <li>
                                                <a class="dropdown-item" href="register-of-OT.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Form XXIII
                                                </a>
                                            </li>
                                          
                                            <li>
                                                <a class="dropdown-item" href="license_certificate.aspx">
                                                    <i class="fa fa-angle-right me-1"></i> Form XXIV
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee Offboarding <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="fnf_request.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Full and Final Request
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="fnf_settlement.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Full and Final Settelment
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="gratuity.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Gratuity
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Report <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="work-order-detail.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Work Order Detail
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="emp_detail.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Detail
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="vendor_detailNew.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Vendor Detail
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <i class="fa fa-angle-right me-1"></i>GP Detail
                                                </a>
                                            </li>
                                            <%--   <li>
                                                <a class="dropdown-item" href="emp_chart_report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i> Employee Chart Report
                                                </a>
                                            </li>--%>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="vendor_detail.aspx">
                                                    <i class="fa fa-user me-1"></i>My Account
                                                </a>
                                            </li>
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
                                    <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">
                                        <span>Attendance Details</span>

                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow: scroll; width: 80%">
                                            <%--========================================================================================--%>
                                            <asp:DropDownList ID="ddlWorkOrder" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlWorkOrder_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:Label ID="lblMSG" runat="server" Text="" Font-Size="15" ForeColor="Red"></asp:Label>
                                            <asp:Label ID="lblVendorName" runat="server" Text="" Font-Size="15" ForeColor="Blue"></asp:Label>

                                            <asp:GridView ID="GvAttn" runat="server" CssClass="gridview-container" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                GridLines="Vertical" AllowPaging="false" PageSize="10" DataKeyNames="id" Class="table table-bordered nowrap" ShowHeaderWhenEmpty="true" OnPageIndexChanging="GvAttn_PageIndexChanging" OnRowCancelingEdit="GvAttn_RowCancelingEdit" OnRowEditing="GvAttn_RowEditing" OnRowUpdating="GvAttn_RowUpdating">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl. No">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Vendor Code" SortExpression="vendor_code">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="txt_vendor_code" runat="server" Text='<%# Bind("vendor_code") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_vendor_code" runat="server" Text='<%# Bind("vendor_code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="70px" />
                                                        <ItemStyle Width="10px" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Emp Code">
                                                    <%--    <EditItemTemplate>
                                                            <asp:TextBox ID="txt_emp_code" runat="server" Text='<%# Bind("emp_code") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_code" runat="server" Text='<%# Bind("emp_code") %>'></asp:Label>
                                                           <%-- <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id") %>' Text='<%# Eval("emp_code") %>'></asp:HyperLink>--%>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="150px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Emp Name" SortExpression="emp_name">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_emp_name" runat="server" Text='<%# Bind("emp_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_name" runat="server" Text='<%# Bind("emp_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <%--<ControlStyle Width="200px" />--%>
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Department" SortExpression="department">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_department" runat="server" Text='<%# Bind("department") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Department" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Year" SortExpression="year1">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="txt_year1" runat="server" Text='<%# Bind("year1") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_year1" runat="server" Text='<%# Bind("year1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Month" SortExpression="month1">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="txt_month1" runat="server" Text='<%# Bind("month1") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_month1" runat="server" Text='<%# Bind("month1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D1" SortExpression="d1">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d1" runat="server" Text='<%# Bind("d1") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d1" runat="server" Text='<%# Bind("d1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D2" SortExpression="d2">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d2" runat="server" Text='<%# Bind("d2") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d2" runat="server" Text='<%# Bind("d2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D3" SortExpression="d3">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d3" runat="server" Text='<%# Bind("d3") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d3" runat="server" Text='<%# Bind("d3") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D4" SortExpression="d4">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d4" runat="server" Text='<%# Bind("d4") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d4" runat="server" Text='<%# Bind("d4") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D5" SortExpression="d5">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d5" runat="server" Text='<%# Bind("d5") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d5" runat="server" Text='<%# Bind("d5") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D6" SortExpression="d6">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d6" runat="server" Text='<%# Bind("d6") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d6" runat="server" Text='<%# Bind("d6") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D7" SortExpression="d7">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d7" runat="server" Text='<%# Bind("d7") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d7" runat="server" Text='<%# Bind("d7") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D8" SortExpression="d8">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d8" runat="server" Text='<%# Bind("d8") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d8" runat="server" Text='<%# Bind("d8") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D9" SortExpression="d9">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d9" runat="server" Text='<%# Bind("d9") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d9" runat="server" Text='<%# Bind("d9") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D10" SortExpression="d10">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d10" runat="server" Text='<%# Bind("d10") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d10" runat="server" Text='<%# Bind("d10") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D11" SortExpression="d11">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d11" runat="server" Text='<%# Bind("d11") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d11" runat="server" Text='<%# Bind("d11") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D12" SortExpression="d12">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d12" runat="server" Text='<%# Bind("d12") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d12" runat="server" Text='<%# Bind("d12") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D13" SortExpression="d13">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d13" runat="server" Text='<%# Bind("d13") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d13" runat="server" Text='<%# Bind("d13") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D14" SortExpression="d14">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d14" runat="server" Text='<%# Bind("d14") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d14" runat="server" Text='<%# Bind("d14") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D15" SortExpression="d15">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d15" runat="server" Text='<%# Bind("d15") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d15" runat="server" Text='<%# Bind("d15") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D16" SortExpression="d16">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d16" runat="server" Text='<%# Bind("d16") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d16" runat="server" Text='<%# Bind("d16") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D17" SortExpression="d17">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d17" runat="server" Text='<%# Bind("d17") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d17" runat="server" Text='<%# Bind("d17") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D18" SortExpression="d18">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d18" runat="server" Text='<%# Bind("d18") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d18" runat="server" Text='<%# Bind("d18") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D19" SortExpression="d19">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d19" runat="server" Text='<%# Bind("d19") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d19" runat="server" Text='<%# Bind("d19") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D20" SortExpression="d20">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d20" runat="server" Text='<%# Bind("d20") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d20" runat="server" Text='<%# Bind("d20") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D21" SortExpression="d21">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d21" runat="server" Text='<%# Bind("d21") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d21" runat="server" Text='<%# Bind("d21") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D22" SortExpression="d22">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d22" runat="server" Text='<%# Bind("d22") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d22" runat="server" Text='<%# Bind("d22") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D23" SortExpression="d23">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d23" runat="server" Text='<%# Bind("d23") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d23" runat="server" Text='<%# Bind("d23") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D24" SortExpression="d24">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d24" runat="server" Text='<%# Bind("d24") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d24" runat="server" Text='<%# Bind("d24") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D25" SortExpression="d25">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d25" runat="server" Text='<%# Bind("d25") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d25" runat="server" Text='<%# Bind("d25") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D26" SortExpression="d26">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d26" runat="server" Text='<%# Bind("d26") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d26" runat="server" Text='<%# Bind("d26") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D27" SortExpression="d27">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d27" runat="server" Text='<%# Bind("d27") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d27" runat="server" Text='<%# Bind("d27") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D28" SortExpression="d28">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d28" runat="server" Text='<%# Bind("d28") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d28" runat="server" Text='<%# Bind("d28") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D29" SortExpression="d29">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d29" runat="server" Text='<%# Bind("d29") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d29" runat="server" Text='<%# Bind("d29") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D30" SortExpression="d30">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d30" runat="server" Text='<%# Bind("d30") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d30" runat="server" Text='<%# Bind("d30") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D31" SortExpression="d31">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_d31" runat="server" Text='<%# Bind("d31") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_d31" runat="server" Text='<%# Bind("d31") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Present" SortExpression="Present">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="txt_Present" runat="server" Text='<%# Bind("Present") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Present" runat="server" Text='<%# Bind("Present") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Absent" SortExpression="Absent">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="txt_Absent" runat="server" Text='<%# Bind("Absent") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Absent" runat="server" Text='<%# Bind("Absent") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                               <%--     <asp:TemplateField HeaderText="Tot. Working Day" SortExpression="tot_working_day">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_tot_working_day" runat="server" Text='<%# Bind("tot_working_day") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="tbl_tot_working_day" runat="server" Text='<%# Bind("tot_working_day") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Tot. Leave" SortExpression="tot_leave">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="txt_tot_leave" runat="server" Text='<%# Bind("tot_leave") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_tot_leave" runat="server" Text='<%# Bind("tot_leave") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tot. HL" SortExpression="tot_holidays">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="txt_tot_holidays" runat="server" Text='<%# Bind("tot_holidays") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_tot_holidays" runat="server" Text='<%# Bind("tot_holidays") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tot. Week off" SortExpression="tot_week_off">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="txt_tot_week_off" runat="server" Text='<%# Bind("tot_week_off") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_tot_week_off" runat="server" Text='<%# Bind("tot_week_off") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Working Hrs" SortExpression="daily_working_hrs">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="txt_daily_working_hrs" runat="server"  Text='<%# Bind("daily_working_hrs") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_daily_working_hrs" runat="server" Text='<%# Bind("daily_working_hrs") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Monthly Working Hrs" SortExpression="monthly_work_hrs">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="txt_monthly_work_hrs" runat="server" Text='<%# Bind("monthly_work_hrs") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_monthly_work_hrs" runat="server" Text='<%# Bind("monthly_work_hrs") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Monthly OT Hrs" SortExpression="monthly_ot_hrs">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_monthly_ot_hrs" runat="server" Text='<%# Bind("monthly_ot_hrs") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_monthly_ot_hrs" runat="server" Text='<%# Bind("monthly_ot_hrs") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>

                                                    <%--  <asp:TemplateField HeaderText="Action By Dept">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_DeptApproval" runat="server" Text='<%#Eval("dept_approval") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlDeptApproval" runat="server" AutoPostBack="false">
                                                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                                                <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--    <asp:TemplateField HeaderText="Dept Remarks" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_DeptRemarks" runat="server" Text='<%#Eval("dept_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_DeptRemarks" runat="server" Text='<%#Eval("dept_remarks")%>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                            <asp:Button ID="btn_Update" runat="server" Text="OK" CommandName="Update" />
                                                            <%--<asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />--%>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>



                                                    <%--   <asp:BoundField DataField="vendor_code" HeaderText="Vendor Code" SortExpression="vendor_code" ItemStyle-Wrap="false"></asp:BoundField>
                                                    <asp:BoundField DataField="workorder" HeaderText="Work Order" SortExpression="workorder" ItemStyle-Wrap="false"></asp:BoundField>
                                                    <asp:HyperLinkField DataTextField="emp_code" DataNavigateUrlFields="Id" HeaderText="Emp Code" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="emp_name" HeaderText="Emp Name" SortExpression="workorder" ItemStyle-Wrap="false"></asp:BoundField>
                                                    <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" ItemStyle-Wrap="false"></asp:BoundField>
                                                     <asp:BoundField DataField="year1" HeaderText="Year" SortExpression="year1" ItemStyle-Wrap="false"></asp:BoundField>
                                                    <asp:BoundField DataField="month1" HeaderText="Month" SortExpression="month1" ItemStyle-Wrap="false"></asp:BoundField>
                                                    <asp:BoundField DataField="d1" HeaderText="D1" SortExpression="d1" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d2" HeaderText="D2" SortExpression="d2" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d3" HeaderText="D3" SortExpression="d3" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d4" HeaderText="D4" SortExpression="d4" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d5" HeaderText="D5" SortExpression="d5" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d6" HeaderText="D6" SortExpression="d6" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d7" HeaderText="D7" SortExpression="d7" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d8" HeaderText="D8" SortExpression="d8" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d9" HeaderText="D9" SortExpression="d9" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d10" HeaderText="D10" SortExpression="d10" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d11" HeaderText="D11" SortExpression="d11" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d12" HeaderText="D12" SortExpression="d12" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d13" HeaderText="D13" SortExpression="d13" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d14" HeaderText="D14" SortExpression="d14" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d15" HeaderText="D15" SortExpression="d15" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d16" HeaderText="D16" SortExpression="d16" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d17" HeaderText="D17" SortExpression="d17" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d18" HeaderText="D18" SortExpression="d18" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d19" HeaderText="D19" SortExpression="d19" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d20" HeaderText="D20" SortExpression="d20" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d21" HeaderText="D21" SortExpression="d21" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d22" HeaderText="D22" SortExpression="d22" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d23" HeaderText="D23" SortExpression="d23" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d24" HeaderText="D24" SortExpression="d24" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d25" HeaderText="D25" SortExpression="d25" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d26" HeaderText="D26" SortExpression="d26" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d27" HeaderText="D27" SortExpression="d27" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d28" HeaderText="D28" SortExpression="d28" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d29" HeaderText="D29" SortExpression="d29" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d30" HeaderText="D30" SortExpression="d30" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="d31" HeaderText="D31" SortExpression="d31" ItemStyle-Wrap="false" />

                                                     <asp:BoundField DataField="Present" HeaderText="Present" SortExpression="Present" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="Absent" HeaderText="Absent" SortExpression="Absent" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="tot_working_day" HeaderText="Tot. Working Day" SortExpression="tot_working_day" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="tot_leave" HeaderText="Tot. Leave" SortExpression="tot_leave" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="tot_holidays" HeaderText="Tot. HL" SortExpression="tot_holidays" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="tot_week_off" HeaderText="Tot. Week off" SortExpression="tot_week_off" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="daily_working_hrs" HeaderText="Working Hrs" SortExpression="daily_working_hrs" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="monthly_work_hrs" HeaderText="Monthly Working Hrs" SortExpression="monthly_work_hrs" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="monthly_ot_hrs" HeaderText="Monthly OT Hrs" SortExpression="monthly_ot_hrs" ItemStyle-Wrap="false" />--%>
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

                                            <%--========================================================================================--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<h6 style="text-align: right; color: green">Present=18 | Absent=8  | WO=4</h6>--%>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <%--  <td>
                    <asp:LinkButton ID="btnDownload" class="form-control" runat="server" OnClick="btnDownload_Click">Download Format</asp:LinkButton>
                </td>--%>
            </tr>
            <tr>
                <td>
                    <footer class="py-3 bg-dark mt-auto navbar-fixed-bottom">
                        <div class="container-fluid">
                            <div class="text-center small">
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</div>

                            </div>
                        </div>
                    </footer>
                </td>
            </tr>
        </table>
        <%--<div class="alert alert-success animated fadeInUp">
            Logged out Successfully
        </div>--%>
        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js" defer></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
        <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>--%>

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
        <%--   <script type="text/jscript">
              $(window).on("load", function () {
                  $('#GvAttn').DataTable({ responsive: true });
              });
        </script>--%>
    </form>
</body>
</html>
