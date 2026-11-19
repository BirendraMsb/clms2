<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="license_certificate.aspx.cs" Inherits="clms2.vendor_onboarding.license_certificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport" />
    <meta content="Electro Solutions | Breaking Stereotypes" name="description" />
    <meta content="Electro Solutions | Breaking Stereotypes" name="author" />
        <%-- <link href="../public/common/css/bootswatchTheme.css" rel="stylesheet" /> --%>
    <link rel="icon" href="/public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css?v=3.1" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css?v=3.1" />

    <style>
        .nav-link { padding: 0.32rem 0.75rem; }
        .bg-dark { background-color: #292e40 !important; }
        .btn-round-action {
            border-radius: 50px !important;
            padding: 10px 32px !important;
            font-size: 0.95rem !important;
            font-weight: 600 !important;
            letter-spacing: 0.4px !important;
            min-width: 140px !important;
            cursor: pointer !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1) !important;
            text-transform: none !important;
            border: 1px solid transparent !important;
            outline: none !important;
        }
        .btn-round-action:hover { transform: translateY(-2px) !important; }
        .btn-action-save {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%) !important;
            color: #ffffff !important;
            border-color: #1d4ed8 !important;
            box-shadow: 0 4px 14px rgba(37, 99, 235, 0.32) !important;
        }
        .btn-action-save:hover {
            background: linear-gradient(135deg, #1d4ed8 0%, #1e40af 100%) !important;
            box-shadow: 0 6px 20px rgba(37, 99, 235, 0.48) !important;
            color: #ffffff !important;
        }
        .card-entry {
            background: #ffffff;
            border-radius: 1rem !important;
            border: 1px solid #e2e8f0 !important;
            box-shadow: 0 10px 25px -5px rgba(15, 23, 42, 0.08) !important;
            overflow: hidden;
            margin-bottom: 140px !important;
            width: 100% !important;
        }
        .card-entry-header {
            background: linear-gradient(135deg, #090e1a 0%, #0f172a 45%, #1e293b 100%) !important;
            color: #ffffff;
            padding: 1.25rem 1.75rem;
            padding-left: 50px !important;
            padding-right: 50px !important;
            border-top-left-radius: 1rem !important;
            border-top-right-radius: 1rem !important;
            border-bottom: 2px solid transparent;
            border-image: linear-gradient(90deg, #38bdf8 0%, #3b82f6 50%, #6366f1 100%) 1;
        }
        .card-entry-body {
            padding-left: 50px !important;
            padding-right: 50px !important;
            padding-bottom: 120px !important;
            padding-top: 1.5rem !important;
        }
        .form-section-header {
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            color: #0f172a;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 0.5rem;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .form-label {
            font-size: 0.84rem;
            font-weight: 600;
            color: #334155;
            margin-bottom: 0.4rem;
        }
        .form-control, .form-select {
            border: 1px solid #cbd5e1 !important;
            border-radius: 0.5rem !important;
            padding: 0.55rem 0.85rem !important;
            font-size: 0.88rem !important;
            color: #0f172a !important;
            background-color: #ffffff;
        }
        .form-control:focus, .form-select:focus {
            border-color: #3b82f6 !important;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15) !important;
        }
        .input-group-text {
            background-color: #f8fafc;
            border: 1px solid #cbd5e1;
            border-radius: 0.5rem 0 0 0.5rem !important;
            color: #64748b;
        }
        .input-group > :not(:first-child):not(.dropdown-menu):not(.valid-tooltip):not(.valid-feedback):not(.invalid-tooltip):not(.invalid-feedback) {
            border-top-left-radius: 0 !important;
            border-bottom-left-radius: 0 !important;
        }
        .form-two-column-row {
            margin-left: -17.5px;
            margin-right: -17.5px;
        }
        .form-two-column-row > [class*="col-"] {
            padding-left: 17.5px;
            padding-right: 17.5px;
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
<body>
    <form id="form1" runat="server">
        <%--<div class="loading">
            <div class="loader"></div>
        </div>--%>
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
                                            <%--    <li>
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
        </table>
        <!--======================================================================================= -->
                <div class="container-fluid px-4">
            <br /><br /><br />
            <div class="card card-entry my-4">
                <div class="card-entry-header d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center gap-3">
                        <div class="header-icon-box bg-white bg-opacity-10 text-white rounded-3 p-2 d-flex align-items-center justify-content-center" style="width: 44px; height: 44px;">
                            <i class="fa fa-stamp fa-lg"></i>
                        </div>
                        <div>
                            <h5 class="mb-0 text-white fw-bold">FORM XXIV - Return to Licensing Officer</h5>
                            <small class="text-white-50">[See rule 82 (1)] Return sent by Contractor to Licensing Officer</small>
                        </div>
                    </div>
                    <div>
                        <span class="badge bg-primary bg-opacity-25 text-white border border-light border-opacity-25 px-3 py-2 rounded-pill font-monospace" style="font-size: 0.75rem;">
                            <i class="fa fa-certificate me-1"></i>Statutory Compliance
                        </span>
                    </div>
                </div>

                <div class="card-entry-body">
                    <%-- Section 1: Contractor & Principal Employer Details --%>
                    <div class="form-section-header">
                        <i class="fa fa-building text-primary me-2"></i>Contractor &amp; Principal Employer Details
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="vendor_owner_name">Name of Contractor</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-user-tie"></i></span>
                                <asp:TextBox ID="vendor_owner_name" runat="server" class="form-control" placeholder="Contractor owner name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true" ControlToValidate="vendor_owner_name" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="owner_address">Address of Contractor</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-map-marker-alt"></i></span>
                                <asp:TextBox ID="owner_address" runat="server" class="form-control" placeholder="Contractor address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" ControlToValidate="owner_address" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="vendor_name">Name of Establishment</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-store-alt"></i></span>
                                <asp:TextBox ID="vendor_name" runat="server" class="form-control" placeholder="Establishment name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" ControlToValidate="vendor_name" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="firm_address">Address of Establishment</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-map-pin"></i></span>
                                <asp:TextBox ID="firm_address" runat="server" class="form-control" placeholder="Establishment address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" SetFocusOnError="true" ControlToValidate="firm_address" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="principal_employer">Name of Principal Employer</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-landmark"></i></span>
                                <asp:TextBox ID="principal_employer" runat="server" class="form-control" placeholder="Principal employer name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" ControlToValidate="principal_employer" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="pe_address">Address of Principal Employer</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-location-arrow"></i></span>
                                <asp:TextBox ID="pe_address" runat="server" class="form-control" placeholder="Principal employer address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="true" ControlToValidate="pe_address" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <%-- Section 2: Duration of Contract & Working Days --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-calendar-check text-primary me-2"></i>Duration of Contract &amp; Working Days
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="valid_from">Contract Duration From</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                <asp:TextBox ID="valid_from" runat="server" class="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" SetFocusOnError="true" ControlToValidate="valid_from" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="valid_to">Contract Duration To</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-calendar-alt"></i></span>
                                <asp:TextBox ID="valid_to" runat="server" class="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" SetFocusOnError="true" ControlToValidate="valid_to" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNumDaysEstWorked">Days Principal Employer Est. Worked</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-industry"></i></span>
                                <asp:TextBox ID="txtNumDaysEstWorked" runat="server" class="form-control" placeholder="Days worked"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" SetFocusOnError="true" ControlToValidate="txtNumDaysEstWorked" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNumDaysContrWorked">Days Contractor Est. Worked</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-hard-hat"></i></span>
                                <asp:TextBox ID="txtNumDaysContrWorked" runat="server" class="form-control" placeholder="Days worked"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" SetFocusOnError="true" ControlToValidate="txtNumDaysContrWorked" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <%-- Section 3: Maximum Contract Labour Employed --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-users text-primary me-2"></i>Max Contract Labour Employed On Any Day
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoDaysMenEmployed">Men Employed</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-male"></i></span>
                                <asp:TextBox ID="txtNoDaysMenEmployed" runat="server" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" SetFocusOnError="true" ControlToValidate="txtNoDaysMenEmployed" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoDaysWomenEmployed">Women Employed</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-female"></i></span>
                                <asp:TextBox ID="txtNoDaysWomenEmployed" runat="server" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" SetFocusOnError="true" ControlToValidate="txtNoDaysWomenEmployed" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoDaysChildEmployed">Children Employed</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-child"></i></span>
                                <asp:TextBox ID="txtNoDaysChildEmployed" runat="server" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" ControlToValidate="txtNoDaysChildEmployed" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="workers_authorised">Total Authorized Labour</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-users-cog"></i></span>
                                <asp:TextBox ID="workers_authorised" runat="server" class="form-control" placeholder="Total workers"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ControlToValidate="workers_authorised" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <%-- Section 4: Working Hours & Holidays --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-business-time text-primary me-2"></i>Working Hours &amp; Weekly Holidays
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtDailyWorkDay">Daily Hours of Work &amp; Spread-over</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-clock"></i></span>
                                <asp:TextBox ID="txtDailyWorkDay" runat="server" class="form-control" placeholder="e.g. 8 hours"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" SetFocusOnError="true" ControlToValidate="txtDailyWorkDay" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtWeeklyHoliday">Weekly Holiday Observed Day</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-calendar-week"></i></span>
                                <asp:TextBox ID="txtWeeklyHoliday" runat="server" class="form-control" placeholder="e.g. Sunday"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" SetFocusOnError="true" ControlToValidate="txtWeeklyHoliday" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtHolydayType">Whether Holiday was Paid</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-check-circle"></i></span>
                                <asp:TextBox ID="txtHolydayType" runat="server" class="form-control" placeholder="Yes / No"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" SetFocusOnError="true" ControlToValidate="txtHolydayType" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoManHrs">Number of Overtime Man-Hours</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-hourglass-half"></i></span>
                                <asp:TextBox ID="txtNoManHrs" runat="server" class="form-control" placeholder="Overtime hours"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" SetFocusOnError="true" ControlToValidate="txtNoManHrs" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <%-- Section 5: Man Days Worked --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-user-clock text-primary me-2"></i>Number of Man-Days Worked
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoDaysMenWorked">Man-Days - Men</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-male"></i></span>
                                <asp:TextBox ID="txtNoDaysMenWorked" runat="server" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" SetFocusOnError="true" ControlToValidate="txtNoDaysMenWorked" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoDaysWomenWorked">Man-Days - Women</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-female"></i></span>
                                <asp:TextBox ID="txtNoDaysWomenWorked" runat="server" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" SetFocusOnError="true" ControlToValidate="txtNoDaysWomenWorked" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoDaysChildWorked">Man-Days - Children</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-child"></i></span>
                                <asp:TextBox ID="txtNoDaysChildWorked" runat="server" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" SetFocusOnError="true" ControlToValidate="txtNoDaysChildWorked" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtNoWorkDayTotal">Total Man-Days</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-calculator"></i></span>
                                <asp:TextBox ID="txtNoWorkDayTotal" runat="server" class="form-control" placeholder="Total"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" SetFocusOnError="true" ControlToValidate="txtNoWorkDayTotal" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <%-- Section 6: Wages Paid & Deductions --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-money-bill-wave text-primary me-2"></i>Amount of Wages Paid &amp; Deductions
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtWagesPaidMan">Wages Paid - Men (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-rupee-sign"></i></span>
                                <asp:TextBox ID="txtWagesPaidMan" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" SetFocusOnError="true" ControlToValidate="txtWagesPaidMan" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtWagesPaidWomen">Wages Paid - Women (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-rupee-sign"></i></span>
                                <asp:TextBox ID="txtWagesPaidWomen" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" SetFocusOnError="true" ControlToValidate="txtWagesPaidWomen" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtWagesPaidChildren">Wages Paid - Children (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-rupee-sign"></i></span>
                                <asp:TextBox ID="txtWagesPaidChildren" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" SetFocusOnError="true" ControlToValidate="txtWagesPaidChildren" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtWagesPaidTotal">Total Wages Paid (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-coins"></i></span>
                                <asp:TextBox ID="txtWagesPaidTotal" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" SetFocusOnError="true" ControlToValidate="txtWagesPaidTotal" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtAmtDedWagesMan">Deductions - Men (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-minus-circle"></i></span>
                                <asp:TextBox ID="txtAmtDedWagesMan" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" SetFocusOnError="true" ControlToValidate="txtAmtDedWagesMan" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtAmtWagesDedWomen">Deductions - Women (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-minus-circle"></i></span>
                                <asp:TextBox ID="txtAmtWagesDedWomen" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" SetFocusOnError="true" ControlToValidate="txtAmtWagesDedWomen" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtAmtWagesDedChildren">Deductions - Children (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-minus-circle"></i></span>
                                <asp:TextBox ID="txtAmtWagesDedChildren" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" SetFocusOnError="true" ControlToValidate="txtAmtWagesDedChildren" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtAmtWagesDedTotal">Total Deductions (₹)</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-minus-circle"></i></span>
                                <asp:TextBox ID="txtAmtWagesDedTotal" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" SetFocusOnError="true" ControlToValidate="txtAmtWagesDedTotal" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <%-- Section 7: Welfare Amenities Provided --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-medkit text-primary me-2"></i>Welfare Amenities Provided
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtCanteen">Canteen Standards</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-utensils"></i></span>
                                <asp:TextBox ID="txtCanteen" runat="server" class="form-control" placeholder="Details or Yes/No"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" SetFocusOnError="true" ControlToValidate="txtCanteen" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtRestRoom">Rest-rooms Standards</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-couch"></i></span>
                                <asp:TextBox ID="txtRestRoom" runat="server" class="form-control" placeholder="Details or Yes/No"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" SetFocusOnError="true" ControlToValidate="txtRestRoom" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtDrinkingWater">Drinking Water Facilities</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-faucet"></i></span>
                                <asp:TextBox ID="txtDrinkingWater" runat="server" class="form-control" placeholder="Details or Yes/No"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" SetFocusOnError="true" ControlToValidate="txtDrinkingWater" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtCreche">Crèche Facilities</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-baby"></i></span>
                                <asp:TextBox ID="txtCreche" runat="server" class="form-control" placeholder="Details or Yes/No"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" SetFocusOnError="true" ControlToValidate="txtCreche" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtFirstAid">First-Aid Standards</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-first-aid"></i></span>
                                <asp:TextBox ID="txtFirstAid" runat="server" class="form-control" placeholder="Details or Yes/No"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" SetFocusOnError="true" ControlToValidate="txtFirstAid" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <%-- Balanced spacer column --%>
                        </div>
                    </div>

                    <%-- Section 8: Place & Date --%>
                    <hr class="my-4 border-2" />
                    <div class="form-section-header">
                        <i class="fa fa-map-marker-alt text-primary me-2"></i>Declaration Place &amp; Date
                    </div>

                    <div class="row form-two-column-row">
                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtPlace">Place</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-map-pin"></i></span>
                                <asp:TextBox ID="txtPlace" runat="server" class="form-control" placeholder="Place"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" SetFocusOnError="true" ControlToValidate="txtPlace" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <label class="form-label" for="txtDate">Date</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa fa-calendar-day"></i></span>
                                <asp:TextBox ID="txtDate" runat="server" class="form-control" placeholder="DD-MM-YYYY"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" SetFocusOnError="true" ControlToValidate="txtDate" ValidationGroup="Reg" ForeColor="#dc2626" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 text-center py-3">
                            <asp:Button ID="btnSave" class="btn btn-round-action btn-action-save" runat="server" Text="Save Return" ValidationGroup="Reg" />
                        </div>
                    </div>

                    <div class="card-bottom-spacer" style="height: 140px;"></div>
                </div>
            </div>
        </div>
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
                            <div class="text-light ">&copy; 2022 | Electro Solutions | All Rights Reserved</div>

                        </div>
                    </div>
                </footer>
                </td>
            </div>
        </div>
        <%--<div class="alert alert-success animated fadeInUp">
            Logged out Successfully
        </div>--%>
        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js?v=3.1" defer></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js"
            defer></script>
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
