﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vendor_detail_entry.aspx.cs" Inherits="clms2.vendor_onboarding.vendor_detail_entry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>CLMS | Vendor | Dashboard</title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="~/public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css" />
    <link rel="apple-touch-icon" sizes="57x57" href="../public/common/icons/apple-icon-57x57.png" />
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
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div class="loading">
            <div class="loader"></div>
        </div>
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar fixed-top navbar-expand-lg transparent navbar-dark bg-dark">
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
                                                <a class="dropdown-item" href="wage-slip-new.aspx">
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
                                                <a class="dropdown-item" href="tot_workorder_comp.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Total Work Order compliance
                                                </a>
                                            </li>
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
                                                    <i class="fa fa-angle-right me-1"></i>Form XXIV
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
                                                    <i class="fa fa-angle-right me-1"></i>Full and Final Settlement
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
                                                <a class="dropdown-item" href="attendance-report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Attendance Details
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
                                <div class="row mb-2 border-bottom pb-2">
                                    <div class="col-sm-12">
                                        <div class="page-title-box">
                                            <div class="float-start">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-3 d-flex justify-content-between ">Update Details of Vendor</div>
                                    <div class="card-body">
                                        <asp:TextBox ID="txtID" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                        <asp:TextBox ID="txtID1" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:Label ID="lblMSG" runat="server" Text="" Font-Size="Large" ForeColor="blue" Font-Bold="True"></asp:Label><br />
                                                    <asp:Label ID="lblMSGError" runat="server" Text="" Font-Size="Large" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="btnDownloandPF_Click" CausesValidation="False">download UAN Declaration</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary" OnClick="btnDownloandEsic_Click" CausesValidation="False">download ESIC Declaration</asp:LinkButton><br />
                                                    <%--    <asp:UpdatePanel ID="UpdatePane4" runat="server">
                                                       <ContentTemplate>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>--%>
                                                    <label class="text-danger">NB:  UAN/ESI download are mandotory for company not having UAN registration/ESIC registration</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Work Order</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlWorkOrder" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlWorkOrder_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlWorkOrder" ErrorMessage="* Pls Select Work Order" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Vendor Code</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtVendorCode" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVendorCode" ErrorMessage="* Pls Enter Vendor Reg. No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>E-Mail</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtEMail" runat="server" class="form-control" ReadOnly="true" TextMode="SingleLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEMail" ErrorMessage="* Pls Enter Email" ForeColor="#CC3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtEMail" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Contact No.1</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtPhNo1" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhNo1" ErrorMessage="* Pls Enter contact No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Mob No." ControlToValidate="txtPhNo1" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\+?\d[\d -]{8,12}\d"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Contact No.2</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtPhNo2" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhNo2" ErrorMessage="* Pls Enter contact No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid Mob No." ControlToValidate="txtPhNo2" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\+?\d[\d -]{8,12}\d"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Address</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" ErrorMessage="* Pls Enter Address" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>City</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtCity" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="* Pls Enter City" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>State</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlState" runat="server" class="form-control"></asp:DropDownList>
                                                    <%-- <asp:TextBox ID="txtState" runat="server" class="form-control" MaxLength="50"></asp:TextBox>--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlState" ErrorMessage="* Pls Select State" InitialValue="Select" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>PIN</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtPIN" runat="server" class="form-control" MaxLength="6"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPIN" ErrorMessage="* Pls Enter PIN" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="regularExp" runat="server" ControlToValidate="txtPIN" ValidationExpression="[0-9]{6}" ErrorMessage="Invalid Zip Code." ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>


                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Labour License No.</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtLicenseNo" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtLicenseNo" ErrorMessage="* Pls Enter License No" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Valid From</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtValidFrom" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtValidFrom" ErrorMessage="* Pls Enter Date" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtValidFrom" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Valid To</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtValidTo" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtValidTo" ErrorMessage="* Pls Enter Date" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtValidTo" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <label>UN-Skilled</label><label class="text-danger">*</label>
                                                            <asp:TextBox ID="txtUnskilled" runat="server" Visible="true" class="form-control" AutoPostBack="true" OnTextChanged="txtUnskilled_TextChanged" MaxLength="4"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtUnskilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="txtUnskilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                        <ContentTemplate>
                                                            <label>Semi-Skilled</label><label class="text-danger">*</label>
                                                            <asp:TextBox ID="txtSemiSkilled" runat="server" Visible="true" class="form-control" AutoPostBack="true" MaxLength="4" OnTextChanged="txtSemiSkilled_TextChanged"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtSemiSkilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtSemiSkilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                        <ContentTemplate>
                                                            <label>Skilled</label><label class="text-danger">*</label>
                                                            <asp:TextBox ID="txtSkilled" runat="server" Visible="true" class="form-control" MaxLength="4" AutoPostBack="true" OnTextChanged="txtSkilled_TextChanged"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtSkilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtSkilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                        <ContentTemplate>
                                                            <label>High Skilled</label><label class="text-danger">*</label>
                                                            <asp:TextBox ID="txtHighSkilled" runat="server" Visible="true" class="form-control" MaxLength="4" AutoPostBack="true" OnTextChanged="txtHighSkilled_TextChanged"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtHighSkilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtHighSkilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                        <ContentTemplate>
                                                            <label>No. of Workers Authorised</label><label class="text-danger">*</label>
                                                            <asp:TextBox ID="txtWAuthorised" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtWAuthorised" ErrorMessage="* Pls Enter Authorised No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtWAuthorised" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>Vendor Photo</label><label class="text-danger">*</label><br />
                                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="document.getElementById('imgVendor').src=window.URL.createObjectURL(this.files[0])"></asp:FileUpload>
                                                    <label class="text-danger">Image size should not be more than 20 KB</label>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:Image ID="imgVendor" runat="server" BackColor="#99CCFF" Width="100" Height="110"></asp:Image>
                                                </div>
                                            </div>
                                        </div>
                                        <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <label>UAN No.</label><label class="text-danger">*</label>
                                                            <asp:RadioButton ID="pfRadio1" runat="server" Text="Y" GroupName="pf" AutoPostBack="true" OnCheckedChanged="pfRadio1_CheckedChanged" />
                                                            <asp:RadioButton ID="pfRadio2" runat="server" Text="N" AutoPostBack="true" GroupName="pf" OnCheckedChanged="pfRadio2_CheckedChanged" />
                                                            <br />
                                                            <asp:TextBox ID="txtPFNO" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:FileUpload ID="PFileUpload" runat="server"></asp:FileUpload><br />
                                                            <asp:Label ID="lblPFfileSizeMsg" ForeColor="Red" runat="server" Text="File size should not be more than 100 KB"></asp:Label>
                                                            <%--  <asp:HyperLink ID="HyperLinkPF" runat="server" Visible="False" style="color:red" NavigateUrl="https://www.epfindia.gov.in/site_en/Downloads.php">Download UAN declaration form here.....</asp:HyperLink>--%>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                        <ContentTemplate>
                                                            <label>ESIC No.</label><label class="text-danger">*</label>
                                                            <asp:RadioButton ID="ESICRadio1" runat="server" Text="Y" AutoPostBack="true" GroupName="ESIC" OnCheckedChanged="ESICRadio1_CheckedChanged" />
                                                            <asp:RadioButton ID="ESICRadio2" runat="server" Text="N" AutoPostBack="true" GroupName="ESIC" OnCheckedChanged="ESICRadio2_CheckedChanged" />
                                                            <br />
                                                            <asp:TextBox ID="txtESIC" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:FileUpload ID="ESICFileUpload" runat="server"></asp:FileUpload><br />
                                                            <asp:Label ID="lblEsicfileSizeMsg" ForeColor="Red" runat="server" Text="File size should not be more than 100 KB"></asp:Label>
                                                            <%--  <asp:HyperLink ID="HyperLinkESIC" runat="server" Visible="False" style="color:red" NavigateUrl="https://www.patelconsultancy.in/esic-forms-download.html">Download ESIC declaration form here.....</asp:HyperLink>--%>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>

                                        <%--           </ContentTemplate>
                                        </asp:UpdatePanel>--%>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>PAN No.</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtPANNo" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtPANNo" ErrorMessage="* Pls Enter UAN Number" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>GST No.</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtGSTNo" runat="server" class="form-control" MaxLength="15"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtGSTNo" ErrorMessage="* Pls Enter GST Number" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>PO Copy(PDF)</label><label class="text-danger">*</label><br />
                                                    <asp:FileUpload ID="POcopyUpload" runat="server"></asp:FileUpload>
                                                    <label class="text-danger">File size should not be more than 100 KB</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                        <ContentTemplate>
                                                            <label>Sub Vendor Applicability</label><label class="text-danger">*</label>
                                                            <asp:RadioButton ID="Applcability_yes" runat="server" Text="Y" GroupName="sv" AutoPostBack="true" OnCheckedChanged="Applcability_yes_CheckedChanged" />
                                                            <asp:RadioButton ID="Applcability_No" runat="server" Text="N" AutoPostBack="true" GroupName="sv" OnCheckedChanged="Applcability_No_CheckedChanged" />
                                                            <br />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenName" runat="server" Text="Sub Vendor Name"></asp:Label><asp:Label ID="lblSubVenName1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenName" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenName" runat="server" Enabled="false" ControlToValidate="txtSubVenName" ErrorMessage="* Pls Enter Name" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenAddress" runat="server" Text="Sub Vendor Address"></asp:Label><asp:Label ID="lblSubVenAddress1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenAddress" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenAddress" runat="server" Enabled="false" ControlToValidate="txtSubVenAddress" ErrorMessage="* Pls Enter Address" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenPFNo" runat="server" Text="Sub Vendor UAN No."></asp:Label><asp:Label ID="lblSubVenPFNo1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenPFNo" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenPFNo" runat="server" Enabled="false" ControlToValidate="txtSubVenPFNo" ErrorMessage="* Pls Enter UAN No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblUloadSubVen" runat="server" Text="Upload Sub Vendor UAN Certificate(PDF)"></asp:Label><asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label></br>
                                                            <asp:FileUpload ID="SubVenPFFileUpload" runat="server"></asp:FileUpload><br />
                                                            <asp:Label ID="lblUloadSubVenMsg" ForeColor="Red" runat="server" Text="File size should not be more than 100 KB"></asp:Label>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenEsicNo" runat="server" Text="Sub Vendor ESIC No."></asp:Label><asp:Label ID="lblSubVenEsicNo1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenEsicNo" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenEsicNo" runat="server" Enabled="false" ControlToValidate="txtSubVenEsicNo" ErrorMessage="* Pls Enter ESIC No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSebVenEsicCert" runat="server" Text="Upload Sub Vendor ESIC Certificate(PDF)"></asp:Label><asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label></br>
                                                            <asp:FileUpload ID="SubVenESICFileUpload" runat="server"></asp:FileUpload><br />
                                                            <asp:Label ID="lblSebVenEsicCertMsg" ForeColor="Red" runat="server" Text="File size should not be more than 100 KB"></asp:Label>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenPanNo" runat="server" Text="Sub Vendor PAN No."></asp:Label><asp:Label ID="lblSubVenPanNo1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenPanNo" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenPanNo" runat="server" Enabled="false" ControlToValidate="txtSubVenPanNo" ErrorMessage="* Pls Enter PAN No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenGstNo" runat="server" Text="Sub Vendor GST No."></asp:Label><asp:Label ID="lblSubVenGstNo1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenGstNo" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenGstNo" runat="server" Enabled="false" ControlToValidate="txtSubVenGstNo" ErrorMessage="* Pls Enter GST No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenEmail" runat="server" Text="Sub Vendor Email"></asp:Label><asp:Label ID="lblSubVenEmail1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenEmail" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenEmail" runat="server" Enabled="false" ControlToValidate="txtSubVenEmail" ErrorMessage="* Pls Enter Email" ForeColor="#CC3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtSubVenEmail" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenLabLicNo" runat="server" Text="Sub Vendor Labour License No."></asp:Label><asp:Label ID="lblSubVenLabLicNo1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:TextBox ID="txtSubVenLabLicNo" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqSubVenLabLicNo" runat="server" ControlToValidate="txtSubVenLabLicNo" ErrorMessage="* Pls Enter Labour License No" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Label ID="lblSubVenPhoto" runat="server" Text="Sub Vendor Photo"></asp:Label><asp:Label ID="lblSubVenPhoto1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                            <asp:FileUpload ID="UploadSubVenPhoto" runat="server" onchange="document.getElementById('imgSubVendor').src=window.URL.createObjectURL(this.files[0])"></asp:FileUpload>
                                                            <label id="lblSubVenPhotoMsb" class="text-danger">Image size should not be more than 20 KB</label>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-2">
                                                    <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Image ID="imgSubVendor" runat="server" BackColor="#99CCFF" Width="100" Height="110"></asp:Image>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>

                                        <hr class="my-5" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:Button ID="cmdSave" runat="server" Text="Save" Width="100px" class="btn btn-info" OnClick="cmdSave_Click"></asp:Button>
                                                    <asp:Button ID="cmdCancel" runat="server" Text="Cancel" class="btn btn-danger"></asp:Button>
                                                </div>
                                            </div>
                                        </div>


                                        <%--    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                  
                                            </div>
                                        </div>
                                    </div>--%>
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
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved </div>
                            </div>
                        </div>
                    </footer>
                </td>
            </tr>
        </table>

        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js" defer></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
        <%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>--%>

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

        <link rel="stylesheet" href="../dtm/css/pikaday.css" />
        <script src="../dtm/date_fns.min.js" type="text/jscript"></script>
        <script src="../dtm/pikaday.js" type="text/jscript"></script>
        <script type="text/jscript">
            new Pikaday(
            {
                field: document.getElementById('txtValidFrom'),
                toString: function (date, format) {
                    return dateFns.format(date, format);
                },
                parse: function (dateString, format) {
                    return dateFns.parse(dateString);
                },
                onSelect: function (selectedDate) {
                    // not necessary, just showing off
                    if (dateFns.isValid(selectedDate)) {
                        var p = document.createElement('p');
                        p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                        document.getElementById('selected').appendChild(p);
                    }
                }
            });
            //    ========================================================
            new Pikaday(
            {
                field: document.getElementById('txtValidTo'),
                toString: function (date, format) {
                    return dateFns.format(date, format);
                },
                parse: function (dateString, format) {
                    return dateFns.parse(dateString);
                },
                onSelect: function (selectedDate) {
                    // not necessary, just showing off
                    if (dateFns.isValid(selectedDate)) {
                        var p = document.createElement('p');
                        p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                        document.getElementById('selected').appendChild(p);
                    }
                }
            });
        </script>
        <script type="text/jscript">
            $(window).on("load", function () {
                $('#GvWod').DataTable({ responsive: true });
            });
        </script>
    </form>
</body>
</html>
