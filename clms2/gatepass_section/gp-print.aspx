<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gp-print.aspx.cs" Inherits="clms2.gatepass_section.gp_print" %>

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

        /* ========================================================
           Layout & Menu Bar Clearance (50px below navbar)
           ======================================================== */
        html, body {
            min-height: 100vh !important;
        }

        body {
            padding-top: 124px !important; /* Navbar height (~74px) + 50px space below menu bar */
            position: relative !important;
        }

        body > form > table.table {
            width: 100% !important;
            min-width: 100% !important;
            table-layout: fixed !important;
            margin-bottom: 0 !important;
            border: none !important;
        }

        body > form > table.table > tbody > tr > td {
            border: none !important;
            padding: 0 !important;
        }

                /* ========================================================
           Gate Pass Card & Interactive Bootstrap Styling
           ======================================================== */
        .gp-wrapper {
            width: 100% !important;
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            padding: 0 15px !important;
            box-sizing: border-box !important;
        }

        .gp-container {
            width: 100%;
            max-width: 760px;
            margin: 0 auto 3rem auto;
            text-align: left;
        }

        .gp-toolbar-card {
            background: #ffffff;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
        }

        .gp-card {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #cbd5e1;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .gp-card:hover {
            box-shadow: 0 14px 30px rgba(0, 0, 0, 0.14);
        }

        /* Header Banner */
        .gp-header {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: #ffffff;
            padding: 1.25rem 1.5rem;
            border-bottom: 3px solid #38bdf8;
            position: relative;
        }

        .gp-header-title {
            font-size: 1.3rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            color: #ffffff;
            margin: 0;
        }

        .gp-header-subtitle {
            font-size: 0.8rem;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin: 0;
        }

        .gp-timing-bar {
            background: #f1f5f9;
            color: #334155;
            font-size: 0.82rem;
            font-weight: 600;
            padding: 0.6rem 1.5rem;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .gp-badge-meta {
            background: #f8fafc;
            border-bottom: 1px dashed #cbd5e1;
            padding: 0.85rem 1.5rem;
        }

        .gp-meta-label {
            color: #64748b;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.72rem;
            letter-spacing: 0.5px;
            display: block;
            margin-bottom: 2px;
        }

        .gp-meta-value {
            color: #0f172a;
            font-weight: 700;
            font-size: 0.95rem;
        }

        /* Photo and Details */
        .gp-body {
            padding: 1.5rem;
        }

        .gp-photo-container {
            text-align: center;
            padding: 0.5rem;
            background: #f8fafc;
            border: 2px dashed #cbd5e1;
            border-radius: 12px;
            min-height: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .gp-photo {
            width: 140px;
            height: 165px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background: #e2e8f0;
            display: block;
            margin: 0 auto;
        }

        .gp-emp-name {
            font-size: 1.35rem;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 0.25rem;
        }

        .gp-field-list {
            margin-top: 0.5rem;
        }

        .gp-field-row {
            display: flex;
            align-items: baseline;
            padding: 0.45rem 0;
            border-bottom: 1px solid #f1f5f9;
            font-size: 0.9rem;
        }

        .gp-field-row:last-child {
            border-bottom: none;
        }

        .gp-field-label {
            width: 38%;
            font-weight: 600;
            color: #475569;
            flex-shrink: 0;
        }

        .gp-field-sep {
            width: 4%;
            color: #94a3b8;
            text-align: center;
            flex-shrink: 0;
        }

        .gp-field-val {
            width: 58%;
            color: #0f172a;
            font-weight: 600;
        }

        /* Footer Section */
        .gp-footer {
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
            padding: 0.85rem 1.5rem;
        }

        .gp-signatory-box {
            text-align: right;
            font-size: 0.8rem;
            color: #64748b;
        }

        .gp-signatory-line {
            border-top: 1px solid #94a3b8;
            width: 140px;
            display: inline-block;
            margin-top: 25px;
            margin-bottom: 4px;
        }

        .bg-success-subtle { background-color: #d1fae5 !important; color: #065f46 !important; }
        .bg-danger-subtle { background-color: #fee2e2 !important; color: #991b1b !important; }
        .bg-secondary-subtle { background-color: #f1f5f9 !important; color: #475569 !important; }
        .bg-info-subtle { background-color: #e0f2fe !important; color: #0369a1 !important; }

        /* Print Styles *//* Print Styles */
        @media print {
            body {
                padding-top: 0 !important;
                background: #ffffff !important;
            }
            nav.navbar,
            .gp-toolbar-card,
            footer,
            .footer,
            .no-print {
                display: none !important;
            }
            .gp-container {
                max-width: 100% !important;
                margin: 0 !important;
                padding: 0 !important;
            }
            .gp-card {
                border: 2px solid #000000 !important;
                box-shadow: none !important;
                page-break-inside: avoid;
                break-inside: avoid;
            }
            .gp-header {
                background: #1e293b !important;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
            .gp-timing-bar,
            .gp-badge-meta,
            .gp-footer {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
        }
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" style="background-color: #000000 !important; background: #000000 !important;">
                        <div class="container-fluid" style="background: transparent !important; background-color: transparent !important;">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="gp-dashboard.aspx">
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
                                        <a class="nav-link" href="gp-dashboard.aspx">Dashboard
                                <span class="visually-hidden">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="purposed-emp-detail.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Approval
                                                </a>
                                             </li>
                                              <li>
                                                 <a class="dropdown-item" href="employment_card.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employment Card
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gate Pass <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                              <li>
                                                <a class="dropdown-item" href="gp-print.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Gate Pass Show
                                                </a>
                                            </li>
                                             <li>
                                                <a class="dropdown-item" href="gp-print1.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Gate Pass Print
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
                    <div class="gp-wrapper">
                        <div class="gp-container">
                            <!-- Search & Print Interactive Toolbar -->
                            <div class="gp-toolbar-card no-print">
                                <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
                                    <div class="d-flex align-items-center gap-2 flex-grow-1" style="max-width: 520px;">
                                        <label for="txtSearch" class="fw-bold text-secondary mb-0 text-nowrap d-flex align-items-center">
                                            <i class="fa fa-id-card text-primary me-2"></i>
                                            <asp:Label ID="lblSearch" runat="server" Text="Emp Code / Name:" CssClass="fw-semibold text-dark"></asp:Label>
                                        </label>
                                        <asp:DropDownList ID="txtSearch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="txtSearch_SelectedIndexChanged" CssClass="form-select shadow-none">
                                        </asp:DropDownList>
                                    </div>
                                    <div>
                                        <button type="button" class="btn btn-primary px-3 shadow-sm d-inline-flex align-items-center gap-1" onclick="window.print();">
                                            <i class="fa fa-print me-1"></i> Print Pass
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- Modern Gate Pass Badge Card -->
                            <div class="gp-card">
                                <!-- Card Header -->
                                <div class="gp-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img src="../images/logo.png" alt="Company Logo" class="me-3" style="max-height: 48px; background: #ffffff; padding: 3px 6px; border-radius: 6px;" />
                                            <div>
                                                <h4 class="gp-header-title">Electro Solutions</h4>
                                                <p class="gp-header-subtitle">SECURITY ACCESS GATE PASS</p>
                                            </div>
                                        </div>
                                        <div class="text-end">
                                            <span class="badge bg-info text-dark fw-bold px-2 py-1 mb-1 d-inline-block">GATE PASS</span>
                                            <div class="small text-white-50"><i class="fa fa-shield me-1"></i>SECURED ACCESS</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Timing Bar -->
                                <div class="gp-timing-bar">
                                    <span>
                                        <i class="fa fa-clock-o text-primary me-1"></i>
                                        <strong>Permitted Hours:</strong> 06:00 AM to 06:00 PM
                                    </span>
                                    <span>
                                        <span class="badge bg-success-subtle text-success border border-success-subtle">
                                            <i class="fa fa-check-circle me-1"></i>AUTHORIZED
                                        </span>
                                    </span>
                                </div>

                                <!-- Meta Grid (GP No, Order No, Valid From, Valid To) -->
                                <div class="gp-badge-meta">
                                    <div class="row g-2 text-center text-sm-start">
                                        <div class="col-6 col-sm-3 border-end">
                                            <span class="gp-meta-label"><i class="fa fa-id-card-o me-1"></i>GP No.</span>
                                            <span class="gp-meta-value text-primary"><asp:Label ID="lblGPNo" runat="server" Text="--"></asp:Label></span>
                                        </div>
                                        <div class="col-6 col-sm-3 border-end">
                                            <span class="gp-meta-label"><i class="fa fa-file-text-o me-1"></i>Order No.</span>
                                            <span class="gp-meta-value"><asp:Label ID="lblOrderNo" runat="server" Text="--"></asp:Label></span>
                                        </div>
                                        <div class="col-6 col-sm-3 border-end">
                                            <span class="gp-meta-label"><i class="fa fa-calendar-check-o me-1"></i>Valid From</span>
                                            <span class="gp-meta-value text-success"><asp:Label ID="lblValidFrom" runat="server" Text="--"></asp:Label></span>
                                        </div>
                                        <div class="col-6 col-sm-3">
                                            <span class="gp-meta-label"><i class="fa fa-calendar-times-o me-1"></i>Valid To</span>
                                            <span class="gp-meta-value text-danger"><asp:Label ID="lblValidTo" runat="server" Text="--"></asp:Label></span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Main Card Body -->
                                <div class="gp-body">
                                    <div class="row g-4 align-items-center">
                                        <!-- Photo Column -->
                                        <div class="col-sm-4 text-center">
                                            <div class="gp-photo-container mb-2">
                                                <asp:Image ID="Image1" runat="server" CssClass="gp-photo img-fluid" AlternateText="Employee Photo" />
                                            </div>
                                            <div class="d-flex justify-content-center gap-1 flex-wrap">
                                                <span class="badge bg-secondary-subtle text-secondary border">
                                                    <i class="fa fa-venus-mars me-1"></i><asp:Label ID="lblGender" runat="server" Text="--"></asp:Label>
                                                </span>
                                                <span class="badge bg-danger-subtle text-danger border border-danger-subtle">
                                                    <i class="fa fa-tint me-1"></i><asp:Label ID="lblBloodGrp" runat="server" Text="--"></asp:Label>
                                                </span>
                                            </div>
                                        </div>

                                        <!-- Details Column -->
                                        <div class="col-sm-8">
                                            <div class="gp-emp-name">
                                                <asp:Label ID="lblName" runat="server" Text="Employee Name"></asp:Label>
                                            </div>
                                            <div class="text-muted small mb-3">
                                                <i class="fa fa-tag me-1"></i>Identity Mark: 
                                                <span class="fw-semibold text-dark"><asp:Label ID="lblIdentityMark" runat="server" Text="None"></asp:Label></span>
                                            </div>

                                            <div class="gp-field-list">
                                                <div class="gp-field-row">
                                                    <div class="gp-field-label"><i class="fa fa-building-o text-muted me-2"></i>Department</div>
                                                    <div class="gp-field-sep">:</div>
                                                    <div class="gp-field-val"><asp:Label ID="lblDepartment" runat="server" Text="--"></asp:Label></div>
                                                </div>
                                                <div class="gp-field-row">
                                                    <div class="gp-field-label"><i class="fa fa-briefcase text-muted me-2"></i>Vendor</div>
                                                    <div class="gp-field-sep">:</div>
                                                    <div class="gp-field-val"><asp:Label ID="lblVendor" runat="server" Text="--"></asp:Label></div>
                                                </div>
                                                <div class="gp-field-row">
                                                    <div class="gp-field-label"><i class="fa fa-barcode text-muted me-2"></i>Vendor Code</div>
                                                    <div class="gp-field-sep">:</div>
                                                    <div class="gp-field-val"><asp:Label ID="lblVendorCode" runat="server" Text="--"></asp:Label></div>
                                                </div>
                                                <div class="gp-field-row">
                                                    <div class="gp-field-label"><i class="fa fa-hospital-o text-muted me-2"></i>ESIC No.</div>
                                                    <div class="gp-field-sep">:</div>
                                                    <div class="gp-field-val"><asp:Label ID="lblESICNo" runat="server" Text="--"></asp:Label></div>
                                                </div>
                                                <div class="gp-field-row">
                                                    <div class="gp-field-label"><i class="fa fa-credit-card text-muted me-2"></i>UAN No.</div>
                                                    <div class="gp-field-sep">:</div>
                                                    <div class="gp-field-val"><asp:Label ID="lblPFNO" runat="server" Text="--"></asp:Label></div>
                                                </div>
                                            </div>
                                            <asp:Label ID="lblLIC" runat="server" Text="" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Card Footer -->
                                <div class="gp-footer">
                                    <div class="row align-items-end">
                                        <div class="col-7">
                                            <p class="text-muted small mb-0" style="font-size: 0.72rem; line-height: 1.3;">
                                                <strong>Instructions:</strong> This pass is property of Electro Solutions and must be visibly displayed at all times within premises. If found, please return to Security Dept.
                                            </p>
                                        </div>
                                        <div class="col-5">
                                            <div class="gp-signatory-box">
                                                <div class="gp-signatory-line"></div>
                                                <div class="fw-semibold">Authorized Signatory</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
                    </table>
                </td>
            </tr>

        </table>
        <table class="table  footer" >
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
