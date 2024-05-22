<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emp_onboarding.aspx.cs" Inherits="clms2.vendor_onboarding.emp_onboarding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <title>CLMS | Emp | Dashboard</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="../public/common/css/bootswatchTheme.css" rel="stylesheet" />
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <%--   <div class="loading">
            <div class="loader"></div>
        </div>--%>
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
                                                <%-- <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#"><font color="red">Download UAN Declaration form here...</font></a></li>
                                        <li class="breadcrumb-item active"><a href="#"><font color="red">Download ESIC declaration form here...</font></a></li>
                                    </ol>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">Employee Detail Entry</div>
                                    <div class="card-body">
                                        <%--========================================================================================--%>
                                        <asp:Label ID="lblMSG" ForeColor="Green" Font-Size="Large" runat="server" Text=""></asp:Label><br />
                                        <asp:Label ID="lblMSGError" ForeColor="Red" Font-Size="Large" runat="server" Text=""></asp:Label><br />
                                        <asp:Label ID="lblPoliceExpiry" ForeColor="Green" Font-Size="Large" runat="server" Text=""></asp:Label><br />
                                        <asp:Label ID="lblMedicalExpiry" ForeColor="Green" Font-Size="Large" runat="server" Text=""></asp:Label>
                                        <asp:TextBox ID="txtID" runat="server" class="form-control" Visible="false"></asp:TextBox>
                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:LinkButton ID="pfLinkButton1" runat="server" CssClass="btn btn-primary" CausesValidation="False" OnClick="pfLinkButton1_Click">download UAN Declaration</asp:LinkButton>
                                                    <asp:LinkButton ID="esicLinkButton2" runat="server" CssClass="btn btn-primary" CausesValidation="False" OnClick="esicLinkButton2_Click">download ESIC Declaration</asp:LinkButton><br />
                                                    <label class="text-danger">NB:  UAN/ESI download are mandotory for company not having UAN registration/ESIC registration</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtWorkOrderNo">Work Order No.</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="txtWorkOrderNo" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="txtWorkOrderNo_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWorkOrderNo" ErrorMessage="* Pls Select Work Order" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtVendorCode">Vendor code</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtVendorCode" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVendorCode" ErrorMessage="* Pls Enter Vendor Reg. No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>Emp Code</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtEmpCode" runat="server" class="form-control" placeholder="Emp Code"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmpCode" ErrorMessage="* Pls Enter Emp code" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtEmpName">Emp Name</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtEmpName" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmpName" ErrorMessage="* Pls Enter Emp Name" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">
                                              <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtEmpName">Father/Husband Name</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtFatherHusband" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtFatherHusband" ErrorMessage="* Pls Enter Father/Husband Name" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtDepart">Department</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtDepart" runat="server" class="form-control" ReadOnly="true" MaxLength="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDepart" ErrorMessage="* Pls Enter Department" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>Shift</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="txtShift" runat="server" class="form-control" placeholder="shift">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtShift" ErrorMessage="* Pls Select Shift" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtAadharNo">Aadhar No.</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtAadharNo" runat="server" class="form-control" MaxLength="12"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtAadharNo" ErrorMessage="* Pls Enter Aadhar No" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtAddress">Permanent Address</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" ErrorMessage="* Pls Enter Address" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>City</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtCity" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="* Pls Enter City" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>State</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlState" runat="server" class="form-control" placeholder="State"></asp:DropDownList>
                                                    <%-- <asp:TextBox ID="txtState" runat="server" class="form-control" placeholder="State"></asp:TextBox>--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlState" ErrorMessage="* Pls Select State" InitialValue="Select" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtLocalAddress">Local Address</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtLocalAddress" runat="server" class="form-control" MaxLength="100"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtLocalAddress" ErrorMessage="* Pls Enter Address" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtEMail">E-Mail</label>
                                                    <asp:TextBox ID="txtEMail" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEMail" ErrorMessage="* Pls Enter Email" ForeColor="#CC3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtEMail" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-2">
                                                    <label for="txtPhNo1">Contact No.1</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtPhNo1" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPhNo1" ErrorMessage="* Pls Enter contact No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Mob No." ControlToValidate="txtPhNo1" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\+?\d[\d -]{8,12}\d"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-2">
                                                    <label for="txtPhNo2">Contact No.2</label>
                                                    <asp:TextBox ID="txtPhNo2" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPhNo2" ErrorMessage="* Pls Enter contact No." ForeColor="#CC3300"></asp:RequiredFieldValidator>--%>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid Mob No." ControlToValidate="txtPhNo2" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\+?\d[\d -]{8,12}\d"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-2">
                                                    <label for="txtNationality">Nationality</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtNationality" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtNationality" ErrorMessage="* Pls Enter Nationality" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="ddlGender">Gender</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                                        <asp:ListItem Value="Select">Select</asp:ListItem>
                                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                                        <asp:ListItem Value="Trans">Trans</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlGender" ErrorMessage="* Pls Select Gender" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="ddlCast">Caste</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlCast" runat="server" class="form-control">
                                                        <%-- <asp:ListItem Value="Select">Select</asp:ListItem>
                                                        <asp:ListItem Value="SC">SC</asp:ListItem>
                                                        <asp:ListItem Value="ST">ST</asp:ListItem>
                                                        <asp:ListItem Value="OBC">OBC</asp:ListItem>
                                                        <asp:ListItem Value="GEN">GEN</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlCast" ErrorMessage="* Pls Select Cast" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="ddlBloodGrp">Blood Grp</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlBloodGrp" runat="server" class="form-control">
                                                        <%--<asp:ListItem Value="Select">Select</asp:ListItem>
                                                        <asp:ListItem Value="A+">A+</asp:ListItem>
                                                        <asp:ListItem Value="A-">A-</asp:ListItem>
                                                        <asp:ListItem Value="O+">O+</asp:ListItem>
                                                        <asp:ListItem Value="O-">O-</asp:ListItem>
                                                        <asp:ListItem Value="B+">B+</asp:ListItem>
                                                        <asp:ListItem Value="B-">B-</asp:ListItem>
                                                        <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                        <asp:ListItem Value="AB-">AB-</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlBloodGrp" ErrorMessage="* Pls Select Blood Group" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                        <ContentTemplate>
                                                            <label for="aa">Any Critical Disease</label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Y" AutoPostBack="true" GroupName="ACD" OnCheckedChanged="RadioButton1_CheckedChanged" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="N" AutoPostBack="true" GroupName="ACD" Checked="true" OnCheckedChanged="RadioButton2_CheckedChanged" />
                                                            <br />
                                                            <asp:TextBox ID="txtDiseaseName" runat="server" placeholder="Disease Name" class="form-control" ReadOnly="True"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <%-- <div class="col-md-4">
                                                    <div class="form-group mb-3">
                                                            <label for="CDRadioButtonList1" >Any Critical Disease</label>
                                                          <asp:RadioButtonList ID="CDRadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" >
                                                                    <asp:ListItem Value="Y">Y</asp:ListItem>
                                                                    <asp:ListItem Value="N">N</asp:ListItem>
                                                            </asp:RadioButtonList> <asp:TextBox ID="txtDiseaseName" runat="server" placeholder="Disease Name" class="form-control" ReadOnly="True"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="CDRadioButtonList1" ErrorMessage="* Select Radio Button" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                         
                                                   </div>
                                               </div>--%>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtDOB">DOB</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtDOB" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:Label ID="lblDobError" runat="server" Text=""></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtDOB" ErrorMessage="* Pls Enter Date" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtDOB" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                        <ContentTemplate>
                                                            <label for="ddlEducation">Education</label><label class="text-danger">*</label>
                                                            <asp:DropDownList ID="ddlEducation" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEducation_SelectedIndexChanged">
                                                                <%--<asp:ListItem Value="Select">Select</asp:ListItem>--%>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlEducation" ErrorMessage="* Pls Select Education" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                        <ContentTemplate>
                                                            <label for="ddlTrade">Trade</label><label class="text-danger">*</label>
                                                            <asp:DropDownList ID="ddlTrade" runat="server" class="form-control">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlTrade" ErrorMessage="* Pls Select Trade" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="ddlDesignation">Designation</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlDesignation" runat="server" class="form-control">
                                                        <%--<asp:ListItem Value="Select">Select</asp:ListItem>
                                                        <asp:ListItem Value="Helper">Helper</asp:ListItem>
                                                        <asp:ListItem Value="Operator">Operator</asp:ListItem>
                                                        <asp:ListItem Value="Supervisor">Supervisor</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlDesignation" ErrorMessage="* Pls Select Designation" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label>Experience</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtExp" runat="server" class="form-control" placehol="Experience"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtExp" ErrorMessage="* Pls Enter Experience " ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="txtExp" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <label for="ddlSkill">Skill Category</label><label class="text-danger">*</label>
                                                            <asp:DropDownList ID="ddlSkill" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSkill_SelectedIndexChanged">
                                                                <%--   <asp:ListItem Value="Select">Select</asp:ListItem>
                                                                    <asp:ListItem Value="SU">Un-Skilled</asp:ListItem>
                                                                    <asp:ListItem Value="SS">Semi Skilled</asp:ListItem>
                                                                    <asp:ListItem Value="S">Skilled</asp:ListItem>
                                                                    <asp:ListItem Value="HS">High Skilled</asp:ListItem>--%>
                                                            </asp:DropDownList>
                                                            <%--  <asp:TextBox ID="txtBasic" runat="server" class="form-control" ReadOnly="false" placeholder="Basic"></asp:TextBox>--%>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlSkill" ErrorMessage="* Pls Select Skill" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                        <ContentTemplate>
                                                            <label>Basic</label><label class="text-danger">*</label>
                                                            <asp:TextBox ID="txtBasic" runat="server" class="form-control" ReadOnly="false" placeholder="Basic"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtBasic" ErrorMessage="* Pls Enter Basic " ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">

                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtBankName">Bank Name</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlBankName" runat="server" class="form-control"></asp:DropDownList>
                                                    <%--<asp:TextBox ID="txtBankName" runat="server" class="form-control"></asp:TextBox>--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="ddlBankName" ErrorMessage="* Pls Select Bank Name" InitialValue="Select" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtAccountNo">Account No.</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtAccountNo" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtAccountNo" ErrorMessage="* Pls Enter Account Number" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <label for="txtIFSC">IFS Code</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtIFSC" runat="server" class="form-control" MaxLength="12"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtIFSC" ErrorMessage="* Pls Enter IFSC Number" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                        </div>

                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label for="txtContactPerson">Contact person name in case of emergency</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Contact person name in case of emergency" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtContactPerson" ErrorMessage="* Pls Enter Contract Person" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Contact No.</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder="Contact No." MaxLength="10"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtContactNo" ErrorMessage="* Pls Enter Contract Number" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Domicile State</label><label class="text-danger">*</label>
                                                    <asp:DropDownList ID="ddlDomState" runat="server" class="form-control"></asp:DropDownList>
                                                    <%-- <asp:TextBox ID="txtDomDate" runat="server" class="form-control" MaxLength="10"></asp:TextBox>--%>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="ddlDomState" ErrorMessage="* Pls Select Domicile state" InitialValue="Select" ForeColor="#CC3300"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label for="DomFileUpload" class="col-md-3 control-label">Domicile Certificate(PDF)</label>
                                                    <asp:FileUpload ID="DomFileUpload" runat="server"></asp:FileUpload>
                                                    <label class="text-danger">PDF File size should not be more than 100 KB</label>
                                                    <%--  <asp:Label  ForeColor="Red" runat="server" Text="File size should not be more than 100 KB"></asp:Label>--%>

                                                    <%-- <label>Domicile Description</label>--%>
                                                    <%-- <asp:TextBox ID="txtDomDesc" runat="server" class="form-control" placeholder="Descriotion" TextMode="MultiLine"></asp:TextBox>--%>
                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtDomDesc" ErrorMessage="* Pls Enter Domicile Desc " ForeColor="#CC0000"></asp:RequiredFieldValidator>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <%--<label for="PFNO">UAN No.</label><label class="text-danger">*</label>--%>
                                                            <label for="PFRadioButtonList1">UAN No.</label><label class="text-danger">*</label>
                                                            <asp:RadioButtonList ID="PFRadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="PFRadioButtonList1_SelectedIndexChanged">
                                                                <asp:ListItem Value="Y">Y</asp:ListItem>
                                                                <asp:ListItem Value="N">N</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="PFRadioButtonList1" ErrorMessage="* Select Radio Button" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:TextBox ID="txtPFNO" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:FileUpload ID="PFileUpload" runat="server"></asp:FileUpload><br />
                                                            <asp:Label ID="lblPFfileSizeMsg" ForeColor="Red" runat="server" Text="PDF File size should not be more than 100 KB"></asp:Label>


                                                            <%--   <asp:HyperLink ID="HyperLinkPF" runat="server" Visible="False" Style="color: red" NavigateUrl="https://www.epfindia.gov.in/site_en/Downloads.php">Download UAN declaration form here.....</asp:HyperLink>--%>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                        <ContentTemplate>
                                                            <label for="ESIC">ESIC</label><label class="text-danger">*</label>
                                                            <asp:RadioButtonList ID="ESICRadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ESICRadioButtonList1_SelectedIndexChanged">
                                                                <asp:ListItem Value="Y">Y</asp:ListItem>
                                                                <asp:ListItem Value="N">N</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="ESICRadioButtonList1" ErrorMessage="* Select Radio Button" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:TextBox ID="txtESIC" runat="server" class="form-control"></asp:TextBox>
                                                            <asp:FileUpload ID="ESICFileUpload" runat="server"></asp:FileUpload><br />
                                                            <asp:Label ID="lblEsicfileSizeMsg" ForeColor="Red" runat="server" Text="PDF File size should not be more than 100 KB"></asp:Label>
                                                            <%--  <asp:Label ID="lblEsicUploadSizeMsg" >File size should not be more than 100 KB</asp:Label>--%>

                                                            <%--  <asp:HyperLink ID="HyperLinkESIC" runat="server" Visible="False" Style="color: red" NavigateUrl="https://www.patelconsultancy.in/esic-forms-download.html">Download ESIC declaration form here.....</asp:HyperLink>--%>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>

                                        </div>
                                        <%--========================================================================================--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label for="PVFileUpload" class="col-md-3 control-label">Police Verification(PDF)</label><label class="text-danger">*</label>
                                                    <asp:FileUpload ID="PVFileUpload" runat="server"></asp:FileUpload>
                                                    <label class="text-danger">PDF File size should not be more than 100 KB</label>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <%--<label for="txtPVD">Police Verification Date</label>--%>
                                                    <label>Police Verification Expiry Date</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtPVD" runat="server" class="form-control" TextMode="DateTime"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtPVD" ErrorMessage="* Pls Enter Date" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtPVD" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label for="MVFileUpload" class="col-md-3 control-label">Medical Examination(PDF)</label><label class="text-danger">*</label>
                                                    <asp:FileUpload ID="MVFileUpload" runat="server"></asp:FileUpload>
                                                    <label class="text-danger">PDF File size should not be more than 100 KB</label>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group mb-3">

                                                    <label for="txtMCID">Medical Certificate Expiry Date</label><label class="text-danger">*</label>
                                                    <asp:TextBox ID="txtMCID" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtMCID" ErrorMessage="* Pls Enter Date" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtMCID" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label for="AgeCertFileUpload" class="col-md-3 control-label">Age Certificate(PDF)</label>
                                                    <asp:FileUpload ID="AgeCertFileUpload" runat="server"></asp:FileUpload>
                                                    <label class="text-danger">PDF File size should not be more than 100 KB</label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label for="EduCertUpload" class="col-md-3 control-label">Education Certificate(PDF)</label>
                                                    <asp:FileUpload ID="EduCertUpload" runat="server"></asp:FileUpload>
                                                    <label class="text-danger">PDF File size should not be more than 100 KB</label>
                                                </div>
                                            </div>

                                        </div>

                                        <%--========================================================================================--%>
                                        <%--     <div class="row">
            
                                        </div>--%>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group mb-3">
                                                    <label for="FileUpload1" class="col-md-3 control-label">Employee Photo</label><label class="text-danger">*</label>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="document.getElementById('imgEmp').src=window.URL.createObjectURL(this.files[0])"></asp:FileUpload>
                                                    <label class="text-danger">Image size should not be more than 20 KB</label>
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group mb-3">
                                                    <asp:Image ID="imgEmp" runat="server" BackColor="#99CCFF" Width="100" Height="110"></asp:Image>
                                                </div>
                                            </div>

                                        </div>
                                        <%--========================================================================================--%>
                                        <hr class="my-5" />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:Button ID="cmdSave" runat="server" Text="Save" Width="100px" class="btn btn-info" OnClick="cmdSave_Click"></asp:Button>
                                                    <asp:Button ID="cmdCancel" runat="server" Text="Cancel/Clear" class="btn btn-danger" OnClick="cmdCancel_Click"></asp:Button>
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
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved                     </div>
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
        <link rel="stylesheet" href="../dtm/css/pikaday.css" />
        <script src="../dtm/date_fns.min.js" type="text/jscript"></script>
        <script src="../dtm/pikaday.js" type="text/jscript"></script>
        <script type="text/jscript">
            new Pikaday(
            {
                field: document.getElementById('txtDOB'),
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
                        var p = document.createElement('p1');
                        p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                        document.getElementById('selected').appendChild(p);
                    }
                }
            });
            new Pikaday(
            {
                field: document.getElementById('txtPVD'),
                toString: function (date, format) {
                    return dateFns.format(date, format);
                },
                parse: function (dateString, format) {
                    return dateFns.parse(dateString);
                },
                onSelect: function (selectedDate) {
                    // not necessary, just showing off
                    if (dateFns.isValid(selectedDate)) {
                        var p = document.createElement('p2');
                        p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                        document.getElementById('selected').appendChild(p);
                    }
                }
            });

            new Pikaday(
            {
                field: document.getElementById('txtMCID'),
                toString: function (date, format) {
                    return dateFns.format(date, format);
                },
                parse: function (dateString, format) {
                    return dateFns.parse(dateString);
                },
                onSelect: function (selectedDate) {
                    // not necessary, just showing off
                    if (dateFns.isValid(selectedDate)) {
                        var p = document.createElement('p3');
                        p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                        document.getElementById('selected').appendChild(p);
                    }
                }
            });

            new Pikaday(
           {
               field: document.getElementById('txtDomDate'),
               toString: function (date, format) {
                   return dateFns.format(date, format);
               },
               parse: function (dateString, format) {
                   return dateFns.parse(dateString);
               },
               onSelect: function (selectedDate) {
                   // not necessary, just showing off
                   if (dateFns.isValid(selectedDate)) {
                       var p = document.createElement('p4');
                       p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                       document.getElementById('selected').appendChild(p);
                   }
               }
           });
        </script>
        <%--<script type="text/jscript">
              $(window).on("load", function () {
                  $('#GvWod').DataTable({ responsive: true });
              });
        </script>--%>
    </form>
</body>
</html>
