<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="purposed-emp-detail-approval.aspx.cs" Inherits="clms2.safety_dept.purposed_emp_detail_approval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLMS | Emp | Approval</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="Electro Solutions | Breaking Stereotypes" name="description" />
    <meta content="Electro Solutions | Breaking Stereotypes" name="author" />

    <link href="../public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css?v=3.1" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css?v=3.1" />
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
    /* Menu Bar (Navbar) Solid Black Theme */
        html body nav.navbar,
        html body nav.navbar.bg-dark,
        html body nav.navbar.transparent,
        html body nav.navbar.transparent.bg-dark,
        html body .navbar.fixed-top,
        .navbar.bg-dark,
        .navbar.transparent {
            background: #000000 !important;
            background-color: #000000 !important;
            border-bottom: 2px solid #222222 !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6) !important;
        }

        /* Ensure navbar inner container-fluid is strictly transparent and never white */
        html body nav.navbar .container-fluid,
        html body .navbar .container-fluid,
        nav.navbar .container-fluid,
        .navbar .container-fluid {
            background: transparent !important;
            background-color: transparent !important;
        }

        /* Menu Bar Navigation Links - Crisp White on Black */
        html body nav.navbar .navbar-nav .nav-link,
        html body nav.navbar .nav-link {
            color: #ffffff !important;
            font-size: 0.92rem !important;
            font-weight: 600 !important;
            letter-spacing: 0.02em !important;
            padding: 0.5rem 0.85rem !important;
            opacity: 1 !important;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.8) !important;
        }

        html body nav.navbar .navbar-nav .nav-link:hover,
        html body nav.navbar .navbar-nav .nav-link:focus,
        html body nav.navbar .navbar-nav .show > .nav-link {
            color: #38bdf8 !important;
            background: rgba(255, 255, 255, 0.15) !important;
            border-radius: 0.375rem !important;
        }

        html body nav.navbar .nav-link .fa-angle-down,
        html body nav.navbar .nav-link span.fa-angle-down {
            color: #38bdf8 !important;
            font-size: 0.8rem !important;
            margin-left: 0.35rem !important;
        }

        /* Dropdown Menus - Solid Black Background */
        html body nav.navbar .nav-item.dropdown,
        html body nav.navbar .dropdown {
            position: relative !important;
        }

        html body nav.navbar .dropdown-menu {
            position: absolute !important;
            top: 100% !important;
            left: 0 !important;
            margin: 0 !important;
            z-index: 99999 !important;
            background: #000000 !important;
            background-color: #000000 !important;
            border: 1px solid #333333 !important;
            border-radius: 0.5rem !important;
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.85) !important;
            padding: 0.5rem 0.35rem !important;
            min-width: 235px !important;
        }

        html body nav.navbar .dropdown-menu::before {
            content: '' !important;
            position: absolute !important;
            top: -12px !important;
            left: 0 !important;
            right: 0 !important;
            height: 12px !important;
            background: transparent !important;
        }

        html body nav.navbar .dropdown-menu:not(.show) {
            display: none;
        }

        html body nav.navbar .dropdown-menu.show,
        html body nav.navbar .nav-item.dropdown.show > .dropdown-menu,
        html body nav.navbar .dropdown.show > .dropdown-menu {
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
        }

        html body nav.navbar .dropdown-item {
            color: #ffffff !important;
            font-size: 0.86rem !important;
            font-weight: 500 !important;
            padding: 0.55rem 0.85rem !important;
            border-radius: 0.35rem !important;
            margin-bottom: 0.15rem !important;
            transition: all 0.15s ease !important;
            display: flex !important;
            align-items: center !important;
            background: transparent !important;
        }

        html body nav.navbar .dropdown-item i,
        html body nav.navbar .dropdown-item i.fa,
        html body nav.navbar .dropdown-item i.fa-angle-right {
            color: #38bdf8 !important;
            margin-right: 0.55rem !important;
            font-size: 0.72rem !important;
        }

        html body nav.navbar .dropdown-item:hover,
        html body nav.navbar .dropdown-item:focus {
            color: #ffffff !important;
            background-color: #222222 !important;
            transform: translateX(4px) !important;
        }

        html body nav.navbar .dropdown-item:hover i,
        html body nav.navbar .dropdown-item:hover i.fa-angle-right {
            color: #7dd3fc !important;
        }

        html body nav.navbar .dropdown-divider {
            border-top: 1px solid #333333 !important;
            margin: 0.4rem 0 !important;
        }

        @media (min-width: 992px) {
            html body nav.navbar .nav-item.dropdown:hover > .dropdown-menu,
            html body nav.navbar .dropdown:hover > .dropdown-menu {
                display: block !important;
                visibility: visible !important;
                opacity: 1 !important;
            }
            html body nav.navbar .nav-item.dropdown:hover > .nav-link .fa-angle-down,
            html body nav.navbar .dropdown:hover > .nav-link .fa-angle-down,
            html body nav.navbar .nav-item.dropdown:hover .nav-link span.fa-angle-down {
                transform: rotate(180deg) !important;
                color: #38bdf8 !important;
                opacity: 1 !important;
            }
        }

        /* ========================================================
           Mobile Navbar Collapse System (Strict ID + Class Rules)
           ======================================================== */
        @media (max-width: 991.98px) {
            html body nav.navbar .container-fluid {
                display: flex !important;
                flex-wrap: wrap !important;
                align-items: center !important;
                justify-content: space-between !important;
                padding-left: 12px !important;
                padding-right: 12px !important;
            }

            html body nav.navbar .navbar-brand.w-40,
            html body nav.navbar .navbar-brand {
                width: auto !important;
                max-width: 75% !important;
                margin-right: 0 !important;
                padding: 0 !important;
            }

            html body nav.navbar .navbar-brand img {
                max-width: 100% !important;
                height: auto !important;
                max-height: 38px !important;
            }

            /* STRICTLY HIDE collapsed navbar by default on mobile */
            html body nav.navbar #navbarColor02:not(.show),
            html body nav.navbar .navbar-collapse:not(.show),
            nav.navbar #navbarColor02:not(.show),
            nav.navbar .navbar-collapse:not(.show),
            #navbarColor02:not(.show),
            .navbar-collapse:not(.show) {
                display: none !important;
            }

            /* STRICTLY DISPLAY navbar when toggled open on mobile */
            html body nav.navbar #navbarColor02.show,
            html body nav.navbar .navbar-collapse.show,
            nav.navbar #navbarColor02.show,
            nav.navbar .navbar-collapse.show,
            #navbarColor02.show,
            .navbar-collapse.show {
                display: block !important;
                background-color: #000000 !important;
                padding: 12px 16px !important;
                margin-top: 8px !important;
                border-top: 1px solid #222222 !important;
                border-radius: 0 0 6px 6px !important;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7) !important;
                max-height: 80vh !important;
                overflow-y: auto !important;
                -webkit-overflow-scrolling: touch !important;
            }

            /* Mobile hamburger toggler button */
            html body nav.navbar .navbar-toggler,
            nav.navbar .navbar-toggler,
            .navbar .navbar-toggler {
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                padding: 6px 10px !important;
                border: 1px solid rgba(255, 255, 255, 0.6) !important;
                border-radius: 4px !important;
                background-color: transparent !important;
                color: #ffffff !important;
                cursor: pointer !important;
                margin-left: auto !important;
            }

            html body nav.navbar .navbar-toggler:focus,
            nav.navbar .navbar-toggler:focus,
            .navbar .navbar-toggler:focus {
                box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.35) !important;
                outline: none !important;
            }

            /* Mobile Sub-menu (Dropdown Menu) Styling */
            html body nav.navbar .navbar-collapse .dropdown-menu {
                position: static !important;
                float: none !important;
                display: none !important;
                width: 100% !important;
                background-color: #111111 !important;
                border: 1px solid #2a2a2a !important;
                border-radius: 6px !important;
                box-shadow: none !important;
                margin-top: 4px !important;
                margin-bottom: 8px !important;
                padding: 4px 8px !important;
                visibility: visible !important;
                opacity: 1 !important;
                transform: none !important;
                animation: none !important;
            }

            /* Mobile Sub-menu Visible State */
            html body nav.navbar .navbar-collapse .dropdown-menu.show,
            html body nav.navbar .navbar-collapse .nav-item.dropdown.show > .dropdown-menu,
            html body nav.navbar .navbar-collapse .dropdown.show > .dropdown-menu {
                display: block !important;
                visibility: visible !important;
                opacity: 1 !important;
            }

            /* Mobile Sub-menu Items */
            html body nav.navbar .navbar-collapse .dropdown-menu .dropdown-item {
                padding: 8px 12px !important;
                color: #e2e8f0 !important;
                font-size: 0.88rem !important;
                display: flex !important;
                align-items: center !important;
                border-bottom: 1px solid #1e1e1e !important;
                background: transparent !important;
                white-space: normal !important;
            }

            html body nav.navbar .navbar-collapse .dropdown-menu .dropdown-item:last-child {
                border-bottom: none !important;
            }

            html body nav.navbar .navbar-collapse .dropdown-menu .dropdown-item:hover,
            html body nav.navbar .navbar-collapse .dropdown-menu .dropdown-item:focus {
                background-color: #222222 !important;
                color: #38bdf8 !important;
            }

            /* Caret icon rotation when dropdown is open */
            html body nav.navbar .dropdown.show > .nav-link .fa-angle-down,
            html body nav.navbar .dropdown.show > .nav-link span.fa-angle-down,
            html body nav.navbar .nav-item.show > .nav-link .fa-angle-down,
            html body nav.navbar .nav-item.show > .nav-link span.fa-angle-down {
                transform: rotate(180deg) !important;
                color: #38bdf8 !important;
            }

            /* Right side controls */
            html body nav.navbar .navbar-collapse .d-flex {
                flex-wrap: wrap !important;
                gap: 8px !important;
                margin-top: 12px !important;
                padding-top: 10px !important;
                border-top: 1px solid #222222 !important;
            }
        }

        @media (min-width: 992px) {
            html body nav.navbar #navbarColor02,
            html body nav.navbar .navbar-collapse,
            nav.navbar #navbarColor02,
            nav.navbar .navbar-collapse,
            #navbarColor02,
            .navbar-collapse {
                display: flex !important;
                flex-basis: auto !important;
            }

            html body nav.navbar .navbar-toggler,
            nav.navbar .navbar-toggler,
            .navbar .navbar-toggler {
                display: none !important;
            }
        }
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <%-- <div class="loading">  
            <div class="loader"></div>
        </div>--%>
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" style="background-color: #000000 !important; background: #000000 !important;">
                        <div class="container-fluid" style="background: transparent !important; background-color: transparent !important;">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="safety-dashboard.aspx">
                                    <span>
                                        <img src="../public/common/images/ElectroSolHeader3.png" class="logo-lg logo-light" alt="Electro Solutions | Breaking Stereotypes Logo" width="188" height="50" />
                                    </span>
                                </a>
                            </div>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarColor02">
                                <ul class="navbar-nav me-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="safety-dashboard.aspx">Dashboard
                                <span class="visually-hidden">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="purposed-emp-detail-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Approval
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
                                <div class="d-flex">
                                    <asp:Label ID="lblDate" runat="server" class="form-control bg-dark" Text="Date" Style="color: #ffffff !important; font-size: 15px; width: auto; font-weight: 600;"></asp:Label>
                                    &nbsp;&nbsp;
                         <img src="../images/k2.png" alt="Department" width="50" height="50" />&nbsp;&nbsp;  
                       <asp:Label ID="lblUser" runat="server" Text="" Style="color: #FFFFCC; font-size: 15px"></asp:Label>&nbsp;&nbsp;
                     <%-- <input class="form-control me-sm-2" type="search" placeholder="Search">--%>
                                    <%--  <button class="btn btn-secondary my-2 my-sm-0" type="submit" fdprocessedid="i5uef7">Search</button>--%>
                                </div>
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
                                        <span>Employee Approval</span>
                                        <%--<span><a href="work-order-entry.aspx" class="text-white">Add New</a></span>--%>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow: scroll; width: 80%">
                                            <%--========================================================================================--%>
                                            <%--  <asp:Button ID="CheckAll" runat="server" Text="Check All" class="btn btn-info rounded-pill" />--%>

                                            <%--    <asp:Button ID="UncheckAll" runat="server" Text="Uncheck All" class="btn btn-info rounded-pill" />--%>

                                            <%--<asp:Button ID="btnGenerate_GP" runat="server" Text="Generate GP" class="btn bg-purple rounded-pill" OnClick="OpenWindow" />--%>

                                            <asp:GridView ID="GvEmp" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                GridLines="Vertical" AllowPaging="true" PageSize="5" DataKeyNames="id" Class="table table-bordered nowrap" ShowHeaderWhenEmpty="true" OnPageIndexChanging="GvEmp_PageIndexChanging" OnRowCancelingEdit="GvEmp_RowCancelingEdit" OnRowDataBound="GvEmp_RowDataBound" OnRowEditing="GvEmp_RowEditing" OnRowUpdating="GvEmp_RowUpdating">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl. No">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>


                                                    <%--    <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="10px" />
                                        </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Work Order" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_workorderno" runat="server" Text='<%#Eval("workorderno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vendor Code" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_vendor_code" runat="server" Text='<%#Eval("vendor_code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee Code" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_code" runat="server" Text='<%#Eval("emp_code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Emp Name" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_name" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Photo">
                                                        <ItemTemplate>
                                                            <asp:Image ID="image1" runat="server" Width="80px" Height="100px" ImageUrl='<%# Eval("img_file","../emp_pic/{0}") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle Height="50px" Width="50px" />
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="Address" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_emp_add" runat="server" Text='<%#Eval("emp_add") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                                    <%--  <asp:TemplateField HeaderText="Contact No. 1" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_ph_no1" runat="server" Text='<%#Eval("emp_ph_no1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--       <asp:TemplateField HeaderText="Contact No. 2" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_emp_ph_no2" runat="server" Text='<%#Eval("emp_ph_no2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                                    <%--   <asp:TemplateField HeaderText="E-Mail" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Gender" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_gender" runat="server" Text='<%#Eval("gender") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DOB" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_dob" runat="server" Text='<%#Eval("dob") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--         <asp:TemplateField HeaderText="Cast" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_emp_cast" runat="server" Text='<%#Eval("emp_cast") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Blood Grp" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_blood_grp" runat="server" Text='<%#Eval("blood_grp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--          <asp:TemplateField HeaderText="Nationality" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_nationality" runat="server" Text='<%#Eval("nationality") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Aadhar No." ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_aadhar_no" runat="server" Text='<%#Eval("aadhar_no") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--      <asp:TemplateField HeaderText="UAN No." ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_pfno" runat="server" Text='<%#Eval("pfno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--     <asp:TemplateField HeaderText="ESIC NO" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_escic" runat="server" Text='<%#Eval("escic") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--          <asp:TemplateField HeaderText="Educational" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Educational" runat="server" Text='<%#Eval("education") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> --%>
                                                    <%--                 <asp:TemplateField HeaderText="Police Verification" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_police_verification" runat="server" Text='<%#Eval("police_verification") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>

                                                    <%--    <asp:TemplateField HeaderText="Police Verification Certificate">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Text='<%# Bind("police_verification") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.police_verification", "../police_verification_doc/{0}") %>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>


                                                    <asp:TemplateField HeaderText="Medical Examination Certificate">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" Text='<%# Bind("medical_examination") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.medical_examination", "../medical_examination_doc/{0}") %>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Medical Report" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_medical_report" runat="server" Text='<%#Eval("medical_report")%>'> </asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlMedReport" runat="server" AutoPostBack="false">
                                                                <asp:ListItem Value="Fit">Fit</asp:ListItem>
                                                                <asp:ListItem Value="Unfit">Unfit</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Safety Training" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_safety_training" runat="server" Text='<%#Eval("safety_training")%>'> </asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlSefetyTraining" runat="server" AutoPostBack="false">
                                                                <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                                                <asp:ListItem Value="Not-Completed">Not-Completed</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Any Critical Disease">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_any_disease" runat="server" Text='<%#Eval("any_disease") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%--       <asp:TemplateField HeaderText="Bank Name" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bank_name" runat="server" Text='<%#Eval("bank_name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <%--   <asp:TemplateField HeaderText="Account No." ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="acc_no" runat="server" Text='<%#Eval("acc_no") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <%--  <asp:TemplateField HeaderText="IFSC" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ifs_code" runat="server" Text='<%#Eval("ifs_code") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>

                                                    <%-- <asp:TemplateField HeaderText="In case of Emergency Contact Person Name" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_emergency_contact_person_name" runat="server" Text='<%#Eval("emergency_contact_person_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact Person Ph. No." ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ecpn_ph_no" runat="server" Text='<%#Eval("ecpn_ph_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>

                                                    <%--  <asp:TemplateField HeaderText="Shift">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Shift" runat="server" Text='<%#Eval("shift")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlShift" runat="server">
                                                                <asp:ListItem Value="A">A</asp:ListItem>
                                                                <asp:ListItem Value="B">B</asp:ListItem>
                                                                <asp:ListItem Value="C">C</asp:ListItem>
                                                                <asp:ListItem Value="General">General</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <%--    <asp:TemplateField HeaderText="Action By Dept">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_DeptApproval" runat="server" Text='<%#Eval("dept_approval") %>'></asp:Label>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>--%>
                                                    <%--    <asp:TemplateField HeaderText="Dept. Remarks" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_DeptRemarks" runat="server" Text='<%#Eval("dept_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <%--  <asp:TemplateField HeaderText="Action By HR">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_HRApproval" runat="server" Text='<%#Eval("hr_approval") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--     <asp:TemplateField HeaderText="HR Remarks" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_HRRemarks" runat="server" Text='<%#Eval("hr_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_HRRemarks" runat="server" Text='<%#Eval("hr_remarks")%>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:TemplateField HeaderText="Action By Safety">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_SafetyApproval" runat="server" Text='<%#Eval("safety_approval") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlSafetyApproval" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSafetyApproval_SelectedIndexChanged">
                                                                <asp:ListItem Value="Select">Select</asp:ListItem>
                                                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                                                <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlSafetyApproval" ErrorMessage="Select any one" ForeColor="#CC0000" InitialValue="Select"></asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Safety Remarks" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_SafetyRemarks" runat="server" Text='<%#Eval("safety_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_SafetyRemarks" runat="server" Text='<%#Eval("safety_remarks")%>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ReqValSafetyRemarks" runat="server" Enabled="false" ControlToValidate="txt_SafetyRemarks" ErrorMessage="Remarks" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>

                                                    <%--   <asp:TemplateField HeaderText="Action By Security">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Secapproval" runat="server" Text='<%#Eval("security_approval") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Security Remarks" Visible="false" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_SecRemarks" runat="server" Text='<%#Eval("security_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_Edit" class="btn btn-success rounded-pill" runat="server" Text="Approval" CommandName="Edit" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                            <asp:Button ID="btn_Update" class="btn btn-primary rounded-pill" runat="server" Text="OK" CommandName="Update" />
                                                            <%--<asp:Button ID="btn_Cancel" class="btn btn-secondary rounded-pill" runat="server" Text="Cancel" CommandName="Cancel" />--%>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>
                                                <%-- <PagerSettings Mode="NextPrevious" />--%>
                                                <AlternatingRowStyle BackColor="#FFFFFF" />
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <%-- <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="White" />--%>
                                                <HeaderStyle BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle CssClass="GridPager" BackColor="#999999" ForeColor="#0033CC" HorizontalAlign="Center" BorderColor="#FF9900" Font-Bold="True" Font-Size="X-Large" />
                                                <RowStyle BackColor="#FFFFFF" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#000065" />
                                            </asp:GridView>
                                            <%--  <asp:HiddenField ID="hfCount" runat="server" Value = "0" />--%>
                                            <%--========================================================================================--%>
                                        </div>
                                        <div>
                                            <asp:Label ID="lblMSGError" ForeColor="Red" Font-Size="Large" runat="server" Text=""></asp:Label><br />
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
                                <div class="text-light ">&copy; 2022 | Electro Solutions | All Rights Reserved</div>

                                <%--<div class="text-light d-none d-sm-inline-block float-end">
				 <a href="https://shitij.in">Kshitij Info Solutions</a>
			</div>--%>
                            </div>
                        </div>
                    </footer>
                </td>
            </tr>
        </table>

        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js?v=3.1" defer></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
        <script type="text/jscript" src="../public/newfront/assets/js/bootstrap.bundle.min.js?v=3.1"></script>

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
        <%-- <script type="text/jscript">
            $(window).on("load", function () {
                $('#GvEmp').DataTable({ responsive: true });
            });
        </script>
