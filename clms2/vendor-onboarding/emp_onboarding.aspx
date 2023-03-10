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
     <%--  <link rel="stylesheet" href="~/public/common/css/commoncss.min.css" />--%>
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee Onboarding <span class="fa fa-angle-down ms-1"></span>
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Payroll <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="AllowancesMaster.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Allowences
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
                                                <a class="dropdown-item" href="#">
                                                    <i class="fa fa-angle-right me-1"></i>Payroll Process
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <i class="fa fa-angle-right me-1"></i>Pay Slip
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <i class="fa fa-angle-right me-1"></i>Form 16
                                                </a>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <i class="fa fa-angle-right me-1"></i>Form 17
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Report <span class="fa fa-angle-down ms-1"></span>
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

                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="fa fa-angle-down ms-1"></span>
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
                                        <li class="breadcrumb-item"><a href="#"><font color="red">Download PF Declaration form here...</font></a></li>
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
                                    <asp:Label ID="lblMSG" ForeColor="Green" Font-Size="X-Large" runat="server" Text=""></asp:Label><br />
                                    <asp:Label ID="lblPoliceExpiry" ForeColor="Green" Font-Size="X-Large" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="txtID" runat="server" class="form-control" Visible="false"></asp:TextBox>
                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtWorkOrderNo">Work Order No.</label>
                                                <asp:DropDownList ID="txtWorkOrderNo" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="txtWorkOrderNo_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtEmpName">Emp Name</label>
                                                <asp:TextBox ID="txtEmpName" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label for="txtAddress">Vendor code</label>
                                                <asp:TextBox ID="txtVendorCode" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Emp Code</label>
                                                <asp:TextBox ID="txtEmpCode" runat="server" class="form-control" placeholder="Emp Code"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtAddress">Address</label>

                                                <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="100"></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>


                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtEMail">E-Mail</label>

                                                <asp:TextBox ID="txtEMail" runat="server" class="form-control" MaxLength="50"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-2">
                                                <label for="txtPhNo1">Contact No.1</label>

                                                <asp:TextBox ID="txtPhNo1" runat="server" class="form-control" MaxLength="10"></asp:TextBox>

                                            </div>
                                        </div>

                                    </div>
                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-2">
                                                <label for="txtPhNo2">Contact No.2</label>

                                                <asp:TextBox ID="txtPhNo2" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtDOB">DOB</label>

                                                <asp:TextBox ID="txtDOB" runat="server" class="form-control"></asp:TextBox>
                                                <asp:Label ID="lblDobError" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <%--========================================================================================--%>



                                    <div class="row">

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">


                                                <label for="ddlGender">Gender</label>

                                                <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                    <asp:ListItem Value="Trans">Trans</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="ddlCast">Cast</label>

                                                <asp:DropDownList ID="ddlCast" runat="server" class="form-control">
                                                    <asp:ListItem Value="SC">SC</asp:ListItem>
                                                    <asp:ListItem Value="ST">ST</asp:ListItem>
                                                    <asp:ListItem Value="OBC">OBC</asp:ListItem>
                                                    <asp:ListItem Value="GEN">GEN</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                    </div>
                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="ddlBloodGrp">Blood Grp</label>

                                                <asp:DropDownList ID="ddlBloodGrp" runat="server" class="form-control">
                                                    <asp:ListItem Value="A+">A+</asp:ListItem>
                                                    <asp:ListItem Value="A-">A-</asp:ListItem>
                                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                                    <asp:ListItem Value="O-">O-</asp:ListItem>
                                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                                    <asp:ListItem Value="B-">B-</asp:ListItem>
                                                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>


                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="aa">Any Critical Disease</label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        <asp:RadioButton ID="RadioButton1" runat="server" Text="Y" AutoPostBack="true" GroupName="ACD" OnCheckedChanged="RadioButton1_CheckedChanged" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="N" AutoPostBack="true" GroupName="ACD" OnCheckedChanged="RadioButton2_CheckedChanged" />
                                                <br />
                                                <asp:TextBox ID="txtDiseaseName" runat="server" placeholder="Disease Name" class="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-2">
                                                <label for="txtNationality">Nationality</label>

                                                <asp:TextBox ID="txtNationality" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group mb-3">

                                                <label for="txtAadharNo">Aadhar No.</label>

                                                <asp:TextBox ID="txtAadharNo" runat="server" class="form-control" MaxLength="12"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label for="ddlDesignation">Designation</label>

                                                <asp:DropDownList ID="ddlDesignation" runat="server" class="form-control">
                                                    <asp:ListItem Value="Helper">Helper</asp:ListItem>
                                                    <asp:ListItem Value="Operator">Operator</asp:ListItem>
                                                    <asp:ListItem Value="Supervisor">Supervisor</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                    </div>
                                    <%--========================================================================================--%>
                                    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="row">

                                                <div class="col-md-4">
                                                    <div class="form-group mb-3">
                                                        <label for="PFNO">PF No.</label>

                                                        <asp:RadioButton ID="pfRadio1" runat="server" Text="Y" AutoPostBack="true" GroupName="pf" OnCheckedChanged="pfRadio1_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                        <asp:RadioButton ID="pfRadio2" runat="server" Text="N" AutoPostBack="true" GroupName="pf" OnCheckedChanged="pfRadio2_CheckedChanged" />
                                                        <br />
                                                        <asp:TextBox ID="txtPFNO" runat="server" class="form-control"></asp:TextBox>
                                                        <asp:FileUpload ID="PFileUpload" runat="server"></asp:FileUpload><br />
                                                        <%--<a href="#">Download declaration form here.....</a>--%>
                                                        <asp:HyperLink ID="HyperLinkPF" runat="server" Visible="False" Style="color: red" NavigateUrl="https://www.epfindia.gov.in/site_en/Downloads.php">Download PF declaration form here.....</asp:HyperLink>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group mb-3">
                                                        <label for="ESIC">ESIC</label>

                                                        <asp:RadioButton ID="ESICRadio1" runat="server" Text="Y" AutoPostBack="true" GroupName="ESIC" OnCheckedChanged="ESICRadio1_CheckedChanged" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        <asp:RadioButton ID="ESICRadio2" runat="server" Text="N" AutoPostBack="true" GroupName="ESIC" OnCheckedChanged="ESICRadio2_CheckedChanged" />
                                                        <br />
                                                        <asp:TextBox ID="txtESIC" runat="server" class="form-control"></asp:TextBox>
                                                        <asp:FileUpload ID="ESICFileUpload" runat="server"></asp:FileUpload><br />
                                                        <%--<a href="#">Download declaration form here.....</a>--%>
                                                        <%-- <asp:Button ID="btn1"  runat="server" Text="Download ESIC declaration form here..... " OnClick="btn1_Click"/>--%>
                                                        <asp:HyperLink ID="HyperLinkESIC" runat="server" Visible="False" Style="color: red" NavigateUrl="https://www.patelconsultancy.in/esic-forms-download.html">Download ESIC declaration form here.....</asp:HyperLink>

                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <%--========================================================================================--%>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="ddlEducation">Education</label>

                                                <asp:DropDownList ID="ddlEducation" runat="server" class="form-control">
                                                    <asp:ListItem Value="Non-Matric">Non-Matric</asp:ListItem>
                                                    <asp:ListItem Value="Matric">Matric</asp:ListItem>
                                                    <asp:ListItem Value="Intermediate">Intermediate</asp:ListItem>
                                                    <asp:ListItem Value="Graduation">Graduation</asp:ListItem>
                                                    <asp:ListItem Value="Master Degree">Master Degree</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="ddlSkill">Skill Category</label>

                                                <asp:DropDownList ID="ddlSkill" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSkill_SelectedIndexChanged">
                                                    <asp:ListItem Value="SU">Un-Skilled</asp:ListItem>
                                                    <asp:ListItem Value="SS">Semi Skilled</asp:ListItem>
                                                    <asp:ListItem Value="S">Skilled</asp:ListItem>
                                                    <asp:ListItem Value="HS">High Skilled</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="PVFileUpload" class="col-sm-2 control-label">Police Verification</label>
                                                <asp:FileUpload ID="PVFileUpload" runat="server"></asp:FileUpload>
                                                <%--<label for="txtPoliceVerification">Police Verification</label>
                                        <asp:FileUpload ID="txtPoliceVerification" runat="server"></asp:FileUpload>--%>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtPVD">Police Verification Date</label>
                                                <asp:TextBox ID="txtPVD" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="MVFileUpload" class="col-sm-2 control-label">Medical Examination</label>
                                                <asp:FileUpload ID="MVFileUpload" runat="server"></asp:FileUpload>
                                                <%--  <label for="txtMedicalExamination">Medical Examination</label>
                                        <asp:FileUpload ID="txtMedicalExamination" runat="server"></asp:FileUpload>--%>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtMCID">Medical Certificate Issue Date</label>
                                                <asp:TextBox ID="txtMCID" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>


                                    <%--========================================================================================--%>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtBankName">Bank Name</label>

                                                <asp:TextBox ID="txtBankName" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtAccountNo">Account No.</label>

                                                <asp:TextBox ID="txtAccountNo" runat="server" class="form-control" MaxLength="20"></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>
                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtIFSC">IFS Code</label>

                                                <asp:TextBox ID="txtIFSC" runat="server" class="form-control" MaxLength="12"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label for="txtContactPerson">Contact person name in case of emergency</label>

                                                <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Contact person name in case of emergency" MaxLength="50"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <%--========================================================================================--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Contact No.</label>

                                                <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder="Contact No." MaxLength="10"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Shift</label>

                                                <asp:DropDownList ID="txtShift" runat="server" class="form-control" placeholder="shift">
                                                    <asp:ListItem>A</asp:ListItem>
                                                    <asp:ListItem>B</asp:ListItem>
                                                    <asp:ListItem>C</asp:ListItem>
                                                    <asp:ListItem>General</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label>Basic</label>
                                                <asp:TextBox ID="txtBasic" runat="server" class="form-control" ReadOnly="true" placeholder="Basic"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <label for="FileUpload1" class="col-sm-2 control-label">Employee Photo</label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" onchange="document.getElementById('imgEmp').src=window.URL.createObjectURL(this.files[0])"></asp:FileUpload>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group mb-3">
                                                <asp:Image ID="imgEmp" runat="server" BackColor="#99CCFF" Width="100" Height="110"></asp:Image>
                                            </div>
                                        </div>

                                    </div>
                                    <%--========================================================================================--%>
                                    <hr class="my-3">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mb-3">
                                                <asp:Button ID="cmdSave" runat="server" Text="Save" Width="100px" class="btn btn-info" OnClick="cmdSave_Click"></asp:Button>
                                                <asp:Button ID="cmdCancel" runat="server" Text="Cancel" class="btn btn-danger" OnClick="cmdCancel_Click"></asp:Button>
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
                        var p = document.createElement('p');
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
                        var p = document.createElement('p');
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
                        var p = document.createElement('p');
                        p.innerText = dateFns.distanceInWordsToNow(selectedDate, { addSuffix: true });
                        document.getElementById('selected').appendChild(p);
                    }
                }
            });
        </script>
    </form>
</body>
</html>
