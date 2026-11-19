<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="work-order-details-all.aspx.cs" Inherits="clms2.contractor_cell.work_order_details_all" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>CLMS | Contractor's Cell | Dashboard</title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
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
    <%-- <link rel="stylesheet" href="../public/common/css/commoncss.min.css?v=3.1" />--%>
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

        /* ==========================================
           RESPONSIVE GRIDVIEW & DATATABLES STYLING
           ========================================== */
        body {
            padding-bottom: 90px;
        }

        .card {
            border-radius: 0.75rem !important;
            overflow: hidden;
            border: 1px solid #e2e8f0 !important;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -2px rgba(0, 0, 0, 0.05) !important;
            background: #ffffff;
        }

        .card-heading {
            background: linear-gradient(135deg, #090e1a 0%, #0f172a 45%, #1e293b 100%) !important;
            color: #ffffff !important;
            padding: 1rem 1.25rem !important;
            font-weight: 600 !important;
            font-size: 1rem !important;
            letter-spacing: 0.3px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .table-responsive {
            border: none !important;
            overflow-x: auto !important;
            -webkit-overflow-scrolling: touch !important;
        }

        #GvWod {
            width: 100% !important;
            margin-bottom: 0 !important;
            border-collapse: collapse !important;
        }

        #GvWod thead th {
            background-color: #f1f5f9 !important;
            color: #1e293b !important;
            font-weight: 700 !important;
            font-size: 0.85rem !important;
            text-transform: uppercase !important;
            letter-spacing: 0.03em !important;
            border-bottom: 2px solid #cbd5e1 !important;
            padding: 0.65rem 0.75rem !important;
            vertical-align: middle !important;
        }

        #GvWod tbody td {
            font-size: 0.875rem !important;
            padding: 0.65rem 0.75rem !important;
            vertical-align: middle !important;
            border-color: #e2e8f0 !important;
        }

        /* DataTables Controls */
        .dataTables_wrapper {
            position: relative !important;
            padding: 0.5rem 0 !important;
        }

        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 0.75rem;
        }

        .dataTables_wrapper .dataTables_filter input {
            border: 1px solid #cbd5e1 !important;
            border-radius: 50px !important;
            padding: 0.35rem 0.85rem !important;
            font-size: 0.85rem !important;
            outline: none !important;
            transition: all 0.2s ease;
        }

        .dataTables_wrapper .dataTables_filter input:focus {
            border-color: #3b82f6 !important;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15) !important;
        }

        .dataTables_wrapper .dataTables_length select {
            border: 1px solid #cbd5e1 !important;
            border-radius: 0.35rem !important;
            padding: 0.3rem 0.5rem !important;
            font-size: 0.85rem !important;
        }

        /* Page Number Panel - Shifted 250px left of center (below 'Type of Contract' column) */
        .dataTables_wrapper .dataTables_paginate {
            float: none !important;
            text-align: center !important;
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            flex-wrap: wrap !important;
            margin: 1rem auto 0.5rem auto !important;
            padding: 0.5rem 0 !important;
            width: 100% !important;
            clear: both !important;
            position: relative !important;
            transform: translateX(-250px) !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            border-radius: 50px !important;
            padding: 0.35rem 0.85rem !important;
            font-size: 0.85rem !important;
            font-weight: 500 !important;
            margin: 0 3px !important;
            cursor: pointer !important;
            border: 1px solid #cbd5e1 !important;
            background: #ffffff !important;
            color: #334155 !important;
            transition: all 0.2s ease !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            min-width: 32px !important;
            height: 32px !important;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05) !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button:hover:not(.current):not(.disabled) {
            background: #e2e8f0 !important;
            color: #0f172a !important;
            border-color: #94a3b8 !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current,
        .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
            background: #2563eb !important;
            color: #ffffff !important;
            border-color: #2563eb !important;
            font-weight: 600 !important;
            box-shadow: 0 2px 4px rgba(37, 99, 235, 0.35) !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
        .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover {
            color: #94a3b8 !important;
            border-color: #e2e8f0 !important;
            background: #f8fafc !important;
            cursor: not-allowed !important;
            opacity: 0.7 !important;
            box-shadow: none !important;
        }

        /* DataTables Info Text */
        .dataTables_wrapper .dataTables_info {
            font-size: 0.85rem !important;
            color: #64748b !important;
        }

        @media (min-width: 992px) {
            .dataTables_wrapper .dataTables_info {
                position: absolute !important;
                bottom: 0.75rem !important;
                right: 15px !important;
                left: auto !important;
                margin: 0 !important;
                padding: 0 !important;
                line-height: 2rem !important;
                text-align: right !important;
            }
        }

        @media (max-width: 991.98px) {
            .dataTables_wrapper .dataTables_info {
                position: static !important;
                float: none !important;
                text-align: center !important;
                margin: 0.75rem auto 0.25rem auto !important;
            }
        }

        /* Responsive override for mobile screens (<= 768px) */
        @media (max-width: 768px) {
            .dataTables_wrapper .dataTables_paginate {
                transform: none !important;
                margin: 0.5rem auto !important;
            }
        }

        /* ASP.NET GridView Native Pager Centering & Shift */
        .GridPager,
        .GridPager td,
        tr.GridPager,
        tr.GridPager td,
        #GvWod tr.GridPager,
        #GvWod tr.GridPager td,
        #GvWod tr:last-child td[colspan] {
            text-align: center !important;
            vertical-align: middle !important;
            padding: 0.75rem !important;
            background-color: #f8fafc !important;
        }

        .GridPager table,
        tr.GridPager table,
        #GvWod tr.GridPager table,
        #GvWod tr:last-child td[colspan] table {
            margin: 0 auto !important;
            text-align: center !important;
            display: inline-table !important;
            position: relative !important;
            transform: translateX(-250px) !important;
        }

        @media (max-width: 768px) {
            .GridPager table,
            tr.GridPager table,
            #GvWod tr.GridPager table,
            #GvWod tr:last-child td[colspan] table {
                transform: none !important;
            }
        }

        .GridPager table td,
        tr.GridPager table td,
        #GvWod tr.GridPager table td {
            padding: 0 4px !important;
            border: none !important;
            background: transparent !important;
        }

        .GridPager table td a,
        .GridPager table td span,
        #GvWod tr.GridPager table td a,
        #GvWod tr.GridPager table td span {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            min-width: 32px !important;
            height: 32px !important;
            padding: 0.35rem 0.75rem !important;
            border-radius: 50px !important;
            border: 1px solid #cbd5e1 !important;
            background-color: #ffffff !important;
            color: #334155 !important;
            text-decoration: none !important;
            font-weight: 500 !important;
            font-size: 0.85rem !important;
            transition: all 0.2s ease !important;
        }

        .GridPager table td span,
        #GvWod tr.GridPager table td span {
            background-color: #2563eb !important;
            color: #ffffff !important;
            border-color: #2563eb !important;
            font-weight: 600 !important;
            box-shadow: 0 2px 4px rgba(37, 99, 235, 0.35) !important;
        }

        .GridPager table td a:hover,
        #GvWod tr.GridPager table td a:hover {
            background-color: #e2e8f0 !important;
            color: #0f172a !important;
            border-color: #94a3b8 !important;
        }

        /* Mobile specific enhancements */
        @media (max-width: 768px) {
            .container-fluid {
                padding-left: 0.5rem !important;
                padding-right: 0.5rem !important;
            }

            .card-body {
                padding: 0.5rem !important;
            }

            .card-heading {
                font-size: 0.9rem !important;
                padding: 0.75rem 1rem !important;
            }

            #GvWod {
                font-size: 0.8rem !important;
            }

            #GvWod th, #GvWod td {
                padding: 0.45rem 0.5rem !important;
            }

            .dataTables_wrapper .dataTables_length,
            .dataTables_wrapper .dataTables_filter {
                float: none !important;
                text-align: left !important;
                width: 100% !important;
                margin-bottom: 0.5rem !important;
            }

            .dataTables_wrapper .dataTables_filter input {
                width: 100% !important;
                margin-left: 0 !important;
                display: block !important;
                margin-top: 0.25rem !important;
            }

            .dataTables_wrapper .dataTables_info,
            .dataTables_wrapper .dataTables_paginate {
                float: none !important;
                text-align: center !important;
                margin-top: 0.5rem !important;
            }

            /* DataTables Child Accordion Details on Mobile */
            table.dataTable>tbody>tr.child {
                background-color: #f8fafc !important;
            }

            table.dataTable>tbody>tr.child ul.dtr-details {
                display: block !important;
                width: 100% !important;
                padding: 0.5rem !important;
                margin: 0 !important;
                list-style: none !important;
            }

            table.dataTable>tbody>tr.child ul.dtr-details>li {
                display: flex !important;
                justify-content: space-between !important;
                align-items: center !important;
                padding: 0.4rem 0 !important;
                border-bottom: 1px solid #e2e8f0 !important;
                font-size: 0.82rem !important;
            }

            table.dataTable>tbody>tr.child ul.dtr-details>li:last-child {
                border-bottom: none !important;
            }

            table.dataTable>tbody>tr.child span.dtr-title {
                font-weight: 600 !important;
                color: #475569 !important;
                font-size: 0.8rem !important;
                text-transform: uppercase !important;
                letter-spacing: 0.03em !important;
                min-width: 120px !important;
            }

            table.dataTable>tbody>tr.child span.dtr-data {
                font-weight: 500 !important;
                color: #0f172a !important;
                text-align: right !important;
                word-break: break-word !important;
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
        <%--<div class="loading">
            <div class="loader"></div>
        </div>--%>
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar fixed-top navbar-expand-lg  navbar-dark bg-dark" style="background-color: #000000 !important; background: #000000 !important;">
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Work Order <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="work-order-entry.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>New Work Order
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="work-order-detail-Rej.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Rejected Work order
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarEmployee" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee <span class="fa fa-angle-down ms-1"></span>
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAttendance" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Attendance <span class="fa fa-angle-down ms-1"></span>
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
                                                <a class="dropdown-item" href="tot_workorder_comp.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Total Work Order Compliance
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/purposed-wages-doc-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Wages Document Approval
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
                                                <a class="dropdown-item" href="wages-doc-report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Compliance Report
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="emp-details-report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Details
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="attendance-report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Attendance Details
                                                </a>
                                            </li>
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
                                <div class="d-flex align-items-center flex-nowrap ms-auto" style="white-space: nowrap;">
                                    <asp:Label ID="lblDate" runat="server" class="form-control bg-dark" Text="Date" Style="color: #ffffff !important; font-size: 15px; width: auto; min-width: 140px; font-weight: 600; white-space: nowrap !important; text-align: center; display: inline-flex !important; align-items: center !important; justify-content: center !important; flex-shrink: 0 !important; padding: 6px 16px !important;"></asp:Label>
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
                                <br />
                                <br />
                                
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">
                                        <span>Work Order Detail ( Approved )</span>
                                        <%--<span><a href="work-order-entry.aspx" class="text-white">Add New</a></span>--%>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <p style="text-align: center">
                                                <%-- <asp:Label ID="lblSearch" runat="server" Text="Work Order No"></asp:Label>
                                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                                <asp:Button ID="btnSearch" class="btn btn-info rounded-pill" runat="server" Text="Search" /><br />--%>
                                            </p>
                                            <asp:GridView ID="GvWod" runat="server" AutoGenerateColumns="False"
                                                ClientIDMode="Static"
                                                GridLines="None" AllowPaging="false" DataKeyNames="id"
                                                CssClass="table table-striped table-bordered table-hover dt-responsive nowrap w-100"
                                                ShowHeaderWhenEmpty="true" OnRowDataBound="GvWod_RowDataBound">
                                                <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />

                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl. No">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--  <asp:BoundField DataField="work_worder" HeaderText="Work order No" SortExpression="work_worder">
                                                        <ItemStyle Width="250" />
                                                    </asp:BoundField>--%>

                                                  <%--  <asp:HyperLinkField DataTextField="work_worder" DataNavigateUrlFields="vendor_reg_code"
                                                        DataNavigateUrlFormatString="vendor-detail.aspx?Id={0}"
                                                        HeaderText="Work order No" ItemStyle-Wrap="false" />--%>
                                                    <asp:BoundField DataField="vendor_reg_code" HeaderText="Vendor Code" SortExpression="vendor_reg_code"></asp:BoundField>
                                                    <asp:BoundField DataField="valid_from" HeaderText="Valid From" SortExpression="valid_from">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="valid_to" HeaderText="Valid To" ControlStyle-ForeColor="#ffffff" SortExpression="valid_from" />


                                                    <asp:BoundField DataField="vendor_name" HeaderText="Vendor Name" SortExpression="vendor_name"></asp:BoundField>

                                                    <%-- <asp:BoundField DataField="nature_of_work" HeaderText="Nature Of Work" SortExpression="nature_of_work"></asp:BoundField>--%>
                                                    <%-- <asp:BoundField DataField="work_description" HeaderText="Work Description" SortExpression="work_description"></asp:BoundField>--%>
                                                    <asp:BoundField DataField="type_of_contract" HeaderText="Type Of Contract" SortExpression="type_of_contract"></asp:BoundField>
                                                    <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department"></asp:BoundField>

                                                    <asp:BoundField DataField="pano" HeaderText="PAN No." SortExpression="pano"></asp:BoundField>
                                                    <asp:BoundField DataField="gstno" HeaderText="GST No." SortExpression="gstno"></asp:BoundField>
                                                    <asp:BoundField DataField="pfno" HeaderText="UAN No." SortExpression="pfno"></asp:BoundField>
                                                    <asp:BoundField DataField="esicno" HeaderText="ESIC No." SortExpression="esicno"></asp:BoundField>

                                                    <%--<asp:BoundField DataField="pfdoc" HeaderText="UAN Doc" SortExpression="pfdoc"></asp:BoundField>--%>
                                                    <%-- <asp:BoundField DataField="esicdoc" HeaderText="ESIC Doc" SortExpression="esicdoc"></asp:BoundField>--%>

                                                    <asp:BoundField DataField="job_location" HeaderText="Job Location" SortExpression="job_location"></asp:BoundField>
                                                    <%--<asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"></asp:BoundField>--%>
                                                </Columns>
                                            </asp:GridView>
                                            <%--   <label style="background-color: orange; width: 100px; height: 20px; text-align: center; float: right">Peding</label>
                                            <label style="background-color: lightblue; width: 100px; height: 20px; text-align: center; float: right">Confirm</label>--%>
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

        <script type="text/javascript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/javascript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/bootstrap.bundle.min.js?v=2.5"></script>
        <script type="text/javascript" src="../public/newfront/assets/js/app.js?v=3.1"></script>
        <script type="text/javascript" src="../public/newfront/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="../public/newfront/js/jquery.validate.min.js"></script>
        

        <script type="text/javascript">
            function initDataTable() {
                var $grid = $('#GvWod');
                if ($.fn.DataTable && $grid.length) {
                    if ($.fn.DataTable.isDataTable('#GvWod')) {
                        return;
                    }
                    $grid.DataTable({
                        responsive: true,
                        autoWidth: false,
                        pageLength: 10,
                        order: [],
                        language: {
                            search: "_INPUT_",
                            searchPlaceholder: "Search work orders...",
                            lengthMenu: "Show _MENU_ entries"
                        }
                    });
                }
            }

            $(document).ready(function () {
                initDataTable();
            });

            $(window).on("load", function () {
                initDataTable();
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
