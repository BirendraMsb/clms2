<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wage-slip-new.aspx.cs" Inherits="clms2.vendor_onboarding.wage_slip_new" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <title>CLMS | User Department | Dashboard</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="Electro Solutions | Breaking Stereotypes" name="description" />
    <meta content="Electro Solutions | Breaking Stereotypes" name="author" />

    <link href="../public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="/public/common/icons/favicon.ico" type="icon/png" />
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
        .nav-link { padding: 0.32rem 0.75rem; }
        .bg-dark { background-color: #292e40 !important; }
        .icon-svg, .icon-svg.icon-svg-lg { width: 3rem; height: 3rem; }
        img, svg { vertical-align: middle; }
        svg:not(:root) { overflow: hidden; }

        /* Action Buttons */
        .btn-round-action {
            border-radius: 50px !important;
            padding: 9px 28px !important;
            font-size: 0.92rem !important;
            font-weight: 600 !important;
            letter-spacing: 0.3px !important;
            min-width: 130px !important;
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

        /* Card Entry Styles */
        .card-entry {
            background: #ffffff;
            border-radius: 1rem !important;
            border: 1px solid #e2e8f0 !important;
            box-shadow: 0 10px 25px -5px rgba(15, 23, 42, 0.08) !important;
            overflow: hidden;
            margin-bottom: 2rem !important;
            width: 100% !important;
        }
        .card-entry-header {
            background: linear-gradient(135deg, #090e1a 0%, #0f172a 45%, #1e293b 100%) !important;
            color: #ffffff;
            padding: 1.25rem 2rem;
            border-top-left-radius: 1rem !important;
            border-top-right-radius: 1rem !important;
            border-bottom: 2px solid transparent;
            border-image: linear-gradient(90deg, #38bdf8 0%, #3b82f6 50%, #6366f1 100%) 1;
        }
        .card-entry-body {
            padding: 2rem !important;
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
            border: 1px solid #cbd5e1 !important;
            border-right: none !important;
            background-color: #f8fafc !important;
            color: #64748b !important;
            border-top-left-radius: 0.5rem !important;
            border-bottom-left-radius: 0.5rem !important;
            padding: 0.55rem 0.85rem !important;
        }
        .input-group .form-control, .input-group .form-select {
            border-top-left-radius: 0 !important;
            border-bottom-left-radius: 0 !important;
        }
        body { padding-bottom: 120px !important; }
        .page-wrapper {
            margin-top: 105px !important;
            padding-bottom: 80px !important;
            padding-left: 30px !important;
            padding-right: 30px !important;
        }
        @media (max-width: 768px) {
            .page-wrapper { padding-left: 12px !important; padding-right: 12px !important; margin-top: 90px !important; }
            .card-entry-header, .card-entry-body { padding: 1.25rem !important; }
        }

        /* Wage Slip Document Card Specifics */
        .wage-slip-document-card {
            border: 1px solid #cbd5e1 !important;
            box-shadow: 0 12px 30px -8px rgba(15, 23, 42, 0.12) !important;
            background: #ffffff;
            max-width: 960px;
            margin: 0 auto !important;
        }
        .payslip-highlight-row {
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.08) 0%, rgba(16, 185, 129, 0.12) 100%) !important;
            border-top: 2px solid #10b981 !important;
            border-bottom: 2px solid #10b981 !important;
        }

        /* Print Styles */
        @media print {
            body { padding: 0 !important; background: #ffffff !important; }
            nav.navbar, .filter-card, .footer, .btn-print, .btn-action-save, .table.footer { display: none !important; }
            .page-wrapper { margin-top: 0 !important; padding: 0 !important; }
            .card-entry { box-shadow: none !important; border: 1px solid #000000 !important; margin-bottom: 0 !important; }
            .wage-slip-document-card { max-width: 100% !important; border: none !important; box-shadow: none !important; }
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

        html body nav.navbar .container-fluid,
        html body .navbar .container-fluid,
        nav.navbar .container-fluid,
        .navbar .container-fluid {
            background: transparent !important;
            background-color: transparent !important;
        }

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

            html body nav.navbar #navbarColor02:not(.show),
            html body nav.navbar .navbar-collapse:not(.show),
            nav.navbar #navbarColor02:not(.show),
            nav.navbar .navbar-collapse:not(.show),
            #navbarColor02:not(.show),
            .navbar-collapse:not(.show) {
                display: none !important;
            }

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

            html body nav.navbar .navbar-collapse .dropdown-menu.show,
            html body nav.navbar .navbar-collapse .nav-item.dropdown.show > .dropdown-menu,
            html body nav.navbar .navbar-collapse .dropdown.show > .dropdown-menu {
                display: block !important;
                visibility: visible !important;
                opacity: 1 !important;
            }

            html body nav.navbar .navbar-collapse .dropdown-menu .dropdown-item {
                padding: 8px 12px !important;
                color: #e2e8f0 !important;
                font-size: 0.88rem !important;
                display: flex !important;
                align-items: center !important;
            }

            html body nav.navbar .navbar-collapse .dropdown-menu .dropdown-item i {
                margin-right: 8px !important;
            }

            html body nav.navbar .navbar-collapse .d-flex {
                display: flex !important;
                align-items: center !important;
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

        /* Strict override for rogue layout shift rules from app.min.css (.row>*{top:130px;left:104px}) */
        .card-entry .row > *,
        .card-entry-body .row > *,
        .form-two-column-row > *,
        .row > * {
            position: static !important;
            top: auto !important;
            left: auto !important;
        }

        /* Remove any borders from outer layout table */
        table.table-layout, table.table {
            border: none !important;
            border-collapse: collapse !important;
            margin-bottom: 0 !important;
        }
        table.table-layout > :not(caption) > * > *,
        table.table > tbody > tr > td {
            border: none !important;
            border-bottom: none !important;
            border-bottom-width: 0 !important;
            padding: 0 !important;
            background-color: transparent !important;
        }
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <table class="table-layout w-100 border-0 m-0 p-0" style="border:none !important;">
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
                                            <%--   <li>
                                                <a class="dropdown-item" href="#">
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
                                            <li>
                                                <a class="dropdown-item" href="emp_chart_report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Chart Report
                                                </a>
                                            </li>
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

                                <%-- 1. Filter / Generation Panel --%>
                                <div class="card card-entry filter-card my-4">
                                    <div class="card-entry-header d-flex justify-content-between align-items-center">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="header-icon-box bg-white bg-opacity-10 text-white rounded-3 p-2 d-flex align-items-center justify-content-center" style="width: 44px; height: 44px;">
                                                <i class="fa fa-file-invoice-dollar fa-lg"></i>
                                            </div>
                                            <div>
                                                <h5 class="mb-0 fw-bold text-white tracking-wide">Pay Slip Management</h5>
                                                <small class="text-white text-opacity-75">Statutory Wage Slip (Form XIX) Generation & Download</small>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="badge bg-primary bg-opacity-25 text-white border border-light border-opacity-25 px-3 py-2 rounded-pill font-monospace" style="font-size: 0.75rem;">
                                                <i class="fa fa-certificate me-1"></i>Rule 78 (1) (b)
                                            </span>
                                        </div>
                                    </div>

                                    <div class="card-entry-body">
                                        <div class="form-section-header">
                                            <i class="fa fa-sliders-h text-primary me-2"></i>Filter Pay Slip Parameters
                                        </div>

                                        <div class="row g-3">
                                            <div class="col-lg-3 col-md-6 col-12">
                                                <label class="form-label fw-semibold text-secondary" for="ddlWorkorder">
                                                    <asp:Label ID="lblWorkorder" runat="server" Text="Work Order"></asp:Label> <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fa fa-briefcase"></i></span>
                                                    <asp:DropDownList ID="ddlWorkorder" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWorkorder_SelectedIndexChanged" CssClass="form-select"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-6 col-12">
                                                <label class="form-label fw-semibold text-secondary" for="ddlEmpCodeSearch">
                                                    <asp:Label ID="lblEmpCode" runat="server" Text="Employee Name"></asp:Label> <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                                    <asp:DropDownList ID="ddlEmpCodeSearch" runat="server" CssClass="form-select"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-6 col-12">
                                                <label class="form-label fw-semibold text-secondary" for="ddlMonthSearch">
                                                    <asp:Label ID="lblMonthSearch" runat="server" Text="Month"></asp:Label> <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fa fa-calendar-alt"></i></span>
                                                    <asp:DropDownList ID="ddlMonthSearch" runat="server" CssClass="form-select">
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
                                            </div>

                                            <div class="col-lg-3 col-md-6 col-12">
                                                <label class="form-label fw-semibold text-secondary" for="ddlYearSearch">
                                                    <asp:Label ID="lblYearSearch" runat="server" Text="Year"></asp:Label> <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                    <asp:DropDownList ID="ddlYearSearch" runat="server" CssClass="form-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-wrap align-items-center justify-content-end gap-3 mt-4 pt-3">
                                            <asp:Button ID="btnProcess" runat="server" CssClass="btn btn-round-action btn-action-save" Text="Process Pay Slip" OnClick="btnProcess_Click" />
                                            <button type="button" class="btn btn-outline-secondary btn-round-action btn-print" onclick="window.print();">
                                                <i class="fa fa-print me-2"></i>Print Pay Slip
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <%-- 2. Statutory Wage Slip (Form XIX) Document Card --%>
                                <div class="card card-entry wage-slip-document-card my-4">
                                    <div class="card-body p-4 p-md-5">
                                        <%-- Official Title Banner --%>
                                        <div class="text-center pb-3 mb-4">
                                            <div class="d-inline-block px-3 py-1 mb-2 rounded-pill bg-dark text-white text-uppercase font-monospace fw-bold" style="font-size: 0.8rem; letter-spacing: 1px;">
                                                FORM XIX
                                            </div>
                                            <div class="text-muted small fw-semibold mb-1">[See rule 78 (1) (b)]</div>
                                            <h3 class="fw-bold text-dark text-uppercase tracking-wide mb-1">Wage Slip</h3>
                                            <div class="text-muted small">The Contract Labour (Regulation & Abolition) Central Rules, 1971</div>
                                        </div>

                                        <%-- Profile Information Grid (Contractor & Workman Details) --%>
                                        <div class="row g-4 mb-4">
                                            <%-- Contractor Details Card --%>
                                            <div class="col-lg-6 col-12">
                                                <div class="p-3 rounded-3 bg-light border h-100">
                                                    <div class="d-flex align-items-center gap-2 mb-3 pb-2 border-bottom">
                                                        <i class="fa fa-building text-primary"></i>
                                                        <h6 class="mb-0 fw-bold text-dark text-uppercase small letter-spacing-1">Contractor Information</h6>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-sm table-borderless mb-0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold" style="width: 42%;">Name of Contractor</td>
                                                                    <td class="fw-bold text-dark" style="width: 5%;">:</td>
                                                                    <td class="fw-bold text-dark"><asp:Label ID="lblVendorName" runat="server" Text=""></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold">Address of Contractor</td>
                                                                    <td class="fw-bold text-dark">:</td>
                                                                    <td class="text-dark"><asp:Label ID="lblFirnAddress" runat="server" Text=""></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold">Nature of Work</td>
                                                                    <td class="fw-bold text-dark">:</td>
                                                                    <td class="text-dark"><asp:Label ID="lblNatueOfWork" runat="server" Text=""></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold">Location of Work</td>
                                                                    <td class="fw-bold text-dark">:</td>
                                                                    <td class="text-dark"><asp:Label ID="lblJobLocation" runat="server" Text=""></asp:Label></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- Workman & Period Details Card --%>
                                            <div class="col-lg-6 col-12">
                                                <div class="p-3 rounded-3 bg-light border h-100">
                                                    <div class="d-flex align-items-center gap-2 mb-3 pb-2 border-bottom">
                                                        <i class="fa fa-id-card text-primary"></i>
                                                        <h6 class="mb-0 fw-bold text-dark text-uppercase small letter-spacing-1">Workman & Wage Period</h6>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-sm table-borderless mb-0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold" style="width: 42%;">Name of Workman</td>
                                                                    <td class="fw-bold text-dark" style="width: 5%;">:</td>
                                                                    <td class="fw-bold text-primary"><asp:Label ID="lblNameOfWorkMan" runat="server" Text=""></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold">Wage Month & Year</td>
                                                                    <td class="fw-bold text-dark">:</td>
                                                                    <td class="fw-semibold text-dark">
                                                                        <asp:Label ID="lblMonth1" runat="server" Text=""></asp:Label>
                                                                        <span class="mx-1">/</span>
                                                                        <asp:Label ID="lblYear1" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold">No. of Days Worked</td>
                                                                    <td class="fw-bold text-dark">:</td>
                                                                    <td class="fw-bold text-dark">
                                                                        <asp:Label ID="lblNoOfDayWorkDone" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text-muted fw-semibold">Units Worked (Piece Rate)</td>
                                                                    <td class="fw-bold text-dark">:</td>
                                                                    <td class="text-muted"><asp:Label ID="lblNoOfkUnitWorkded" runat="server" Text="">NA</asp:Label></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- Financial Breakdown & Wages Table --%>
                                        <div class="mb-4">
                                            <div class="d-flex align-items-center gap-2 mb-3">
                                                <i class="fa fa-coins text-primary"></i>
                                                <h6 class="mb-0 fw-bold text-dark text-uppercase small letter-spacing-1">Earnings & Deductions Summary</h6>
                                            </div>
                                            <div class="table-responsive shadow-sm rounded-3 border">
                                                <table class="table table-hover align-middle mb-0">
                                                    <thead class="table-light">
                                                        <tr>
                                                            <th style="width: 50px;" class="text-center">Sl.</th>
                                                            <th>Wage Component / Description</th>
                                                            <th class="text-end" style="width: 250px;">Amount (₹)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="text-center text-muted">1</td>
                                                            <td class="fw-semibold text-dark">Rate of Daily Wages / Piece Rate</td>
                                                            <td class="text-end fw-semibold text-dark">
                                                                <asp:Label ID="lblDailyBasic" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center text-muted">2</td>
                                                            <td class="fw-semibold text-dark">Amount of Overtime Wages</td>
                                                            <td class="text-end fw-semibold text-dark">
                                                                <asp:Label ID="lblOtEaning" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr class="table-primary bg-opacity-10">
                                                            <td class="text-center fw-bold text-primary">3</td>
                                                            <td class="fw-bold text-primary">Gross Wages Payable</td>
                                                            <td class="text-end fw-bold text-primary fs-6">
                                                                <asp:Label ID="lblTotalEarning" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center text-muted">4</td>
                                                            <td class="fw-semibold text-danger">Deductions, If Any</td>
                                                            <td class="text-end fw-semibold text-danger">
                                                                <asp:Label ID="lblTotalDeduction" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr class="table-success bg-opacity-25" style="border-top: 2px solid #22c55e;">
                                                            <td class="text-center fw-bold text-success fs-5">★</td>
                                                            <td class="fw-bold text-success fs-6 text-uppercase">Net Amount of Wages Paid</td>
                                                            <td class="text-end fw-bold text-success fs-4">
                                                                <asp:Label ID="lblTotPayable" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <%-- Signature & Certification Row --%>
                                        <div class="row pt-4 mt-4">
                                            <div class="col-md-6 col-12 mb-3 mb-md-0">
                                                <div class="p-3 border rounded-3 bg-light text-center" style="min-height: 110px;">
                                                    <div class="text-muted small fw-semibold text-uppercase mb-4">Signature / Thumb Impression of Workman</div>
                                                    <div class="border-bottom border-2 mx-auto w-50" style="margin-top: 35px;"></div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="p-3 border rounded-3 bg-light text-center" style="min-height: 110px;">
                                                    <div class="text-muted small fw-semibold text-uppercase mb-2">Initials of the Contractor / Representative</div>
                                                    <div class="fw-bold text-dark mt-3">
                                                        <asp:Label ID="lblInitial" runat="server" Text="" CssClass="fs-6"></asp:Label>
                                                    </div>
                                                    <div class="border-bottom border-2 mx-auto w-50 mt-2"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <asp:Label ID="lblLIC" runat="server" Text="" Visible="false"></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <table class="table-layout w-100 border-0 m-0 p-0" style="border:none !important; margin-top: 40px !important;">
            <tr>
                <td>
                    <footer class="py-3 bg-dark mt-auto">
                        <div class="container-fluid">
                            <div class="text-center small">
                                <div class="text-light">&copy; 2022 | Electro Solutions | All Rights Reserved</div>
                            </div>
                        </div>
                    </footer>
                </td>
            </tr>
        </table>
    </form>

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

</body>
</html>

