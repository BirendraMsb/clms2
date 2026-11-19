<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emp_chart_report.aspx.cs" Inherits="clms2.vendor_onboarding.emp_chart_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
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
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div class="loading">
            <div class="loader"></div>
        </div>
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" style="background-color: #000000 !important; background: #000000 !important;">
                        <div class="container-fluid" style="background: transparent !important; background-color: transparent !important;">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="dashboard.aspx">
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
                                            <%--  <li>
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
                                <div class="row mb-2 border-bottom pb-2">
                                    <div class="col-sm-12">
                                        <div class="page-title-box">
                                            <div class="float-start">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-3 d-flex justify-content-between ">Employee Report</div>
                                    <div class="card-body">
                                        <%--<asp:TextBox ID="txtID" runat="server" Visible="false" class="form-control"></asp:TextBox>
                                        <asp:TextBox ID="txtID1" runat="server" Visible="false" class="form-control"></asp:TextBox>--%>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <h4>Dept Wise Employee Report </h4>
                                                    <asp:Chart ID="Chart1" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                                        Visible="true" ImageType="Png" runat="server" Height="400px" Width="400px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
                                                        <Titles>
                                                            <asp:Title TextStyle="Frame">
                                                            </asp:Title>
                                                        </Titles>
                                                        <Legends>
                                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                                LegendStyle="Column">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Series>
                                                            <asp:Series Name="Series1" ChartType="Pie" YValuesPerPoint="2">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea1">
                                                                <Area3DStyle Enable3D="true" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>



                                                    <%-- <asp:Chart ID="Chart1" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series1"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <%--  <h4>Department Table </h4>
                                                    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Font-Bold="True" AutoGenerateColumns="False">
                                                        <Columns>
                                                             <asp:BoundField DataField="department" HeaderText="Department" ItemStyle-Width="150" />
                                                              <asp:BoundField DataField="no_of_dept" HeaderText="No of Department" ItemStyle-Width="150" />
                                                        </Columns>
                                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                                        <HeaderStyle BackColor="#FFFFCC" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#FFF7E7" BorderStyle="Solid" BorderWidth="2px" ForeColor="#8C4510" />
                                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                                    </asp:GridView>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <h4>Caste Wise Employee Report </h4>
                                                    <asp:Chart ID="Chart2" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                                        Visible="true" ImageType="Png" runat="server" Height="400px" Width="400px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
                                                        <Titles>
                                                            <asp:Title TextStyle="Frame">
                                                            </asp:Title>
                                                        </Titles>
                                                        <Legends>
                                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                                LegendStyle="Column">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Series>
                                                            <asp:Series Name="Series2" ChartType="Pie" YValuesPerPoint="2">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea2">
                                                                <Area3DStyle Enable3D="true" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>


                                                    <%--   <asp:Chart ID="Chart2" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series2"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea2"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <h4>Gender Wise Employee Report </h4>
                                                    <asp:Chart ID="Chart3" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                                        Visible="true" ImageType="Png" runat="server" Height="400px" Width="400px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
                                                        <Titles>
                                                            <asp:Title TextStyle="Frame">
                                                            </asp:Title>
                                                        </Titles>
                                                        <Legends>
                                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                                LegendStyle="Column">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Series>
                                                            <asp:Series Name="Series3" ChartType="Pie" YValuesPerPoint="2">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea3">
                                                                <Area3DStyle Enable3D="true" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                    <%--  <asp:Chart ID="Chart3" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series3"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea3"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <h4>State Wise Employee Report </h4>
                                                    <asp:Chart ID="Chart4" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                                        Visible="true" ImageType="Png" runat="server" Height="400px" Width="400px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
                                                        <Titles>
                                                            <asp:Title TextStyle="Frame">
                                                            </asp:Title>
                                                        </Titles>
                                                        <Legends>
                                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                                LegendStyle="Column">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Series>
                                                            <asp:Series Name="Series4" ChartType="Pie" YValuesPerPoint="2">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea4">
                                                                <Area3DStyle Enable3D="true" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>

                                                    <%-- <asp:Chart ID="Chart1" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series1"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <h4>Education Wise Employee Report </h4>
                                                    <asp:Chart ID="Chart5" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                                        Visible="true" ImageType="Png" runat="server" Height="400px" Width="400px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
                                                        <Titles>
                                                            <asp:Title TextStyle="Frame">
                                                            </asp:Title>
                                                        </Titles>
                                                        <Legends>
                                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                                LegendStyle="Column">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Series>
                                                            <asp:Series Name="Series5" ChartType="Pie" YValuesPerPoint="2">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea5">
                                                                <Area3DStyle Enable3D="true" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>


                                                    <%--   <asp:Chart ID="Chart2" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series2"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea2"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                    <h4>Skill Wise Employee Report </h4>
                                                    <asp:Chart ID="Chart6" BorderlineColor="Black" BorderlineDashStyle="Solid"
                                                        Visible="true" ImageType="Png" runat="server" Height="400px" Width="400px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
                                                        <Titles>
                                                            <asp:Title TextStyle="Frame">
                                                            </asp:Title>
                                                        </Titles>
                                                        <Legends>
                                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                                LegendStyle="Column">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Series>
                                                            <asp:Series Name="Series6" ChartType="Pie" YValuesPerPoint="2">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea6">
                                                                <Area3DStyle Enable3D="true" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                    <%--  <asp:Chart ID="Chart3" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series3"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea3"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>--%>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group mb-3">
                                                </div>
                                            </div>

                                        </div>
                                        <%--  <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Total Valid GP</label>
                                                    <asp:TextBox ID="txtEMail" runat="server" class="form-control" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>No of Emp Paid</label>
                                                    <asp:TextBox ID="txtNoOfEmpPaid" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Man Days</label>
                                                    <asp:TextBox ID="txtManDays" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>Gross Wages Paid</label>
                                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>UAN Amount Deposited</label>
                                                    <asp:TextBox ID="txtPFAmountDeposited" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>UAN Challan Number</label>
                                                    <asp:TextBox ID="txtPFChallanNo" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>UAN Challan Date</label>
                                                    <asp:TextBox ID="txtPIN" runat="server" class="form-control" MaxLength="6"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>ESI Amount Deposited</label>
                                                    <asp:TextBox ID="txtESIAmtDeposited" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>ESI Challan Number.</label>
                                                    <asp:TextBox ID="txtESIChallanNo" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>ESI Challan Date</label>
                                                    <asp:TextBox ID="txtEsiChallanDate" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>ESI Contribution (In No)</label>
                                                    <asp:TextBox ID="txtEsiContribution" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group mb-3">
                                                    <label>UAN Contricution (In No)</label>
                                                    <asp:TextBox ID="txtPANNo" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                       <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>UAN Challan [PDF] </label><br />
                                                <asp:FileUpload ID="PFChallanUpload" runat="server"></asp:FileUpload>
                                            </div>
                                        </div>
                                      </div>
                                         <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>ESIC Challan [PDF] </label><br />
                                                <asp:FileUpload ID="EsciChallanUpload" runat="server"></asp:FileUpload>
                                            </div>
                                        </div>
                                      </div>
                                       <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Bank Statement [PDF] </label><br />
                                                <asp:FileUpload ID="BankStatementUpload" runat="server"></asp:FileUpload>
                                            </div>
                                        </div>
                                      </div>--%>


                                        <%--  <hr class="my-3">--%>
                                        <%--  <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <asp:Button ID="cmdSave" runat="server" Text="Save" Width="100px" class="btn btn-info rounded-pill"></asp:Button>
                                                    <asp:Button ID="cmdCancel" runat="server" Text="Cancel" class="btn btn-danger rounded-pill"></asp:Button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                </div>
                                            </div>
                                        </div>--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <%--<asp:LinkButton ID="btnDownloadPF" runat="server" CssClass="btn btn-primary" OnClick="btnDownloandPF_Click">download UAN</asp:LinkButton>
                                                    <asp:LinkButton ID="btnDownloadEsic" runat="server" CssClass="btn btn-primary" OnClick="btnDownloandEsic_Click">download ESIC</asp:LinkButton><br />--%>
                                                    <asp:Label ID="lblMSG" runat="server" Text="" Font-Size="X-Large" ForeColor="blue" Font-Bold="True"></asp:Label><br />
                                                    <asp:Label ID="lblMSGError" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="True"></asp:Label><br />
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
                                <div class="text-light ">&copy; 2022 | Electro Solutions | All Rights Reserved </div>
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
        <%--  <script type="text/jscript" src="../public/newfront/assets/js/bootstrap.bundle.min.js?v=3.1"></script>--%>

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

    </form>
</body>
</html>