<script type="text/javascript">
            $(document).ready(function () {
                // Ensure mobile navbar is explicitly closed on page load for small screens
                if ($(window).width() < 992) {
                    $('#navbarColor02').removeClass('show');
                    $('.navbar-toggler').attr('aria-expanded', 'false');
                }

                // Smooth toggler for mobile hamburger button
                $('.navbar-toggler').off('click').on('click', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    var target = $(this).attr('data-bs-target') || $(this).attr('data-target') || '#navbarColor02';
                    var $menu = $(target);
                    $menu.toggleClass('show');
                    var isOpen = $menu.hasClass('show');
                    $(this).attr('aria-expanded', isOpen ? 'true' : 'false');
                });

                // Dropdown sub-menu click handling for mobile and touch devices
                $(document).off('click.navDropdown', '.navbar .dropdown-toggle').on('click.navDropdown', '.navbar .dropdown-toggle', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    var $toggle = $(this);
                    var $dropdown = $toggle.closest('.dropdown');
                    var $menu = $dropdown.children('.dropdown-menu');
                    var isCurrentlyOpen = $menu.hasClass('show') || $dropdown.hasClass('show');

                    // Close sibling dropdowns
                    $dropdown.siblings('.dropdown').removeClass('show').children('.dropdown-menu').removeClass('show');
                    $dropdown.siblings('.dropdown').find('.dropdown-toggle').attr('aria-expanded', 'false');

                    if (!isCurrentlyOpen) {
                        $dropdown.addClass('show');
                        $menu.addClass('show');
                        $toggle.attr('aria-expanded', 'true');
                    } else {
                        $dropdown.removeClass('show');
                        $menu.removeClass('show');
                        $toggle.attr('aria-expanded', 'false');
                    }
                });

                // Close dropdowns and mobile menu on outside click
                $(document).off('click.navDoc').on('click.navDoc', function (e) {
                    if (!$(e.target).closest('.navbar .dropdown').length) {
                        $('.navbar .dropdown, .navbar .dropdown-menu').removeClass('show');
                        $('.navbar .dropdown-toggle').attr('aria-expanded', 'false');
                    }
                    if ($(window).width() < 992) {
                        if (!$(e.target).closest('nav.navbar').length) {
                            $('#navbarColor02').removeClass('show');
                            $('.navbar-toggler').attr('aria-expanded', 'false');
                        }
                    }
                });

                // Close mobile menu when navigating non-dropdown links
                $('.navbar-collapse a:not(.dropdown-toggle):not(.dropdown-item)').on('click', function () {
                    if ($(window).width() < 992) {
                        $('#navbarColor02').removeClass('show');
                        $('.navbar-toggler').attr('aria-expanded', 'false');
                    }
                });

                $('.navbar .dropdown-menu a.dropdown-item').on('click', function (e) {
                    e.stopPropagation();
                });
            });
        </script>
--%>
    </form>
</body>
</html>
