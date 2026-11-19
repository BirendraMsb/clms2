<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="work-order-entry.aspx.cs"
    Inherits="clms2.contractor_cell.work_order_entry1" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta content="Electro Solutions | Breaking Stereotypes" name="description" />
        <meta content="Electro Solutions | Breaking Stereotypes" name="author" />

        <%-- <link href="../public/common/css/bootswatchTheme.css" rel="stylesheet" />--%>
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

            /* Mail Button - Modern Cyan / Teal Gradient */
            .btn-action-mail {
                background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%) !important;
                color: #ffffff !important;
                border-color: #0891b2 !important;
                box-shadow: 0 4px 14px rgba(6, 182, 212, 0.32) !important;
            }

            .btn-action-mail:hover {
                background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%) !important;
                box-shadow: 0 6px 20px rgba(6, 182, 212, 0.48) !important;
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
                margin-bottom: 100px !important;
                margin-block-end: 100px !important;
            }

            .card-entry-header {
                background: linear-gradient(135deg, #090e1a 0%, #0f172a 45%, #1e293b 100%) !important;
                color: #ffffff;
                padding: 1.25rem 1.75rem;
                border-top-left-radius: 1rem !important;
                border-top-right-radius: 1rem !important;
                border-bottom: 2px solid transparent;
                border-image: linear-gradient(90deg, #38bdf8 0%, #3b82f6 50%, #6366f1 100%) 1;
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
           TWO-COLUMN GRID & SPACING
           ========================================== */
            .card-entry {
                margin-left: auto !important;
                margin-right: auto !important;
                margin-bottom: 140px !important;
                margin-block-end: 140px !important;
                width: 100% !important;
            }

            .card-entry-header {
                padding-left: 50px !important;
                padding-right: 50px !important;
            }

            .card-entry-body {
                padding-left: 50px !important;
                padding-right: 50px !important;
                padding-bottom: 120px !important;
                padding-top: 1.5rem !important;
            }

            .form-two-column-row {
                margin-left: 0 !important;
                margin-right: 0 !important;
            }

            @media (min-width: 768px) {
                .form-two-column-row > [class*="col-"]:nth-child(odd) {
                    padding-left: 0 !important;
                    padding-right: 35px !important;
                }

                .form-two-column-row > [class*="col-"]:nth-child(even) {
                    padding-left: 35px !important;
                    padding-right: 0 !important;
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

                .form-two-column-row > [class*="col-"] {
                    padding-left: 0 !important;
                    padding-right: 0 !important;
                }
            }
        
        
        
        
        
        /* Date Pill Single Line Guarantee */
        #lblDate,
        span[id$="lblDate"],
        .navbar #lblDate {
            white-space: nowrap !important;
            min-width: 140px !important;
            width: auto !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            flex-shrink: 0 !important;
            text-align: center !important;
            padding: 6px 16px !important;
        }

        .navbar .d-flex {
            display: flex !important;
            align-items: center !important;
            flex-wrap: nowrap !important;
            white-space: nowrap !important;
            margin-left: auto !important;
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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="loading">
                <div class="loader"></div>
            </div>
            <%--==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==--%>
                <%--==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==--%>
                    <table class="table">
                        <tr>
                            <td>
                                <nav class="navbar fixed-top navbar-expand-lg  navbar-dark bg-dark" style="background-color: #000000 !important; background: #000000 !important;">
                        <div class="container-fluid" style="background: transparent !important; background-color: transparent !important;">
                                        <%-- <a class="navbar-brand" href="#">clms</a>--%>
                                            <div class="navbar-brand w-40">
                                                <a class="navbar-brand" href="dashboard.aspx">
                                                    <span>
                                                        <img src="../public/common/images/ElectroSolHeader3.png"
                                                            class="logo-lg logo-light"
                                                            alt="Electro Solutions | Breaking Stereotypes Logo"
                                                            width="188" height="50" />
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
                                                            aria-expanded="false">Work Order <span
                                                                class="fa fa-angle-down ms-1"></span></a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item" href="work-order-entry.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>New Work Order
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="work-order-detail-Rej.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Rejected Work
                                                                    order
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="work-order-details-all.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>View work
                                                                    order
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="work-order-detail.aspx?vl=awo">
                                                                    <i class="fa fa-angle-right me-1"></i>Pending Work
                                                                    Order
                                                                </a>
                                                            </li>

                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Employee <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../contractor_cell/purposed-emp-detail-approval.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Emp Approval
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../contractor_cell/purposed-emp-detail-block.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Emp Blocking
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Attendance <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../contractor_cell/attendance-approval.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Attendance
                                                                    Approval
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Compliances <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item" href="tot_workorder_comp.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Total Work
                                                                    Order Compliance
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../contractor_cell/purposed-wages-doc-approval.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Wages Document
                                                                    Approval
                                                                </a>
                                                            </li>

                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Statutory <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../contractor_cell/register-of-contractor.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>From XII
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../contractor_cell/annual-return.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Form XXV
                                                                </a>
                                                            </li>


                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Employee Offboarding <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="fnf_request_approval.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Pending Full
                                                                    and Final Request
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="fnf_request_approved.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Approved Full
                                                                    and Final Request
                                                                </a>
                                                            </li>

                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Report <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">
                                                            <li>
                                                                <a class="dropdown-item" href="wages-doc-report.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Compliance
                                                                    Report
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="emp-details-report.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Employee
                                                                    Details
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="attendance-report.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Attendance
                                                                    Details
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="emp_chart_report.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Employee Chart
                                                                </a>
                                                            </li>

                                                            <li>
                                                                <a class="dropdown-item" href="emp_bar_chart.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Employee Bar
                                                                    Chart
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="vendor_chart.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Vendor Chart
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="vendor_bar_chart.aspx">
                                                                    <i class="fa fa-angle-right me-1"></i>Vendor Bar
                                                                    Chart
                                                                </a>
                                                            </li>

                                                        </ul>
                                                    </li>
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Mail <span
                                                                class="fa fa-angle-down ms-1"></span>
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
                                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin"
                                                            data-bs-toggle="dropdown" role="button" aria-haspopup="true"
                                                            aria-expanded="false">Admin <span
                                                                class="fa fa-angle-down ms-1"></span>
                                                        </a>
                                                        <ul class="dropdown-menu ">

                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="../login/new-password.aspx">
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
                                                            <a class="nav-link dropdown-toggle"
                                                                data-bs-toggle="dropdown" href="#" role="button"
                                                                aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Action</a>
                                                                <a class="dropdown-item" href="#">Another action</a>
                                                                <a class="dropdown-item" href="#">Something else
                                                                    here</a>
                                                                <div class="dropdown-divider"></div>
                                                                <a class="dropdown-item" href="#">Separated link</a>
                                                            </div>
                                                            </li>--%>
                                                </ul>
                                                <div class="d-flex align-items-center flex-nowrap ms-auto" style="white-space: nowrap;">
                                                    <asp:Label ID="lblDate" runat="server" class="form-control bg-dark" Text="Date" Style="color: #ffffff !important; font-size: 15px; width: auto; min-width: 140px; font-weight: 600; white-space: nowrap !important; text-align: center; display: inline-flex !important; align-items: center !important; justify-content: center !important; flex-shrink: 0 !important; padding: 6px 16px !important;"></asp:Label>
                                                    </asp:Label>
                                                    &nbsp;&nbsp;
                                                    <img src="../images/k2.png" alt="Department" width="50"
                                                        height="50" />&nbsp;&nbsp;
                                                    <asp:Label ID="lblUser" runat="server" Text=""
                                                        Style="color: #FFFFCC; font-size: 15px"></asp:Label>&nbsp;&nbsp;
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
                                                <div class="d-flex align-items-center gap-2">
                                                    <i class="fa fa-file-contract text-info fs-5"></i>
                                                    <span class="fs-5 fw-bold mb-0">Vendors Work Order Entry</span>
                                                </div>
                                                <span
                                                    class="badge bg-primary rounded-pill px-3 py-2 fw-semibold">Contractor
                                                    Cell</span>
                                            </div>
                                            <div class="card-body card-entry-body">
                                                <asp:TextBox ID="txtID" runat="server" Visible="false"
                                                    class="form-control"></asp:TextBox>
                                                <asp:TextBox ID="txtID1" runat="server" Visible="false"
                                                    class="form-control"></asp:TextBox>

                                                <div class="row mb-3">
                                                    <div class="col-12">
                                                        <asp:Label ID="lblMsgError" runat="server" Text=""
                                                            Font-Size="Larger" ForeColor="Red" Font-Bold="True">
                                                        </asp:Label>
                                                        <asp:Label ID="lblMsg" runat="server" Text="" Font-Size="Larger"
                                                            ForeColor="blue" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="lblMsgMail" runat="server" Text=""
                                                            Font-Size="Larger" ForeColor="blue" Font-Bold="True">
                                                        </asp:Label>
                                                    </div>
                                                </div>

                                                <!-- SECTION 1: WORK ORDER INFORMATION -->
                                                <div class="form-section-header mt-2">
                                                    <i class="fa fa-info-circle text-primary"></i> Work Order
                                                    Information
                                                </div>
                                                <div class="row form-two-column-row">
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Work Order No. <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-file-invoice text-primary"></i></span>
                                                            <asp:TextBox ID="txtWONo" runat="server"
                                                                class="form-control" MaxLength="20"
                                                                placeholder="e.g. 100254"
                                                                oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                                                            </asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                            runat="server" ControlToValidate="txtWONo"
                                                            ErrorMessage="* Pls Enter Work Order No."
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator
                                                            ID="RegularExpressionValidator10" runat="server"
                                                            ControlToValidate="txtWONo"
                                                            ErrorMessage="* Only numbers allowed"
                                                            ValidationExpression="^[0-9]+$" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Work Order Value <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-money-bill-wave text-success"></i></span>
                                                            <asp:TextBox ID="txtWorkOrderValue" runat="server"
                                                                class="form-control" MaxLength="20" placeholder="0.00"
                                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                            </asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20"
                                                            runat="server" ControlToValidate="txtWorkOrderValue"
                                                            ErrorMessage="* Pls Enter Work Order Value"
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator
                                                            ID="RegularExpressionValidator11" runat="server"
                                                            ControlToValidate="txtWorkOrderValue"
                                                            ErrorMessage="* Only numbers allowed"
                                                            ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$"
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                            <ContentTemplate>
                                                                <div
                                                                    class="d-flex justify-content-between align-items-center mb-1">
                                                                    <label class="form-label mb-0">BOCW Liability <span
                                                                            class="text-danger">*</span></label>
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="form-check form-check-inline mb-0">
                                                                            <asp:RadioButton ID="rbBocwY" runat="server"
                                                                                Text="Y" AutoPostBack="true"
                                                                                GroupName="bocw"
                                                                                OnCheckedChanged="rbBocwY_CheckedChanged" />
                                                                        </div>
                                                                        <div class="form-check form-check-inline mb-0">
                                                                            <asp:RadioButton ID="rbBocwN" runat="server"
                                                                                Text="N" Checked="true"
                                                                                AutoPostBack="true" GroupName="bocw"
                                                                                OnCheckedChanged="rbBocwN_CheckedChanged" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i
                                                                            class="fa fa-calculator text-warning"></i></span>
                                                                    <asp:TextBox ID="txtBocwLibility" runat="server"
                                                                        ReadOnly="true" class="form-control bg-light"
                                                                        placeholder="Calculated BOCW Liability">
                                                                    </asp:TextBox>
                                                                </div>
                                                                <asp:RequiredFieldValidator ID="ReqBocwLiability"
                                                                    runat="server" Enabled="false"
                                                                    ControlToValidate="txtBocwLibility"
                                                                    ErrorMessage="* Pls Enter Work Order Value"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block">
                                                                </asp:RequiredFieldValidator>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Vendor Code <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-id-badge text-primary"></i></span>
                                                            <asp:TextBox ID="txtVendorRegNo" runat="server"
                                                                class="form-control" MaxLength="20"
                                                                placeholder="e.g. 50012"
                                                                oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                                                            </asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                            runat="server" ControlToValidate="txtVendorRegNo"
                                                            ErrorMessage="* Pls Enter Vendor Reg. No."
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator
                                                            ID="RegularExpressionValidator12" runat="server"
                                                            ControlToValidate="txtVendorRegNo"
                                                            ErrorMessage="* Only numbers allowed"
                                                            ValidationExpression="^[0-9]+$" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Act Covered <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-balance-scale text-primary"></i></span>
                                                            <asp:DropDownList ID="ddlActCovered" runat="server"
                                                                class="form-select">
                                                                <asp:ListItem Value="1">Shops And Establishment
                                                                </asp:ListItem>
                                                                <asp:ListItem Value="2">Factory</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16"
                                                            runat="server" ControlToValidate="ddlActCovered"
                                                            ErrorMessage="* Pls Select the Act" InitialValue="Select"
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Nature Of Work <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-briefcase text-primary"></i></span>
                                                            <asp:DropDownList ID="txtNatureofWork" class="form-select"
                                                                runat="server"></asp:DropDownList>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11"
                                                            runat="server" ControlToValidate="txtNatureofWork"
                                                            ErrorMessage="* Pls Select Nauture of work"
                                                            ForeColor="#dc3545" InitialValue="Select" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Valid From <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-calendar-alt text-primary"></i></span>
                                                            <asp:TextBox ID="txtValidFrom" runat="server"
                                                                class="form-control" placeholder="DD-MM-YYYY">
                                                            </asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                            runat="server" ControlToValidate="txtValidFrom"
                                                            ErrorMessage="* Pls Enter Date" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                                            runat="server" ErrorMessage="Pls Enter Valid Date"
                                                            ControlToValidate="txtValidFrom"
                                                            ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$"
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Valid To <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-calendar-check text-primary"></i></span>
                                                            <asp:TextBox ID="txtValidTo" runat="server"
                                                                class="form-control" placeholder="DD-MM-YYYY">
                                                            </asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                            runat="server" ControlToValidate="txtValidTo"
                                                            ErrorMessage="* Pls Enter Date" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                                            runat="server" ErrorMessage="Pls Enter Valid Date"
                                                            ControlToValidate="txtValidTo"
                                                            ValidationExpression="^(?:[012]?[0-9]|3[01])[./-](?:0?[1-9]|1[0-2])[./-](?:[0-9]{2}){1,2}$"
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Type Of Contract <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-handshake text-primary"></i></span>
                                                            <asp:DropDownList ID="txtTypeofContract" class="form-select"
                                                                runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="txtTypeofContract_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12"
                                                            runat="server" ControlToValidate="txtTypeofContract"
                                                            ErrorMessage="* Pls Select type of contract"
                                                            ForeColor="#dc3545" InitialValue="Select" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Work Description <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-align-left text-primary"></i></span>
                                                            <asp:TextBox ID="txtDescription" runat="server"
                                                                class="form-control" MaxLength="50"
                                                                placeholder="Enter Work Description"></asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                                            runat="server" ControlToValidate="txtDescription"
                                                            ErrorMessage="* Pls Enter Work Description"
                                                            ForeColor="#dc3545" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <!-- SECTION 2: MANPOWER REQUIREMENTS -->
                                                <!-- <div class="form-section-header mt-4">
                                        <i class="fa fa-users text-primary"></i> Manpower Deployment Requirements
                                    </div> -->
                                                <div class="row form-two-column-row">
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                            <ContentTemplate>
                                                                <label class="form-label">UN-Skilled <span
                                                                        class="text-danger">*</span></label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i
                                                                            class="fa fa-user text-secondary"></i></span>
                                                                    <asp:TextBox ID="txtUnskilled" runat="server"
                                                                        Visible="true"
                                                                        class="form-control bg-light fw-semibold text-center"
                                                                        MaxLength="4" AutoPostBack="True"
                                                                        ReadOnly="true"
                                                                        OnTextChanged="txtUnskilled_TextChanged">
                                                                    </asp:TextBox>
                                                                </div>
                                                                <asp:RequiredFieldValidator ID="ReqUnskilled"
                                                                    runat="server" ControlToValidate="txtUnskilled"
                                                                    Enabled="false"
                                                                    ErrorMessage="* Pls Enter No of Employee"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator
                                                                    ID="RegularExpressionValidator6"
                                                                    ControlToValidate="txtUnskilled" runat="server"
                                                                    ErrorMessage="Only Numbers Allowed"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block"
                                                                    ValidationExpression="\d+">
                                                                </asp:RegularExpressionValidator>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                            <ContentTemplate>
                                                                <label class="form-label">Semi-Skilled <span
                                                                        class="text-danger">*</span></label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i
                                                                            class="fa fa-user-cog text-info"></i></span>
                                                                    <asp:TextBox ID="txtSemiSkilled" runat="server"
                                                                        Visible="true"
                                                                        class="form-control bg-light fw-semibold text-center"
                                                                        MaxLength="4" AutoPostBack="True"
                                                                        ReadOnly="true"
                                                                        OnTextChanged="txtSemiSkilled_TextChanged">
                                                                    </asp:TextBox>
                                                                </div>
                                                                <asp:RequiredFieldValidator ID="ReqSemiSkilled"
                                                                    runat="server" ControlToValidate="txtSemiSkilled"
                                                                    Enabled="false"
                                                                    ErrorMessage="* Pls Enter No of Employee"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator
                                                                    ID="RegularExpressionValidator7"
                                                                    ControlToValidate="txtSemiSkilled" runat="server"
                                                                    ErrorMessage="Only Numbers Allowed"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block"
                                                                    ValidationExpression="\d+">
                                                                </asp:RegularExpressionValidator>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                            <ContentTemplate>
                                                                <label class="form-label">Skilled <span
                                                                        class="text-danger">*</span></label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i
                                                                            class="fa fa-user-check text-primary"></i></span>
                                                                    <asp:TextBox ID="txtSkilled" runat="server"
                                                                        Visible="true"
                                                                        class="form-control bg-light fw-semibold text-center"
                                                                        MaxLength="4" AutoPostBack="True"
                                                                        ReadOnly="true"
                                                                        OnTextChanged="txtSkilled_TextChanged">
                                                                    </asp:TextBox>
                                                                </div>
                                                                <asp:RequiredFieldValidator ID="ReqSkilled"
                                                                    runat="server" ControlToValidate="txtSkilled"
                                                                    Enabled="false"
                                                                    ErrorMessage="* Pls Enter No of Employee"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator
                                                                    ID="RegularExpressionValidator8"
                                                                    ControlToValidate="txtSkilled" runat="server"
                                                                    ErrorMessage="Only Numbers Allowed"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block"
                                                                    ValidationExpression="\d+">
                                                                </asp:RegularExpressionValidator>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                            <ContentTemplate>
                                                                <label class="form-label">High Skilled <span
                                                                        class="text-danger">*</span></label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text"><i
                                                                            class="fa fa-user-graduate text-success"></i></span>
                                                                    <asp:TextBox ID="txtHighSkilled" runat="server"
                                                                        Visible="true"
                                                                        class="form-control bg-light fw-semibold text-center"
                                                                        MaxLength="4" AutoPostBack="True"
                                                                        ReadOnly="true"
                                                                        OnTextChanged="txtHighSkilled_TextChanged">
                                                                    </asp:TextBox>
                                                                </div>
                                                                <asp:RequiredFieldValidator ID="ReqHighSkilled"
                                                                    runat="server" ControlToValidate="txtHighSkilled"
                                                                    Enabled="false"
                                                                    ErrorMessage="* Pls Enter No of Employee"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator
                                                                    ID="RegularExpressionValidator9"
                                                                    ControlToValidate="txtHighSkilled" runat="server"
                                                                    ErrorMessage="Only Numbers Allowed"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block"
                                                                    ValidationExpression="\d+">
                                                                </asp:RegularExpressionValidator>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                            <ContentTemplate>
                                                                <label class="form-label">Total Employee <span
                                                                        class="text-danger">*</span></label>
                                                                <div class="input-group">
                                                                    <span
                                                                        class="input-group-text bg-primary text-white"><i
                                                                            class="fa fa-users"></i></span>
                                                                    <asp:TextBox ID="txtNoEmp" runat="server"
                                                                        Visible="true" ReadOnly="false"
                                                                        class="form-control fw-bold text-center border-primary"
                                                                        MaxLength="4"></asp:TextBox>
                                                                </div>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                                                    runat="server" ControlToValidate="txtNoEmp"
                                                                    ErrorMessage="* Pls Enter No of Employee"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator
                                                                    ID="RegularExpressionValidator5"
                                                                    ControlToValidate="txtNoEmp" runat="server"
                                                                    ErrorMessage="Only Numbers Allowed"
                                                                    ForeColor="#dc3545" Display="Dynamic"
                                                                    CssClass="text-danger small mt-1 d-block"
                                                                    ValidationExpression="\d+">
                                                                </asp:RegularExpressionValidator>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <!-- SECTION 3: DEPARTMENT & JOB LOCATION -->
                                                <!-- <div class="form-section-header mt-4">
                                                    <i class="fa fa-building text-primary"></i> Department & Location
                                                </div> -->
                                                <div class="row form-two-column-row">
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Department <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-sitemap text-primary"></i></span>
                                                            <asp:DropDownList ID="txtDepartment" class="form-select"
                                                                runat="server"></asp:DropDownList>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13"
                                                            runat="server" ControlToValidate="txtDepartment"
                                                            ErrorMessage="* Pls Select Department" ForeColor="#dc3545"
                                                            InitialValue="Select" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Job Location <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-map-marked-alt text-primary"></i></span>
                                                            <asp:DropDownList ID="txtJobLocation" class="form-select"
                                                                runat="server"></asp:DropDownList>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14"
                                                            runat="server" ControlToValidate="txtJobLocation"
                                                            ErrorMessage="* Pls Select Job Location" ForeColor="#dc3545"
                                                            InitialValue="Select" Display="Dynamic"
                                                            CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <!-- SECTION 4: VENDOR & OWNER INFORMATION -->
                                                <!-- <div class="form-section-header mt-4">
                                                    <i class="fa fa-address-card text-primary"></i> Vendor & Owner
                                                    Information
                                                </div> -->
                                                <div class="row form-two-column-row">
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Vendor Name <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-industry text-primary"></i></span>
                                                            <asp:TextBox ID="txtVendorName" runat="server"
                                                                class="form-control" MaxLength="50"
                                                                placeholder="Vendor / Company Name"></asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                                            runat="server" ControlToValidate="txtVendorName"
                                                            ErrorMessage="* Pls Enter Vendeor Name" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Owner Name <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-user-tie text-primary"></i></span>
                                                            <asp:TextBox ID="txtOwnerName" runat="server"
                                                                class="form-control" MaxLength="50"
                                                                placeholder="Owner Full Name"></asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                                            runat="server" ControlToValidate="txtOwnerName"
                                                            ErrorMessage="* Pls Enter Owner Name" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Owner Address <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-map-pin text-primary"></i></span>
                                                            <asp:TextBox ID="txtOwnerAddress" runat="server"
                                                                class="form-control" MaxLength="50"
                                                                placeholder="Owner Address"></asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21"
                                                            runat="server" ControlToValidate="txtOwnerAddress"
                                                            ErrorMessage="* Pls Enter Owner Address" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">E-Mail <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-envelope text-primary"></i></span>
                                                            <asp:TextBox ID="txtEmail" runat="server"
                                                                class="form-control" MaxLength="50"
                                                                placeholder="vendor@example.com"></asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                                            runat="server" ControlToValidate="txtEmail"
                                                            ErrorMessage="* Pls Enter Email" ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                                            runat="server" ErrorMessage="Enter Valid Mail"
                                                            ControlToValidate="txtEmail" Display="Dynamic"
                                                            ForeColor="#dc3545"
                                                            CssClass="text-danger small mt-1 d-block"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-3">
                                                        <label class="form-label">Contact No. <span
                                                                class="text-danger">*</span></label>
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-phone text-primary"></i></span>
                                                            <asp:TextBox ID="txtPhNo" runat="server"
                                                                class="form-control" MaxLength="13"
                                                                placeholder="+91 9876543210"></asp:TextBox>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                                            runat="server" ControlToValidate="txtPhNo"
                                                            ErrorMessage="* Pls Enter contact No." ForeColor="#dc3545"
                                                            Display="Dynamic" CssClass="text-danger small mt-1 d-block">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                                            runat="server" ErrorMessage="Enter Valid Mob No."
                                                            ControlToValidate="txtPhNo" Display="Dynamic"
                                                            ForeColor="#dc3545"
                                                            CssClass="text-danger small mt-1 d-block"
                                                            ValidationExpression="\+?\d[\d -]{8,12}\d">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <!-- SECTION 5: ACTION BUTTONS -->
                                                <div class="row mt-4 pt-3 pb-4 mb-3 border-top">
                                                    <div class="col-md-12 d-flex flex-wrap gap-3 align-items-center">
                                                        <asp:Button ID="cmdSave" runat="server" Text="Save Work Order"
                                                            class="btn btn-primary rounded-pill btn-round-action btn-action-save"
                                                            OnClick="cmdSave_Click"></asp:Button>
                                                        <asp:Button ID="BtnMail" runat="server" Text="Send Mail"
                                                            class="btn btn-info rounded-pill btn-round-action btn-action-mail"
                                                            OnClick="BtnMail_Click"></asp:Button>
                                                        <asp:Button ID="cmdCancel" runat="server" Text="Cancel / Clear"
                                                            class="btn btn-outline-secondary rounded-pill btn-round-action btn-action-cancel"
                                                            OnClick="cmdCancel_Click"></asp:Button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-bottom-spacer"></div>
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
                                                &copy; 2022 | Electro Solutions | All Rights Reserved <%--<div
                                                    class="text-light d-none d-sm-inline-block float-end">
                                                    <a href="https://shitij.in">Kshitij Info Solutions</a>
                                            </div>--%>
                                        </div>
                                    </div>
                                </footer>
                            </td>
                        </tr>
                    </table>
                    <%--==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==11==--%>
                        <%-- <div class="alert alert-success animated fadeInUp">
                            Logged out Successfully </div>--%>
                            <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
                            <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js"></script>
                            <script type="text/jscript" src="../public/newfront/assets/js/bootstrap.bundle.min.js?v=2.5"></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js?v=3.1"></script>
                            <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js"></script>
                            <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
                            
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
        <%-- <script type="text/jscript">
            $(window).on("load", function () {
            $('#GvWod').DataTable({ responsive: true });
            });
            </script>--%>
    </body>

    </html>