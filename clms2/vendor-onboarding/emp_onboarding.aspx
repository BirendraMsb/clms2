<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emp_onboarding.aspx.cs"
    Inherits="clms2.vendor_onboarding.emp_onboarding" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
        <title>CLMS | Emp | Dashboard</title>

        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
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
        <link rel="stylesheet" href="../dtm/css/pikaday.css" />
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

            .icon-svg,
            .icon-svg.icon-svg-lg {
                width: 3rem;
                height: 3rem;
            }

            img,
            svg {
                vertical-align: middle;
            }

            svg:not(:root) {
                overflow: hidden;
            }

            /* ==========================================
           PREMIUM ROUNDED ACTION BUTTONS
           ========================================== */
            .btn-round-action {
                border-radius: 50px !important;
                padding: 10px 32px !important;
                font-size: 0.95rem !important;
                font-weight: 600 !important;
                letter-spacing: 0.4px !important;
                min-width: 130px !important;
                cursor: pointer !important;
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1) !important;
                text-transform: none !important;
                position: relative !important;
                border: 1px solid transparent !important;
                outline: none !important;
            }

            .btn-round-action:hover {
                transform: translateY(-2px) !important;
            }

            .btn-round-action:active {
                transform: translateY(1px) !important;
            }

            /* Save Button - Vibrant Indigo Gradient */
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

            /* Cancel/Clear Button - Sophisticated Soft Slate */
            .btn-action-cancel {
                background: #ffffff !important;
                color: #475569 !important;
                border: 1.5px solid #cbd5e1 !important;
                box-shadow: 0 2px 6px rgba(15, 23, 42, 0.05) !important;
            }

            .btn-action-cancel:hover {
                background: #f1f5f9 !important;
                border-color: #94a3b8 !important;
                color: #0f172a !important;
                box-shadow: 0 4px 12px rgba(15, 23, 42, 0.1) !important;
            }

            /* ==========================================
           BOOTSTRAP CONTROL & CARD ENHANCEMENTS
           ========================================== */
            .card-entry {
                background: #ffffff;
                border-radius: 1rem !important;
                border: 1px solid #e2e8f0 !important;
                box-shadow: 0 10px 25px -5px rgba(15, 23, 42, 0.08), 0 8px 10px -6px rgba(15, 23, 42, 0.04) !important;
                overflow: hidden;
                margin-left: auto !important;
                margin-right: auto !important;
                margin-bottom: 140px !important;
                margin-block-end: 140px !important;
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

            .form-control,
            .form-select {
                border: 1px solid #cbd5e1 !important;
                border-radius: 0.5rem !important;
                padding: 0.55rem 0.85rem !important;
                font-size: 0.88rem !important;
                color: #0f172a !important;
                background-color: #ffffff;
                transition: all 0.2s ease-in-out !important;
            }

            .form-control:focus,
            .form-select:focus {
                border-color: #3b82f6 !important;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15) !important;
                background-color: #ffffff !important;
            }

            .input-group-text {
                border: 1px solid #cbd5e1 !important;
                border-right: none !important;
                background-color: #f8fafc !important;
                color: #64748b !important;
                border-top-left-radius: 0.5rem !important;
                border-bottom-left-radius: 0.5rem !important;
                font-size: 0.9rem !important;
                padding: 0.55rem 0.85rem !important;
            }

            .input-group .form-control,
            .input-group .form-select {
                border-top-left-radius: 0 !important;
                border-bottom-left-radius: 0 !important;
            }

            .form-check-inline {
                display: inline-flex;
                align-items: center;
                gap: 0.35rem;
            }

            body {
                padding-bottom: 160px !important;
            }

            .page-wrapper {
                padding-bottom: 80px !important;
                padding-left: 50px !important;
                padding-right: 50px !important;
            }

            .card-bottom-spacer {
                height: 140px !important;
                display: block;
                width: 100%;
            }

            /* ==========================================
           THREE-COLUMN GRID & SPACING
           ========================================== */
            .form-three-column-row,
            .form-three-column-row {
                margin-left: -10px !important;
                margin-right: -10px !important;
            }

            @media (min-width: 768px) {
                .form-three-column-row > [class*="col-"],
                .form-three-column-row > [class*="col-"] {
                    padding-left: 10px !important;
                    padding-right: 10px !important;
                }
            }

            @media (max-width: 767.98px) {
                .page-wrapper {
                    padding-left: 10px !important;
                    padding-right: 10px !important;
                }

                .card-entry-header,
                .card-entry-body {
                    padding-left: 15px !important;
                    padding-right: 15px !important;
                }

                .form-three-column-row > [class*="col-"],
                .form-three-column-row > [class*="col-"] {
                    padding-left: 0 !important;
                    padding-right: 0 !important;
                }
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

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
                                            <a class="navbar-brand" href="dashboard.aspx">
                                                <span>
                                                    <img src="../public/common/images/ElectroSolHeader3.png"
                                                        class="logo-lg logo-light"
                                                        alt="Electro Solutions | Breaking Stereotypes Logo" width="188"
                                                        height="50" />
                                                </span>
                                            </a>
                                        </div>
                                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#navbarColor02" aria-controls="navbarColor02"
                                            aria-expanded="false" aria-label="Toggle navigation">
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
                                                    <a class="nav-link dropdown-toggle " href="#" id="navbarweb"
                                                        data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false">File <span
                                                            class="fa fa-angle-down ms-1"></span></a>
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
                                                    <a class="nav-link dropdown-toggle " href="#" id="navbarweb"
                                                        data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                        aria-expanded="false">Vendor Registration <span
                                                            class="fa fa-angle-down ms-1"></span></a>
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
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true" aria-expanded="false">Employee
                                                    Onboarding <span class="fa fa-angle-down ms-1"></span>
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
                                                <a class="nav-link dropdown-toggle " href="#" id="navbarweb2"
                                                    data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                    aria-expanded="false">Attendance <span
                                                        class="fa fa-angle-down ms-1"></span></a>
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
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true" aria-expanded="false">Payroll
                                                    <span class="fa fa-angle-down ms-1"></span>
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
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true" aria-expanded="false">Compliances
                                                    <span class="fa fa-angle-down ms-1"></span>
                                                </a>
                                                <ul class="dropdown-menu ">

                                                    <li>
                                                        <a class="dropdown-item" href="tot_workorder_comp.aspx">
                                                            <i class="fa fa-angle-right me-1"></i>Total Work Order
                                                            compliance
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
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true"
                                                    aria-expanded="false">Statutory<span
                                                        class="fa fa-angle-down ms-1"></span>
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
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true" aria-expanded="false">Employee
                                                    Offboarding <span class="fa fa-angle-down ms-1"></span>
                                                </a>
                                                <ul class="dropdown-menu ">
                                                    <li>
                                                        <a class="dropdown-item" href="fnf_request.aspx">
                                                            <i class="fa fa-angle-right me-1"></i>Full and Final Request
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item" href="fnf_settlement.aspx">
                                                            <i class="fa fa-angle-right me-1"></i>Full and Final
                                                            Settlement
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
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true" aria-expanded="false">Report
                                                    <span class="fa fa-angle-down ms-1"></span>
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
                                                    <%-- <li>
                                                        <a class="dropdown-item" href="emp_chart_report.aspx">
                                                            <i class="fa fa-angle-right me-1"></i> Employee Chart Report
                                                        </a>
                                            </li>--%>
                                            </ul>
                                            </li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle " href="#" data-bs-toggle="dropdown"
                                                    role="button" aria-haspopup="true" aria-expanded="false">Admin <span
                                                        class="fa fa-angle-down ms-1"></span>
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
                                                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                                                        href="#" role="button" aria-haspopup="true"
                                                        aria-expanded="false">Dropdown</a>
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
                                                        <asp:Label ID="lblDate" runat="server"
                                                            class="form-control bg-dark" Text="Date"
                                                            Style="color: #ffffff !important; font-size: 15px; width: auto; font-weight: 600;">
                                                        </asp:Label>
                                                        &nbsp;&nbsp;
                                                        <img src="../images/k2.png" alt="Department" width="50"
                                                            height="50" />&nbsp;&nbsp;
                                                        <asp:Label ID="lblUser" runat="server" Text=""
                                                            Style="color: #FFFFCC; font-size: 15px"></asp:Label>
                                                        &nbsp;&nbsp;
                                                        <%-- <input class="form-control me-sm-2" type="search"
                                                            placeholder="Search">--%>
                                                            <%-- <button class="btn btn-secondary my-2 my-sm-0"
                                                                type="submit" fdprocessedid="i5uef7">Search</button>--%>
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
                                    </div>
                                    <br />
                                    <br />
                                    <br />

                                    <div class="card card-entry my-4">
                                        <div
                                            class="card-entry-header d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center gap-3">
                                                <div class="header-icon-box bg-white bg-opacity-10 text-white rounded-3 p-2 d-flex align-items-center justify-content-center"
                                                    style="width: 44px; height: 44px;">
                                                    <i class="fa fa-id-card fa-lg"></i>
                                                </div>
                                                <div>
                                                    <h5 class="mb-0 text-white fw-bold">Employee Detail Entry</h5>
                                                    <small class="text-white-50">Vendor Employee Onboarding &amp;
                                                        Profile Registration</small>
                                                </div>
                                            </div>
                                            <div>
                                                <span
                                                    class="badge bg-primary bg-opacity-25 text-white border border-light border-opacity-25 px-3 py-2 rounded-pill font-monospace"
                                                    style="font-size: 0.75rem;">
                                                    <i class="fa fa-user-plus me-1"></i>Employee Onboarding
                                                </span>
                                            </div>
                                        </div>
                                        <div class="card-entry-body">
                                            <%-- Status & Notification Alerts --%>
                                                <div class="mb-3">
                                                    <asp:Label ID="lblMSG" ForeColor="Green" Font-Size="Large"
                                                        runat="server" Text=""></asp:Label>
                                                    <asp:Label ID="lblMSGError" ForeColor="Red" Font-Size="Large"
                                                        runat="server" Text=""></asp:Label>
                                                    <asp:Label ID="lblPoliceExpiry" ForeColor="Green" Font-Size="Large"
                                                        runat="server" Text=""></asp:Label>
                                                    <asp:Label ID="lblMedicalExpiry" ForeColor="Green" Font-Size="Large"
                                                        runat="server" Text=""></asp:Label>
                                                    <asp:TextBox ID="txtID" runat="server" class="form-control"
                                                        Visible="false"></asp:TextBox>
                                                </div>

                                                <%-- Mandatory Declaration Download Box --%>
                                                    <div class="alert alert-light border shadow-sm mb-4 p-3 rounded-3">
                                                        <div
                                                            class="d-flex flex-wrap align-items-center justify-content-between gap-3">
                                                            <div class="d-flex align-items-center gap-2">
                                                                <i class="fa fa-info-circle text-primary fa-lg"></i>
                                                                <div>
                                                                    <span class="fw-bold text-dark">Statutory
                                                                        Declarations:</span>
                                                                    <span class="text-danger ms-2 small">UAN / ESI
                                                                        download is mandatory for companies not having
                                                                        UAN / ESIC registration.</span>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex gap-2">
                                                                <asp:LinkButton ID="pfLinkButton1" runat="server"
                                                                    CssClass="btn btn-sm btn-outline-primary rounded-pill px-3"
                                                                    CausesValidation="False"
                                                                    OnClick="pfLinkButton1_Click">
                                                                    <i class="fa fa-download me-1"></i> Download UAN
                                                                    Declaration
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="esicLinkButton2" runat="server"
                                                                    CssClass="btn btn-sm btn-outline-primary rounded-pill px-3"
                                                                    CausesValidation="False"
                                                                    OnClick="esicLinkButton2_Click">
                                                                    <i class="fa fa-download me-1"></i> Download ESIC
                                                                    Declaration
                                                                </asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%--========================================================SECTION
                                                        1: WORK ORDER & EMPLOYMENT
                                                        DETAILS========================================================--%>
                                                        <div class="form-section-header">
                                                            <i class="fa fa-briefcase text-primary me-2"></i>Work Order
                                                            &amp; Employment Details
                                                        </div>

                                                        <div class="row form-three-column-row">
                                                            <%-- Row 1: Work Order No. & Vendor Code --%>
                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                    <label class="form-label" for="txtWorkOrderNo">Work
                                                                        Order No. <span
                                                                            class="text-danger">*</span></label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-text"><i
                                                                                class="fa fa-file-invoice"></i></span>
                                                                        <asp:DropDownList ID="txtWorkOrderNo"
                                                                            runat="server" class="form-select"
                                                                            AutoPostBack="true"
                                                                            OnSelectedIndexChanged="txtWorkOrderNo_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator1" runat="server"
                                                                        ControlToValidate="txtWorkOrderNo"
                                                                        ErrorMessage="* Pls Select Work Order"
                                                                        ForeColor="#CC0000" InitialValue="Select"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                    <label class="form-label" for="txtVendorCode">Vendor
                                                                        Code <span class="text-danger">*</span></label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-text"><i
                                                                                class="fa fa-building"></i></span>
                                                                        <asp:TextBox ID="txtVendorCode" runat="server"
                                                                            class="form-control" ReadOnly="true">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                    <asp:RequiredFieldValidator
                                                                        ID="RequiredFieldValidator3" runat="server"
                                                                        ControlToValidate="txtVendorCode"
                                                                        ErrorMessage="* Pls Enter Vendor Reg. No."
                                                                        ForeColor="#CC3300" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>

                                                                <%-- Row 2: Emp Code & Department --%>
                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                        <label class="form-label" for="txtEmpCode">Emp
                                                                            Code <span
                                                                                class="text-danger">*</span></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-text"><i
                                                                                    class="fa fa-id-badge"></i></span>
                                                                            <asp:TextBox ID="txtEmpCode" runat="server"
                                                                                class="form-control"
                                                                                placeholder="Emp Code"></asp:TextBox>
                                                                        </div>
                                                                        <asp:RequiredFieldValidator
                                                                            ID="RequiredFieldValidator4" runat="server"
                                                                            ControlToValidate="txtEmpCode"
                                                                            ErrorMessage="* Pls Enter Emp code"
                                                                            ForeColor="#CC3300" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                        <label class="form-label"
                                                                            for="txtDepart">Department <span
                                                                                class="text-danger">*</span></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-text"><i
                                                                                    class="fa fa-sitemap"></i></span>
                                                                            <asp:TextBox ID="txtDepart" runat="server"
                                                                                class="form-control" ReadOnly="true"
                                                                                MaxLength="100"></asp:TextBox>
                                                                        </div>
                                                                        <asp:RequiredFieldValidator
                                                                            ID="RequiredFieldValidator5" runat="server"
                                                                            ControlToValidate="txtDepart"
                                                                            ErrorMessage="* Pls Enter Department"
                                                                            ForeColor="#CC3300" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <%-- Row 3: Shift & Designation --%>
                                                                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                            <label class="form-label"
                                                                                for="txtShift">Shift <span
                                                                                    class="text-danger">*</span></label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-text"><i
                                                                                        class="fa fa-clock"></i></span>
                                                                                <asp:DropDownList ID="txtShift"
                                                                                    runat="server" class="form-select"
                                                                                    placeholder="shift">
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                            <asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator30"
                                                                                runat="server"
                                                                                ControlToValidate="txtShift"
                                                                                ErrorMessage="* Pls Select Shift"
                                                                                ForeColor="#CC0000"
                                                                                InitialValue="Select" Display="Dynamic">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                            <label class="form-label"
                                                                                for="ddlDesignation">Designation <span
                                                                                    class="text-danger">*</span></label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-text"><i
                                                                                        class="fa fa-user-tag"></i></span>
                                                                                <asp:DropDownList ID="ddlDesignation"
                                                                                    runat="server" class="form-select">
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                            <asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator18"
                                                                                runat="server"
                                                                                ControlToValidate="ddlDesignation"
                                                                                ErrorMessage="* Pls Select Designation"
                                                                                ForeColor="#CC0000"
                                                                                InitialValue="Select" Display="Dynamic">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <%-- Row 4: Experience & Trade --%>
                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="txtExp">Experience (Years)
                                                                                    <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-business-time"></i></span>
                                                                                    <asp:TextBox ID="txtExp"
                                                                                        runat="server"
                                                                                        class="form-control"
                                                                                        placeholder="Experience">
                                                                                    </asp:TextBox>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator32"
                                                                                    runat="server"
                                                                                    ControlToValidate="txtExp"
                                                                                    ErrorMessage="* Pls Enter Experience "
                                                                                    ForeColor="#CC0000"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator
                                                                                    ID="RegularExpressionValidator11"
                                                                                    ControlToValidate="txtExp"
                                                                                    runat="server"
                                                                                    ErrorMessage="Only Numbers Allowed"
                                                                                    ForeColor="#CC0000"
                                                                                    ValidationExpression="\d+"
                                                                                    Display="Dynamic">
                                                                                </asp:RegularExpressionValidator>
                                                                            </div>

                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <asp:UpdatePanel
                                                                                            ID="UpdatePanel5"
                                                                                            runat="server">
                                                                                            <ContentTemplate>
                                                                                                <label
                                                                                                    class="form-label"
                                                                                                    for="ddlEducation">Education
                                                                                                    <span
                                                                                                        class="text-danger">*</span></label>
                                                                                                <div
                                                                                                    class="input-group">
                                                                                                    <span
                                                                                                        class="input-group-text"><i
                                                                                                            class="fa fa-graduation-cap"></i></span>
                                                                                                    <asp:DropDownList
                                                                                                        ID="ddlEducation"
                                                                                                        runat="server"
                                                                                                        class="form-select"
                                                                                                        AutoPostBack="true"
                                                                                                        OnSelectedIndexChanged="ddlEducation_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                </div>
                                                                                                <asp:RequiredFieldValidator
                                                                                                    ID="RequiredFieldValidator21"
                                                                                                    runat="server"
                                                                                                    ControlToValidate="ddlEducation"
                                                                                                    ErrorMessage="* Pls Select Education"
                                                                                                    ForeColor="#CC0000"
                                                                                                    InitialValue="Select"
                                                                                                    Display="Dynamic">
                                                                                                </asp:RequiredFieldValidator>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                    </div>

                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <asp:UpdatePanel ID="UpdatePanel6"
                                                                                    runat="server">
                                                                                    <ContentTemplate>
                                                                                        <label class="form-label"
                                                                                            for="ddlTrade">Trade <span
                                                                                                class="text-danger">*</span></label>
                                                                                        <div class="input-group">
                                                                                            <span
                                                                                                class="input-group-text"><i
                                                                                                    class="fa fa-tools"></i></span>
                                                                                            <asp:DropDownList
                                                                                                ID="ddlTrade"
                                                                                                runat="server"
                                                                                                class="form-select">
                                                                                            </asp:DropDownList>
                                                                                        </div>
                                                                                        <asp:RequiredFieldValidator
                                                                                            ID="RequiredFieldValidator9"
                                                                                            runat="server"
                                                                                            ControlToValidate="ddlTrade"
                                                                                            ErrorMessage="* Pls Select Trade"
                                                                                            ForeColor="#CC0000"
                                                                                            InitialValue="Select"
                                                                                            Display="Dynamic">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                            </div>

                                                                            <%-- Row 5: Skill Category & Basic Wage --%>
                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <asp:UpdatePanel ID="UpdatePanel2"
                                                                                        runat="server">
                                                                                        <ContentTemplate>
                                                                                            <label class="form-label"
                                                                                                for="ddlSkill">Skill
                                                                                                Category <span
                                                                                                    class="text-danger">*</span></label>
                                                                                            <div class="input-group">
                                                                                                <span
                                                                                                    class="input-group-text"><i
                                                                                                        class="fa fa-award"></i></span>
                                                                                                <asp:DropDownList
                                                                                                    ID="ddlSkill"
                                                                                                    runat="server"
                                                                                                    class="form-select"
                                                                                                    AutoPostBack="True"
                                                                                                    OnSelectedIndexChanged="ddlSkill_SelectedIndexChanged">
                                                                                                </asp:DropDownList>
                                                                                            </div>
                                                                                            <asp:RequiredFieldValidator
                                                                                                ID="RequiredFieldValidator22"
                                                                                                runat="server"
                                                                                                ControlToValidate="ddlSkill"
                                                                                                ErrorMessage="* Pls Select Skill"
                                                                                                ForeColor="#CC0000"
                                                                                                InitialValue="Select"
                                                                                                Display="Dynamic">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <asp:UpdatePanel ID="UpdatePanel4"
                                                                                        runat="server">
                                                                                        <ContentTemplate>
                                                                                            <label class="form-label"
                                                                                                for="txtBasic">Basic
                                                                                                Wage <span
                                                                                                    class="text-danger">*</span></label>
                                                                                            <div class="input-group">
                                                                                                <span
                                                                                                    class="input-group-text"><i
                                                                                                        class="fa fa-money-bill-wave"></i></span>
                                                                                                <asp:TextBox
                                                                                                    ID="txtBasic"
                                                                                                    runat="server"
                                                                                                    class="form-control"
                                                                                                    ReadOnly="false"
                                                                                                    placeholder="Basic">
                                                                                                </asp:TextBox>
                                                                                            </div>
                                                                                            <asp:RequiredFieldValidator
                                                                                                ID="RequiredFieldValidator31"
                                                                                                runat="server"
                                                                                                ControlToValidate="txtBasic"
                                                                                                ErrorMessage="* Pls Enter Basic "
                                                                                                ForeColor="#CC0000"
                                                                                                Display="Dynamic">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>
                                                                                </div>
                                                        </div>

                                                        <%--========================================================SECTION
                                                            2: PERSONAL
                                                            INFORMATION========================================================--%>
                                                            <!-- <div class="form-section-header mt-4">
                                        <i class="fa fa-user text-primary me-2"></i>Personal Information
                                    </div> -->

                                                            <div class="row form-three-column-row">
                                                                <%-- Row 1: Emp Name & Father/Husband Name --%>
                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                        <label class="form-label"
                                                                            for="txtEmpName">Employee Name <span
                                                                                class="text-danger">*</span></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-text"><i
                                                                                    class="fa fa-user"></i></span>
                                                                            <asp:TextBox ID="txtEmpName" runat="server"
                                                                                class="form-control"></asp:TextBox>
                                                                        </div>
                                                                        <asp:RequiredFieldValidator
                                                                            ID="RequiredFieldValidator2" runat="server"
                                                                            ControlToValidate="txtEmpName"
                                                                            ErrorMessage="* Pls Enter Emp Name"
                                                                            ForeColor="#CC3300" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                        <label class="form-label"
                                                                            for="txtFatherHusband">Father / Husband Name
                                                                            <span class="text-danger">*</span></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-text"><i
                                                                                    class="fa fa-user-friends"></i></span>
                                                                            <asp:TextBox ID="txtFatherHusband"
                                                                                runat="server" class="form-control">
                                                                            </asp:TextBox>
                                                                        </div>
                                                                        <asp:RequiredFieldValidator
                                                                            ID="RequiredFieldValidator11" runat="server"
                                                                            ControlToValidate="txtFatherHusband"
                                                                            ErrorMessage="* Pls Enter Father/Husband Name"
                                                                            ForeColor="#CC3300" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <%-- Row 2: DOB & Gender --%>
                                                                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                            <label class="form-label" for="txtDOB">Date
                                                                                of Birth (DOB) <span
                                                                                    class="text-danger">*</span></label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-text"><i
                                                                                        class="fa fa-calendar-alt"></i></span>
                                                                                <asp:TextBox ID="txtDOB" runat="server"
                                                                                    class="form-control"></asp:TextBox>
                                                                            </div>
                                                                            <asp:Label ID="lblDobError" runat="server"
                                                                                Text="" ForeColor="#CC0000"></asp:Label>
                                                                            <asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator12"
                                                                                runat="server"
                                                                                ControlToValidate="txtDOB"
                                                                                ErrorMessage="* Pls Enter Date"
                                                                                ForeColor="#CC3300" Display="Dynamic">
                                                                            </asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator
                                                                                ID="RegularExpressionValidator4"
                                                                                runat="server"
                                                                                ErrorMessage="Pls Enter Valid Date"
                                                                                ControlToValidate="txtDOB"
                                                                                ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$"
                                                                                ForeColor="#CC0000" Display="Dynamic">
                                                                            </asp:RegularExpressionValidator>
                                                                        </div>

                                                                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                            <label class="form-label"
                                                                                for="ddlGender">Gender <span
                                                                                    class="text-danger">*</span></label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-text"><i
                                                                                        class="fa fa-venus-mars"></i></span>
                                                                                <asp:DropDownList ID="ddlGender"
                                                                                    runat="server" class="form-select">
                                                                                    <asp:ListItem Value="Select">Select
                                                                                    </asp:ListItem>
                                                                                    <asp:ListItem Value="Male">Male
                                                                                    </asp:ListItem>
                                                                                    <asp:ListItem Value="Female">Female
                                                                                    </asp:ListItem>
                                                                                    <asp:ListItem Value="Trans">Trans
                                                                                    </asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                            <asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator13"
                                                                                runat="server"
                                                                                ControlToValidate="ddlGender"
                                                                                ErrorMessage="* Pls Select Gender"
                                                                                ForeColor="#CC0000"
                                                                                InitialValue="Select" Display="Dynamic">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <%-- Row 3: Caste & Blood Group --%>
                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="ddlCast">Caste <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-users"></i></span>
                                                                                    <asp:DropDownList ID="ddlCast"
                                                                                        runat="server"
                                                                                        class="form-select">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator14"
                                                                                    runat="server"
                                                                                    ControlToValidate="ddlCast"
                                                                                    ErrorMessage="* Pls Select Cast"
                                                                                    ForeColor="#CC0000"
                                                                                    InitialValue="Select"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                            </div>

                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="ddlBloodGrp">Blood Group <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-tint"></i></span>
                                                                                    <asp:DropDownList ID="ddlBloodGrp"
                                                                                        runat="server"
                                                                                        class="form-select">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator15"
                                                                                    runat="server"
                                                                                    ControlToValidate="ddlBloodGrp"
                                                                                    ErrorMessage="* Pls Select Blood Group"
                                                                                    ForeColor="#CC0000"
                                                                                    InitialValue="Select"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                            </div>

                                                                            <%-- Row 4: Nationality & Aadhar No. --%>
                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="txtNationality">Nationality
                                                                                        <span
                                                                                            class="text-danger">*</span></label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-flag"></i></span>
                                                                                        <asp:TextBox ID="txtNationality"
                                                                                            runat="server"
                                                                                            class="form-control"
                                                                                            MaxLength="50">
                                                                                        </asp:TextBox>
                                                                                    </div>
                                                                                    <asp:RequiredFieldValidator
                                                                                        ID="RequiredFieldValidator16"
                                                                                        runat="server"
                                                                                        ControlToValidate="txtNationality"
                                                                                        ErrorMessage="* Pls Enter Nationality"
                                                                                        ForeColor="#CC3300"
                                                                                        Display="Dynamic">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="txtAadharNo">Aadhar No.
                                                                                        <span
                                                                                            class="text-danger">*</span></label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-id-card"></i></span>
                                                                                        <asp:TextBox ID="txtAadharNo"
                                                                                            runat="server"
                                                                                            class="form-control"
                                                                                            MaxLength="12">
                                                                                        </asp:TextBox>
                                                                                    </div>
                                                                                    <asp:RequiredFieldValidator
                                                                                        ID="RequiredFieldValidator17"
                                                                                        runat="server"
                                                                                        ControlToValidate="txtAadharNo"
                                                                                        ErrorMessage="* Pls Enter Aadhar No"
                                                                                        ForeColor="#CC3300"
                                                                                        Display="Dynamic">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>

                                                                                <%-- Row 5: Education & Any Critical
                                                                                    Disease --%>
                                                                                    

                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <asp:UpdatePanel
                                                                                            ID="UpdatePanel3"
                                                                                            runat="server">
                                                                                            <ContentTemplate>
                                                                                                <label
                                                                                                    class="form-label">Any
                                                                                                    Critical
                                                                                                    Disease?</label>
                                                                                                <div
                                                                                                    class="d-flex align-items-center mb-1">
                                                                                                    <asp:RadioButton
                                                                                                        ID="RadioButton1"
                                                                                                        runat="server"
                                                                                                        Text=" Yes"
                                                                                                        AutoPostBack="true"
                                                                                                        GroupName="ACD"
                                                                                                        CssClass="me-4"
                                                                                                        OnCheckedChanged="RadioButton1_CheckedChanged" />
                                                                                                    <asp:RadioButton
                                                                                                        ID="RadioButton2"
                                                                                                        runat="server"
                                                                                                        Text=" No"
                                                                                                        AutoPostBack="true"
                                                                                                        GroupName="ACD"
                                                                                                        Checked="true"
                                                                                                        OnCheckedChanged="RadioButton2_CheckedChanged" />
                                                                                                </div>
                                                                                                <div
                                                                                                    class="input-group mt-1">
                                                                                                    <span
                                                                                                        class="input-group-text"><i
                                                                                                            class="fa fa-notes-medical"></i></span>
                                                                                                    <asp:TextBox
                                                                                                        ID="txtDiseaseName"
                                                                                                        runat="server"
                                                                                                        placeholder="Disease Name"
                                                                                                        class="form-control"
                                                                                                        ReadOnly="True">
                                                                                                    </asp:TextBox>
                                                                                                </div>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                    </div>
                                                            </div>

                                                            <%--========================================================SECTION
                                                                3: CONTACT & ADDRESS
                                                                INFORMATION========================================================--%>
                                                                <!-- <div class="form-section-header mt-4">
                                                                    <i
                                                                        class="fa fa-map-marker-alt text-primary me-2"></i>Contact
                                                                    &amp; Address Information
                                                                </div> -->

                                                                <div class="row form-three-column-row">
                                                                    <%-- Row 1: Permanent Address & Local Address --%>
                                                                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                            <label class="form-label"
                                                                                for="txtAddress">Permanent Address <span
                                                                                    class="text-danger">*</span></label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-text"><i
                                                                                        class="fa fa-home"></i></span>
                                                                                <asp:TextBox ID="txtAddress"
                                                                                    runat="server" class="form-control"
                                                                                    MaxLength="100"></asp:TextBox>
                                                                            </div>
                                                                            <asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator6"
                                                                                runat="server"
                                                                                ControlToValidate="txtAddress"
                                                                                ErrorMessage="* Pls Enter Address"
                                                                                ForeColor="#CC3300" Display="Dynamic">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                            <label class="form-label"
                                                                                for="txtLocalAddress">Local Address
                                                                                <span
                                                                                    class="text-danger">*</span></label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-text"><i
                                                                                        class="fa fa-map-pin"></i></span>
                                                                                <asp:TextBox ID="txtLocalAddress"
                                                                                    runat="server" class="form-control"
                                                                                    MaxLength="100"></asp:TextBox>
                                                                            </div>
                                                                            <asp:RequiredFieldValidator
                                                                                ID="RequiredFieldValidator33"
                                                                                runat="server"
                                                                                ControlToValidate="txtLocalAddress"
                                                                                ErrorMessage="* Pls Enter Address"
                                                                                ForeColor="#CC3300" Display="Dynamic">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <%-- Row 2: City & State --%>
                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="txtCity">City <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-city"></i></span>
                                                                                    <asp:TextBox ID="txtCity"
                                                                                        runat="server"
                                                                                        class="form-control">
                                                                                    </asp:TextBox>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator7"
                                                                                    runat="server"
                                                                                    ControlToValidate="txtCity"
                                                                                    ErrorMessage="* Pls Enter City"
                                                                                    ForeColor="#CC3300"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                            </div>

                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="ddlState">State <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-map"></i></span>
                                                                                    <asp:DropDownList ID="ddlState"
                                                                                        runat="server"
                                                                                        class="form-select"
                                                                                        placeholder="State">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator8"
                                                                                    runat="server"
                                                                                    ControlToValidate="ddlState"
                                                                                    ErrorMessage="* Pls Select State"
                                                                                    InitialValue="Select"
                                                                                    ForeColor="#CC3300"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                            </div>

                                                                            <%-- Row 3: Contact No. 1 & Contact No. 2
                                                                                --%>
                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="txtPhNo1">Contact No. 1
                                                                                        <span
                                                                                            class="text-danger">*</span></label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-phone"></i></span>
                                                                                        <asp:TextBox ID="txtPhNo1"
                                                                                            runat="server"
                                                                                            class="form-control"
                                                                                            MaxLength="10">
                                                                                        </asp:TextBox>
                                                                                    </div>
                                                                                    <asp:RequiredFieldValidator
                                                                                        ID="RequiredFieldValidator10"
                                                                                        runat="server"
                                                                                        ControlToValidate="txtPhNo1"
                                                                                        ErrorMessage="* Pls Enter contact No."
                                                                                        ForeColor="#CC3300"
                                                                                        Display="Dynamic">
                                                                                    </asp:RequiredFieldValidator>
                                                                                    <asp:RegularExpressionValidator
                                                                                        ID="RegularExpressionValidator2"
                                                                                        runat="server"
                                                                                        ErrorMessage="Enter Valid Mob No."
                                                                                        ControlToValidate="txtPhNo1"
                                                                                        Display="Dynamic"
                                                                                        ForeColor="#CC0000"
                                                                                        ValidationExpression="\+?\d[\d -]{8,12}\d">
                                                                                    </asp:RegularExpressionValidator>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="txtPhNo2">Contact No.
                                                                                        2</label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-phone-alt"></i></span>
                                                                                        <asp:TextBox ID="txtPhNo2"
                                                                                            runat="server"
                                                                                            class="form-control"
                                                                                            MaxLength="10">
                                                                                        </asp:TextBox>
                                                                                    </div>
                                                                                    <asp:RegularExpressionValidator
                                                                                        ID="RegularExpressionValidator3"
                                                                                        runat="server"
                                                                                        ErrorMessage="Enter Valid Mob No."
                                                                                        ControlToValidate="txtPhNo2"
                                                                                        Display="Dynamic"
                                                                                        ForeColor="#CC0000"
                                                                                        ValidationExpression="\+?\d[\d -]{8,12}\d">
                                                                                    </asp:RegularExpressionValidator>
                                                                                </div>

                                                                                <%-- Row 4: E-Mail & Domicile State --%>
                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <label class="form-label"
                                                                                            for="txtEMail">E-Mail</label>
                                                                                        <div class="input-group">
                                                                                            <span
                                                                                                class="input-group-text"><i
                                                                                                    class="fa fa-envelope"></i></span>
                                                                                            <asp:TextBox ID="txtEMail"
                                                                                                runat="server"
                                                                                                class="form-control"
                                                                                                MaxLength="50">
                                                                                            </asp:TextBox>
                                                                                        </div>
                                                                                        <asp:RegularExpressionValidator
                                                                                            ID="RegularExpressionValidator1"
                                                                                            runat="server"
                                                                                            ErrorMessage="Enter Valid Mail"
                                                                                            ControlToValidate="txtEMail"
                                                                                            Display="Dynamic"
                                                                                            ForeColor="#CC0000"
                                                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                                                        </asp:RegularExpressionValidator>
                                                                                    </div>

                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <label class="form-label"
                                                                                            for="ddlDomState">Domicile
                                                                                            State <span
                                                                                                class="text-danger">*</span></label>
                                                                                        <div class="input-group">
                                                                                            <span
                                                                                                class="input-group-text"><i
                                                                                                    class="fa fa-landmark"></i></span>
                                                                                            <asp:DropDownList
                                                                                                ID="ddlDomState"
                                                                                                runat="server"
                                                                                                class="form-select">
                                                                                            </asp:DropDownList>
                                                                                        </div>
                                                                                        <asp:RequiredFieldValidator
                                                                                            ID="RequiredFieldValidator34"
                                                                                            runat="server"
                                                                                            ControlToValidate="ddlDomState"
                                                                                            ErrorMessage="* Pls Select Domicile state"
                                                                                            InitialValue="Select"
                                                                                            ForeColor="#CC3300"
                                                                                            Display="Dynamic">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>

                                                                                    <%-- Row 5: Emergency Contact Person
                                                                                        & Emergency Contact No. --%>
                                                                                        <div
                                                                                            class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                            <label class="form-label"
                                                                                                for="txtContactPerson">Emergency
                                                                                                Contact Person <span
                                                                                                    class="text-danger">*</span></label>
                                                                                            <div class="input-group">
                                                                                                <span
                                                                                                    class="input-group-text"><i
                                                                                                        class="fa fa-user-shield"></i></span>
                                                                                                <asp:TextBox
                                                                                                    ID="txtContactPerson"
                                                                                                    runat="server"
                                                                                                    class="form-control"
                                                                                                    placeholder="Contact person name in case of emergency"
                                                                                                    MaxLength="50">
                                                                                                </asp:TextBox>
                                                                                            </div>
                                                                                            <asp:RequiredFieldValidator
                                                                                                ID="RequiredFieldValidator28"
                                                                                                runat="server"
                                                                                                ControlToValidate="txtContactPerson"
                                                                                                ErrorMessage="* Pls Enter Contract Person"
                                                                                                ForeColor="#CC3300"
                                                                                                Display="Dynamic">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </div>

                                                                                        <div
                                                                                            class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                            <label class="form-label"
                                                                                                for="txtContactNo">Emergency
                                                                                                Contact No. <span
                                                                                                    class="text-danger">*</span></label>
                                                                                            <div class="input-group">
                                                                                                <span
                                                                                                    class="input-group-text"><i
                                                                                                        class="fa fa-phone-square-alt"></i></span>
                                                                                                <asp:TextBox
                                                                                                    ID="txtContactNo"
                                                                                                    runat="server"
                                                                                                    class="form-control"
                                                                                                    placeholder="Contact No."
                                                                                                    MaxLength="10">
                                                                                                </asp:TextBox>
                                                                                            </div>
                                                                                            <asp:RequiredFieldValidator
                                                                                                ID="RequiredFieldValidator29"
                                                                                                runat="server"
                                                                                                ControlToValidate="txtContactNo"
                                                                                                ErrorMessage="* Pls Enter Contract Number"
                                                                                                ForeColor="#CC3300"
                                                                                                Display="Dynamic">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </div>
                                                                </div>

                                                                <%--========================================================SECTION
                                                                    4: BANK & STATUTORY (PF / ESIC)
                                                                    DETAILS========================================================--%>
                                                                    <!-- <div class="form-section-header mt-4">
                                        <i class="fa fa-university text-primary me-2"></i>Bank &amp; Statutory (PF / ESIC) Details
                                    </div> -->

                                                                    <div class="row form-three-column-row">
                                                                        <%-- Row 1: Bank Name & Account No. --%>
                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="ddlBankName">Bank Name <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-university"></i></span>
                                                                                    <asp:DropDownList ID="ddlBankName"
                                                                                        runat="server"
                                                                                        class="form-select">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator25"
                                                                                    runat="server"
                                                                                    ControlToValidate="ddlBankName"
                                                                                    ErrorMessage="* Pls Select Bank Name"
                                                                                    InitialValue="Select"
                                                                                    ForeColor="#CC3300"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                            </div>

                                                                            <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                <label class="form-label"
                                                                                    for="txtAccountNo">Account No. <span
                                                                                        class="text-danger">*</span></label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-text"><i
                                                                                            class="fa fa-money-check"></i></span>
                                                                                    <asp:TextBox ID="txtAccountNo"
                                                                                        runat="server"
                                                                                        class="form-control"
                                                                                        MaxLength="20"></asp:TextBox>
                                                                                </div>
                                                                                <asp:RequiredFieldValidator
                                                                                    ID="RequiredFieldValidator26"
                                                                                    runat="server"
                                                                                    ControlToValidate="txtAccountNo"
                                                                                    ErrorMessage="* Pls Enter Account Number"
                                                                                    ForeColor="#CC3300"
                                                                                    Display="Dynamic">
                                                                                </asp:RequiredFieldValidator>
                                                                            </div>

                                                                            <%-- Row 2: IFS Code & (Empty column for
                                                                                balance) --%>
                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="txtIFSC">IFS Code <span
                                                                                            class="text-danger">*</span></label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-barcode"></i></span>
                                                                                        <asp:TextBox ID="txtIFSC"
                                                                                            runat="server"
                                                                                            class="form-control"
                                                                                            MaxLength="12">
                                                                                        </asp:TextBox>
                                                                                    </div>
                                                                                    <asp:RequiredFieldValidator
                                                                                        ID="RequiredFieldValidator27"
                                                                                        runat="server"
                                                                                        ControlToValidate="txtIFSC"
                                                                                        ErrorMessage="* Pls Enter IFSC Number"
                                                                                        ForeColor="#CC3300"
                                                                                        Display="Dynamic">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>

                                                                                

                                                                                <%-- Row 3: UAN No. Registration & ESIC
                                                                                    Registration --%>
                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <asp:UpdatePanel
                                                                                            ID="UpdatePanel1"
                                                                                            runat="server">
                                                                                            <ContentTemplate>
                                                                                                <label
                                                                                                    class="form-label"
                                                                                                    for="PFRadioButtonList1">UAN
                                                                                                    No. Registration
                                                                                                    <span
                                                                                                        class="text-danger">*</span></label>
                                                                                                <div class="mb-2">
                                                                                                    <asp:RadioButtonList
                                                                                                        ID="PFRadioButtonList1"
                                                                                                        runat="server"
                                                                                                        RepeatDirection="Horizontal"
                                                                                                        AutoPostBack="True"
                                                                                                        OnSelectedIndexChanged="PFRadioButtonList1_SelectedIndexChanged"
                                                                                                        CssClass="d-inline-flex gap-3">
                                                                                                        <asp:ListItem
                                                                                                            Value="Y">
                                                                                                            Yes
                                                                                                        </asp:ListItem>
                                                                                                        <asp:ListItem
                                                                                                            Value="N">No
                                                                                                        </asp:ListItem>
                                                                                                    </asp:RadioButtonList>
                                                                                                    <asp:RequiredFieldValidator
                                                                                                        ID="RequiredFieldValidator19"
                                                                                                        runat="server"
                                                                                                        ControlToValidate="PFRadioButtonList1"
                                                                                                        ErrorMessage="* Select Radio Button"
                                                                                                        ForeColor="#CC3300"
                                                                                                        Display="Dynamic">
                                                                                                    </asp:RequiredFieldValidator>
                                                                                                </div>
                                                                                                <asp:Panel ID="pnlUAN" runat="server" CssClass="input-group mb-2">
                                                                                                    <span
                                                                                                        class="input-group-text"><i
                                                                                                            class="fa fa-id-badge"></i></span>
                                                                                                    <asp:TextBox
                                                                                                        ID="txtPFNO"
                                                                                                        runat="server"
                                                                                                        class="form-control"
                                                                                                        placeholder="UAN Number">
                                                                                                    </asp:TextBox>
                                                                                                </asp:Panel>
                                                                                                <asp:Panel ID="pnlPFUpload" runat="server">
                                                                                                    <asp:FileUpload
                                                                                                    ID="PFileUpload"
                                                                                                    runat="server"
                                                                                                    CssClass="form-control">
                                                                                                </asp:FileUpload>
                                                                                                <asp:Label
                                                                                                    ID="lblPFfileSizeMsg"
                                                                                                    ForeColor="Red"
                                                                                                    runat="server"
                                                                                                    Text="PDF File size should not be more than 100 KB"
                                                                                                    CssClass="small d-block mt-1">
                                                                                                </asp:Label>
                                                                                                </asp:Panel>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                    </div>

                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <asp:UpdatePanel
                                                                                            ID="UpdatePanel7"
                                                                                            runat="server">
                                                                                            <ContentTemplate>
                                                                                                <label
                                                                                                    class="form-label"
                                                                                                    for="ESICRadioButtonList1">ESIC
                                                                                                    Registration <span
                                                                                                        class="text-danger">*</span></label>
                                                                                                <div class="mb-2">
                                                                                                    <asp:RadioButtonList
                                                                                                        ID="ESICRadioButtonList1"
                                                                                                        runat="server"
                                                                                                        RepeatDirection="Horizontal"
                                                                                                        AutoPostBack="True"
                                                                                                        OnSelectedIndexChanged="ESICRadioButtonList1_SelectedIndexChanged"
                                                                                                        CssClass="d-inline-flex gap-3">
                                                                                                        <asp:ListItem
                                                                                                            Value="Y">
                                                                                                            Yes
                                                                                                        </asp:ListItem>
                                                                                                        <asp:ListItem
                                                                                                            Value="N">No
                                                                                                        </asp:ListItem>
                                                                                                    </asp:RadioButtonList>
                                                                                                    <asp:RequiredFieldValidator
                                                                                                        ID="RequiredFieldValidator20"
                                                                                                        runat="server"
                                                                                                        ControlToValidate="ESICRadioButtonList1"
                                                                                                        ErrorMessage="* Select Radio Button"
                                                                                                        ForeColor="#CC3300"
                                                                                                        Display="Dynamic">
                                                                                                    </asp:RequiredFieldValidator>
                                                                                                </div>
                                                                                                <asp:Panel ID="pnlESIC" runat="server" CssClass="input-group mb-2">
                                                                                                    <span
                                                                                                        class="input-group-text"><i
                                                                                                            class="fa fa-heartbeat"></i></span>
                                                                                                    <asp:TextBox
                                                                                                        ID="txtESIC"
                                                                                                        runat="server"
                                                                                                        class="form-control"
                                                                                                        placeholder="ESIC Number">
                                                                                                    </asp:TextBox>
                                                                                                </asp:Panel>
                                                                                                <asp:Panel ID="pnlESICUpload" runat="server">
                                                                                                    <asp:FileUpload
                                                                                                    ID="ESICFileUpload"
                                                                                                    runat="server"
                                                                                                    CssClass="form-control">
                                                                                                </asp:FileUpload>
                                                                                                <asp:Label
                                                                                                    ID="lblEsicfileSizeMsg"
                                                                                                    ForeColor="Red"
                                                                                                    runat="server"
                                                                                                    Text="PDF File size should not be more than 100 KB"
                                                                                                    CssClass="small d-block mt-1">
                                                                                                </asp:Label>
                                                                                                </asp:Panel>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                    </div>
                                                                    </div>

                                                                    <%--========================================================SECTION
                                                                        5: VERIFICATIONS & DOCUMENT
                                                                        UPLOADS========================================================--%>
                                                                        <!-- <div class="form-section-header mt-4">
                                                                            <i
                                                                                class="fa fa-file-upload text-primary me-2"></i>Verifications
                                                                            &amp; Document Uploads
                                                                        </div> -->

                                                                        <div class="row form-three-column-row">
                                                                            <%-- Row 1: Police Verification Doc & Police
                                                                                Verification Expiry Date --%>
                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="PVFileUpload">Police
                                                                                        Verification Certificate (PDF)
                                                                                        <span
                                                                                            class="text-danger">*</span></label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-shield-alt"></i></span>
                                                                                        <asp:FileUpload
                                                                                            ID="PVFileUpload"
                                                                                            runat="server"
                                                                                            CssClass="form-control">
                                                                                        </asp:FileUpload>
                                                                                    </div>
                                                                                    <span class="text-danger small">PDF
                                                                                        File size should not be more
                                                                                        than 100 KB</span>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                    <label class="form-label"
                                                                                        for="txtPVD">Police Verification
                                                                                        Expiry Date <span
                                                                                            class="text-danger">*</span></label>
                                                                                    <div class="input-group">
                                                                                        <span
                                                                                            class="input-group-text"><i
                                                                                                class="fa fa-calendar-check"></i></span>
                                                                                        <asp:TextBox ID="txtPVD"
                                                                                            runat="server"
                                                                                            class="form-control"
                                                                                            TextMode="DateTime">
                                                                                        </asp:TextBox>
                                                                                    </div>
                                                                                    <asp:RequiredFieldValidator
                                                                                        ID="RequiredFieldValidator23"
                                                                                        runat="server"
                                                                                        ControlToValidate="txtPVD"
                                                                                        ErrorMessage="* Pls Enter Date"
                                                                                        ForeColor="#CC3300"
                                                                                        Display="Dynamic">
                                                                                    </asp:RequiredFieldValidator>
                                                                                    <asp:RegularExpressionValidator
                                                                                        ID="RegularExpressionValidator5"
                                                                                        runat="server"
                                                                                        ErrorMessage="Pls Enter Valid Date"
                                                                                        ControlToValidate="txtPVD"
                                                                                        ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$"
                                                                                        ForeColor="#CC0000"
                                                                                        Display="Dynamic">
                                                                                    </asp:RegularExpressionValidator>
                                                                                </div>

                                                                                <%-- Row 2: Medical Examination Doc &
                                                                                    Medical Certificate Expiry Date --%>
                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <label class="form-label"
                                                                                            for="MVFileUpload">Medical
                                                                                            Examination Certificate
                                                                                            (PDF) <span
                                                                                                class="text-danger">*</span></label>
                                                                                        <div class="input-group">
                                                                                            <span
                                                                                                class="input-group-text"><i
                                                                                                    class="fa fa-file-medical"></i></span>
                                                                                            <asp:FileUpload
                                                                                                ID="MVFileUpload"
                                                                                                runat="server"
                                                                                                CssClass="form-control">
                                                                                            </asp:FileUpload>
                                                                                        </div>
                                                                                        <span
                                                                                            class="text-danger small">PDF
                                                                                            File size should not be more
                                                                                            than 100 KB</span>
                                                                                    </div>

                                                                                    <div class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                        <label class="form-label"
                                                                                            for="txtMCID">Medical
                                                                                            Certificate Expiry Date
                                                                                            <span
                                                                                                class="text-danger">*</span></label>
                                                                                        <div class="input-group">
                                                                                            <span
                                                                                                class="input-group-text"><i
                                                                                                    class="fa fa-calendar-day"></i></span>
                                                                                            <asp:TextBox ID="txtMCID"
                                                                                                runat="server"
                                                                                                class="form-control">
                                                                                            </asp:TextBox>
                                                                                        </div>
                                                                                        <asp:RequiredFieldValidator
                                                                                            ID="RequiredFieldValidator24"
                                                                                            runat="server"
                                                                                            ControlToValidate="txtMCID"
                                                                                            ErrorMessage="* Pls Enter Date"
                                                                                            ForeColor="#CC3300"
                                                                                            Display="Dynamic">
                                                                                        </asp:RequiredFieldValidator>
                                                                                        <asp:RegularExpressionValidator
                                                                                            ID="RegularExpressionValidator6"
                                                                                            runat="server"
                                                                                            ErrorMessage="Pls Enter Valid Date"
                                                                                            ControlToValidate="txtMCID"
                                                                                            ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$"
                                                                                            ForeColor="#CC0000"
                                                                                            Display="Dynamic">
                                                                                        </asp:RegularExpressionValidator>
                                                                                    </div>

                                                                                    <%-- Row 3: Domicile Certificate &
                                                                                        Age Certificate --%>
                                                                                        <div
                                                                                            class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                            <label class="form-label"
                                                                                                for="DomFileUpload">Domicile
                                                                                                Certificate
                                                                                                (PDF)</label>
                                                                                            <div class="input-group">
                                                                                                <span
                                                                                                    class="input-group-text"><i
                                                                                                        class="fa fa-file-pdf"></i></span>
                                                                                                <asp:FileUpload
                                                                                                    ID="DomFileUpload"
                                                                                                    runat="server"
                                                                                                    CssClass="form-control">
                                                                                                </asp:FileUpload>
                                                                                            </div>
                                                                                            <span
                                                                                                class="text-danger small">PDF
                                                                                                File size should not be
                                                                                                more than 100 KB</span>
                                                                                        </div>

                                                                                        <div
                                                                                            class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                            <label class="form-label"
                                                                                                for="AgeCertFileUpload">Age
                                                                                                Certificate
                                                                                                (PDF)</label>
                                                                                            <div class="input-group">
                                                                                                <span
                                                                                                    class="input-group-text"><i
                                                                                                        class="fa fa-id-badge"></i></span>
                                                                                                <asp:FileUpload
                                                                                                    ID="AgeCertFileUpload"
                                                                                                    runat="server"
                                                                                                    CssClass="form-control">
                                                                                                </asp:FileUpload>
                                                                                            </div>
                                                                                            <span
                                                                                                class="text-danger small">PDF
                                                                                                File size should not be
                                                                                                more than 100 KB</span>
                                                                                        </div>

                                                                                        <%-- Row 4: Education
                                                                                            Certificate & Employee Photo
                                                                                            --%>
                                                                                            <div
                                                                                                class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                                <label
                                                                                                    class="form-label"
                                                                                                    for="EduCertUpload">Education
                                                                                                    Certificate
                                                                                                    (PDF)</label>
                                                                                                <div
                                                                                                    class="input-group">
                                                                                                    <span
                                                                                                        class="input-group-text"><i
                                                                                                            class="fa fa-graduation-cap"></i></span>
                                                                                                    <asp:FileUpload
                                                                                                        ID="EduCertUpload"
                                                                                                        runat="server"
                                                                                                        CssClass="form-control">
                                                                                                    </asp:FileUpload>
                                                                                                </div>
                                                                                                <span
                                                                                                    class="text-danger small">PDF
                                                                                                    File size should not
                                                                                                    be more than 100
                                                                                                    KB</span>
                                                                                            </div>

                                                                                            <div
                                                                                                class="col-lg-4 col-md-4 col-12 mb-3">
                                                                                                <label
                                                                                                    class="form-label"
                                                                                                    for="FileUpload1">Employee
                                                                                                    Photo <span
                                                                                                        class="text-danger">*</span></label>
                                                                                                <div
                                                                                                    class="d-flex align-items-center gap-3">
                                                                                                    <div
                                                                                                        class="flex-grow-1">
                                                                                                        <div
                                                                                                            class="input-group">
                                                                                                            <span
                                                                                                                class="input-group-text"><i
                                                                                                                    class="fa fa-camera"></i></span>
                                                                                                            <asp:FileUpload
                                                                                                                ID="FileUpload1"
                                                                                                                runat="server"
                                                                                                                CssClass="form-control"
                                                                                                                onchange="document.getElementById('imgEmp').src=window.URL.createObjectURL(this.files[0])">
                                                                                                            </asp:FileUpload>
                                                                                                        </div>
                                                                                                        <span
                                                                                                            class="text-danger small">Image
                                                                                                            size should
                                                                                                            not be more
                                                                                                            than 20
                                                                                                            KB</span>
                                                                                                    </div>
                                                                                                    <div
                                                                                                        class="flex-shrink-0">
                                                                                                        <asp:Image
                                                                                                            ID="imgEmp"
                                                                                                            runat="server"
                                                                                                            BackColor="#99CCFF"
                                                                                                            Width="90"
                                                                                                            Height="100"
                                                                                                            CssClass="rounded border shadow-sm">
                                                                                                        </asp:Image>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                        </div>

                                                                        <%--========================================================SECTION
                                                                            6: ACTION
                                                                            BUTTONS========================================================--%>
                                                                            <hr class="my-4 border-2" />
                                                                            <div class="row">
                                                                                <div class="col-12 text-center py-3">
                                                                                    <asp:Button ID="cmdSave"
                                                                                        runat="server" Text="Save"
                                                                                        class="btn btn-round-action btn-action-save me-3"
                                                                                        OnClick="cmdSave_Click">
                                                                                    </asp:Button>
                                                                                    <asp:Button ID="cmdCancel"
                                                                                        runat="server"
                                                                                        Text="Cancel/Clear"
                                                                                        class="btn btn-round-action btn-action-cancel"
                                                                                        OnClick="cmdCancel_Click">
                                                                                    </asp:Button>
                                                                                </div>
                                                                            </div>
                                        </div>
                                    </div>

                                    <%-- Extra bottom spacer to ensure fixed footer clearance --%>
                                        <div class="card-bottom-spacer"></div>

                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <footer class="py-3 bg-dark mt-auto navbar-fixed-bottom">
                                <div class="container-fluid">
                                    <div class="text-center small">
                                        <div class="text-light ">&copy; 2022 | Electro Solutions | All Rights Reserved
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
        <script type="text/javascript">
            function checkEmpCodeDuplicate() {
                var empCodeInput = document.getElementById('<%= txtEmpCode.ClientID %>');
                if (!empCodeInput) return;
                var empCode = empCodeInput.value.trim();
                if (empCode.length > 0) {
                    $.ajax({
                        type: "POST",
                        url: "emp_onboarding.aspx/CheckDuplicateEmpCode",
                        data: JSON.stringify({ empCode: empCode }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var lblError = document.getElementById('<%= lblMSGError.ClientID %>');
                            if (response.d === true) {
                                if (lblError) {
                                    lblError.innerText = "Duplicate Employee";
                                }
                                empCodeInput.classList.add("is-invalid");
                            } else {
                                if (lblError && lblError.innerText === "Duplicate Employee") {
                                    lblError.innerText = "";
                                }
                                empCodeInput.classList.remove("is-invalid");
                            }
                        },
                        error: function () {
                        }
                    });
                }
            }

            $(document).ready(function () {
                var empCodeElem = document.getElementById('<%= txtEmpCode.ClientID %>');
                if (empCodeElem) {
                    empCodeElem.addEventListener('blur', checkEmpCodeDuplicate);
                    empCodeElem.addEventListener('change', checkEmpCodeDuplicate);
                }
            });
        </script>

                <%--<script type="text/jscript">
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
--%>
        </form>
    </body>

    </html>