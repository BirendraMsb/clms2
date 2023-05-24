<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="license_certificate.aspx.cs" Inherits="clms2.vendor_onboarding.license_certificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport" />
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


        .boxDec {
            border: 1px solid #000;
        }

        td:nth-child(2) {
            width: 5rem;
        }
    </style>
</head>
<body>
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
                                            <li>
                                                <a class="dropdown-item" href="shift-master.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Update Leave Register
                                                </a>
                                            </li>
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
                                                    <i class="fa fa-angle-right me-1"></i>Allowences
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
        </table>
        <!--======================================================================================= -->
        <div class="container">
            <div class="text-center">
                <h6 class="mb-0">FORM XXIV</h6>
                <h6 class="my-0">[See rule 82 (1)]</h6>
                <h5 class="my-0">Return to be sent by the Contractor to the Licensing Officer</h5>
            </div>
            <div style="float: right">Half-year ending </div>
            <div class="row">
                <p><b>1. </b></p>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            Contractor Name</label>
                        <asp:TextBox ID="txtContractorName" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtContractorName" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            Contractor Address</label>
                        <asp:TextBox ID="txtContractorAdd" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtContractorAdd" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>2. </b></p>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            Name of establishment
                        </label>
                        <asp:TextBox ID="txtestbName" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtestbName" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            Address of establishment
                        </label>
                        <asp:TextBox ID="txtestbAddr" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtestbAddr" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>3. </b></p>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            Principal Employer Name</label>
                        <asp:TextBox ID="txtprincEmpName" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtprincEmpName" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            Principal Employer Address</label>
                        <asp:TextBox ID="txtprincEmpAdd" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtprincEmpAdd" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>4. Duration of contract :</b></p>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            From</label>
                        <asp:TextBox ID="txtDurationFrom" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtDurationFrom" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            TO
                        </label>
                        <asp:TextBox ID="txtDurationTo" runat="server" class="form-control m-b-0 m-t-0"
                            placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtDurationTo" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>5. Number of days during the half-year on which</b></p>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            (a) The establishment of the principal employer had worked 
                        </label>
                        <asp:TextBox ID="txtNumDaysEstWorked" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNumDaysEstWorked" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label>
                            (b) The contractor's establishment had worked
                        </label>
                        <asp:TextBox ID="txtNumDaysContrWorked" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNumDaysContrWorked" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>6. Maximum number of contract labour employed on any day during the half year</b></p>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Men</label>
                        <asp:TextBox ID="txtNoDaysMenEmployed" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDaysMenEmployed" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Women</label>
                        <asp:TextBox ID="txtNoDaysWomenEmployed" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDaysWomenEmployed" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Children</label>
                        <asp:TextBox ID="txtNoDaysChildEmployed" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDaysChildEmployed" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Total</label>
                        <asp:TextBox ID="txtNoDayTotal" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDayTotal" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <p><b>7.</b></p>
                <div class="col-md-4">
                    <div class="form-group mb-3">
                        <label>
                            (I) Daily hours of work and spread-over
                        </label>
                        <asp:TextBox ID="txtDailyWorkDay" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtDailyWorkDay" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group mb-3">
                        <label style="font-size: 14px">
                            (II) (a) Whether weekly holidays observed and on what day
                        </label>
                        <asp:TextBox ID="txtWeeklyHoliday" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtWeeklyHoliday" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            (b) If so, whether it was paid for
                        </label>
                        <asp:TextBox ID="txtHolydayType" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtHolydayType" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group mb-3">
                        <label>
                            (III) Number of man-hours of overtime worked
                        </label>
                        <asp:TextBox ID="txtNoManHrs" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoManHrs" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <p><b>8. Number of man days worked by:</b></p>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Men</label>
                        <asp:TextBox ID="txtNoDaysMenWorked" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDaysMenWorked" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Women</label>
                        <asp:TextBox ID="txtNoDaysWomenWorked" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDaysWomenWorked" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Children</label>
                        <asp:TextBox ID="txtNoDaysChildWorked" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoDaysChildWorked" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Total</label>
                        <asp:TextBox ID="txtNoWorkDayTotal" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtNoWorkDayTotal" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <p><b>9. Amount of wages paid:</b></p>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Men</label>
                        <asp:TextBox ID="txtWagesPaidMan" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtWagesPaidMan" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Women</label>
                        <asp:TextBox ID="txtWagesPaidWomen" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtWagesPaidWomen" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Children</label>
                        <asp:TextBox ID="txtWagesPaidChildren" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtWagesPaidChildren" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Total</label>
                        <asp:TextBox ID="txtWagesPaidTotal" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtWagesPaidTotal" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <p><b>10. Amount of deduction from wages, if any</b></p>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Men</label>
                        <asp:TextBox ID="txtAmtDedWagesMan" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtAmtDedWagesMan" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Women</label>
                        <asp:TextBox ID="txtAmtWagesDedWomen" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtAmtWagesDedWomen" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Children</label>
                        <asp:TextBox ID="txtAmtWagesDedChildren" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtAmtWagesDedChildren" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group mb-3">
                        <label>
                            Total</label>
                        <asp:TextBox ID="txtAmtWagesDedTotal" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtAmtWagesDedTotal" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>11. Whether the following have been provided </b></p>
                <div class="col-md-2">
                    <div class="form-group mb-3">
                        <label>
                            (I) Canteen
                        </label>
                        <asp:TextBox ID="txtCanteen" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtCanteen" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group mb-3">
                        <label>
                            (II) Rest-rooms
                        </label>
                        <asp:TextBox ID="txtRestRoom" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtRestRoom" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group mb-3">
                        <label>
                            (III) Drinking water
                        </label>
                        <asp:TextBox ID="txtDrinkingWater" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtDrinkingWater" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group mb-3">
                        <label>
                            (IV) Crèche
                        </label>
                        <asp:TextBox ID="txtCreche" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtCreche" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="form-group mb-3">
                        <label>
                            (v) First-aid 
                        </label>
                        <asp:TextBox ID="txtFirstAid" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" SetFocusOnError="true"
                            ControlToValidate="txtFirstAid" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <p><b>(if the answer is 'yes' state briefly standards provided)</b></p>

                <div class="col-md-6">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label>
                                    Place</label>
                                <asp:TextBox ID="txtPlace" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" SetFocusOnError="true"
                                    ControlToValidate="txtPlace" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label>
                                    Date</label>
                                <asp:TextBox ID="txtDate" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" SetFocusOnError="true"
                                    ControlToValidate="txtDate" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"></div>




            </div>
        </div>
        <!-- ===================================================================================== -->
        <div class="container-fluid mx-0 px-0">
            <div class="row">
                <div class="page-wrapper">
                    <div class="">
                        <div class="container-fluid">
                            <div class="card-body">
                                <div class="table-responsive" style="overflow: auto;">
                                    <%--========================================================================================--%>
                                    <%--  <p>gridview</p>--%>
                                    <%--========================================================================================--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid mx-0 px-0">
            <div class="row">
                <footer class="py-3 bg-dark mt-auto navbar-fixed-bottom">
                    <div class="container-fluid">
                        <div class="text-center small">
                            <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</div>

                        </div>
                    </div>
                </footer>
                </td>
            </div>
        </div>
        <%--<div class="alert alert-success animated fadeInUp">
            Logged out Successfully
        </div>--%>
        <script type="text/jscript" src="~/public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="~/public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="~/public/newfront/assets/js/app.js" defer></script>
        <script type="text/jscript" src="~/public/newfront/datatables/datatables.min.js"
            defer></script>
        <script type="text/jscript" src="~/public/newfront/js/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
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
