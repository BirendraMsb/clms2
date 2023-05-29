<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="work-order-entry.aspx.cs" Inherits="clms2.contractor_cell.work_order_entry1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <%-- <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />--%>
    <link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
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
        <div class="loading">
            <div class="loader"></div>
        </div>
        <%--==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==--%>
        <%--==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==--%>
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
                                                <a class="dropdown-item" href="emp_chart_report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Chart
                                                </a>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="emp_bar_chart.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Bar Chart
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="vendor_chart.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Vendor Chart
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="vendor_bar_chart.aspx">
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
                                                <a class="dropdown-item" href="mail_sending_form.aspx">
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
                            </div>
                            <br />
                            <div class="card shadow border">
                                <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">Vendors Work Order Entry</div>
                                <div class="card-body">
                                    <asp:TextBox ID="txtID" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                    <asp:TextBox ID="txtID1" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <asp:Label ID="lblMsgError" runat="server" Text="" Font-Size="Larger" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                                <asp:Label ID="lblMsg" runat="server" Text="" Font-Size="Larger" ForeColor="blue" Font-Bold="True"></asp:Label><br />
                                                <asp:Label ID="lblMsgMail" runat="server" Text="" Font-Size="Larger" ForeColor="blue" Font-Bold="True"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Work Order No.</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtWONo" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtWONo" ErrorMessage="* Pls Enter Work Order No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Vendor Code</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtVendorRegNo" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVendorRegNo" ErrorMessage="* Pls Enter Vendor Reg. No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Act Covered</label><label class="text-danger">*</label>
                                                <asp:DropDownList ID="ddlActCovered" runat="server" class="form-control">
                                                    <asp:ListItem Value="1">Shops And Establishment</asp:ListItem>
                                                    <asp:ListItem Value="2">Factory</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlActCovered" ErrorMessage="* Pls Select the Act" InitialValue="Select" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Valid From</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtValidFrom" runat="server" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtValidFrom" ErrorMessage="* Pls Enter Date" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtValidFrom" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Valid To</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtValidTo" runat="server" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtValidTo" ErrorMessage="* Pls Enter Date" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Pls Enter Valid Date" ControlToValidate="txtValidTo" ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Nature Of Work</label><label class="text-danger">*</label>
                                                <asp:DropDownList ID="txtNatureofWork" class="form-control" runat="server"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtNatureofWork" ErrorMessage="* Pls Select Nauture of work" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Work Description</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtDescription" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescription" ErrorMessage="* Pls Enter Work Description" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Type Of Contract</label><label class="text-danger">*</label>
                                                <asp:DropDownList ID="txtTypeofContract" class="form-control" runat="server"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtTypeofContract" ErrorMessage="* Pls Select type of contract" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>UN-Skilled</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtUnskilled" runat="server" Visible="true" class="form-control" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtUnskilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtUnskilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Semi-Skilled</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtSemiSkilled" runat="server" Visible="true" class="form-control" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtSemiSkilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="txtSemiSkilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Skilled</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtSkilled" runat="server" Visible="true" class="form-control" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtSkilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtSkilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                       <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>High Skilled</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtHighSkilled" runat="server" Visible="true" class="form-control" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtHighSkilled" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtHighSkilled" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Total Employee</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtNoEmp" runat="server" Visible="true" class="form-control" MaxLength="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNoEmp" ErrorMessage="* Pls Enter No of Employee" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtNoEmp" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                              
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Department</label><label class="text-danger">*</label>
                                                <asp:DropDownList ID="txtDepartment" class="form-control" runat="server"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtDepartment" ErrorMessage="* Pls Select Department" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Job Location</label><label class="text-danger">*</label>
                                                <asp:DropDownList ID="txtJobLocation" class="form-control" runat="server"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtJobLocation" ErrorMessage="* Pls Select Job Location" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Vendor Name</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtVendorName" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtVendorName" ErrorMessage="* Pls Enter Vendeor Name" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Owner Name</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtOwnerName" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtOwnerName" ErrorMessage="* Pls Enter Owner Name" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>E-Mail</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEMail" ErrorMessage="* Pls Enter Email" ForeColor="#CC3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Mail" ControlToValidate="txtEMail" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Contact No.</label><label class="text-danger">*</label>
                                                <asp:TextBox ID="txtPhNo" runat="server" class="form-control" MaxLength="13"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPhNo" ErrorMessage="* Pls Enter contact No." ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Mob No." ControlToValidate="txtPhNo" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\+?\d[\d -]{8,12}\d"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <asp:Button ID="cmdSave" runat="server" Text="Save" Width="100px" class="btn btn-info" OnClick="cmdSave_Click"></asp:Button>
                                                <asp:Button ID="BtnMail" runat="server" Text="Mail" Width="100px" class="btn btn-info" OnClick="BtnMail_Click"></asp:Button>
                                                <asp:Button ID="cmdCancel" runat="server" Text="Cancel/Clear" class="btn btn-info" OnClick="cmdCancel_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="my-5" />
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
                                <div class="text-light ">
                                    &copy; 2022 | GreenHRM Solutions | All Rights Reserved                               <%--<div class="text-light d-none d-sm-inline-block float-end">
				                     <a href="https://shitij.in">Kshitij Info Solutions</a>
			                    </div>--%>
                                </div>
                            </div>
                    </footer>
                </td>
            </tr>
        </table>
        <%--==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==--%>
        <%--	<div class="alert alert-success animated fadeInUp">
		Logged out Successfully	</div>--%>
        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js"></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js"></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js"></script>
        <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
        <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>--%>
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
</body>
</html>
