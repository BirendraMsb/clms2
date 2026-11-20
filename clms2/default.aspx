<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="clms2._default" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Contract Labour Management System (CLMS) | Electro Solutions</title>
    <link rel="shortcut icon" href="public/common/icons/favicon.ico" />

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <!-- Bootstrap 5.3 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <!-- Local Fallback for Bootstrap -->
    <link rel="stylesheet" href="public/newfront/assets/css/bootstrap.min.css" />
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        :root {
            --clms-primary: #0d6efd;
            --clms-primary-dark: #0a58ca;
            --clms-navy: #0f172a;
            --clms-surface: #f8fafc;
            --clms-accent: #0284c7;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
            color: #334155;
            background-color: #ffffff;
            overflow-x: hidden;
        }

        /* Modern Glass Navbar */
        .clms-navbar {
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            background-color: rgba(15, 23, 42, 0.92);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }

        .navbar-brand-img {
            max-height: 48px;
            width: auto;
            object-fit: contain;
            border-radius: 4px;
            background: #ffffff;
            padding: 4px 8px;
        }

        /* Hero Section */
        .hero-section {
            background: radial-gradient(circle at 10% 20%, rgba(13, 110, 253, 0.15) 0%, transparent 40%),
                        radial-gradient(circle at 90% 80%, rgba(2, 132, 199, 0.15) 0%, transparent 40%),
                        linear-gradient(135deg, #0b132b 0%, #1c2541 100%);
            color: #ffffff;
            padding-top: 8rem;
            padding-bottom: 5rem;
            position: relative;
        }

        .hero-badge {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #93c5fd;
            font-size: 0.85rem;
            letter-spacing: 0.05em;
        }

        .hero-title {
            font-size: clamp(2.2rem, 4vw, 3.5rem);
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -0.02em;
        }

        .hero-gradient-text {
            background: linear-gradient(90deg, #60a5fa, #38bdf8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-subtitle {
            font-size: 1.125rem;
            color: #cbd5e1;
            line-height: 1.7;
            max-width: 780px;
        }

        /* Hero Right-side Feature Box */
        .hero-feature-card {
            background-color: #0f172a !important;
            background: rgba(15, 23, 42, 0.92) !important;
            border: 1px solid rgba(255, 255, 255, 0.22) !important;
            border-radius: 1.25rem;
            padding: 1.75rem;
            color: #ffffff !important;
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
        }

        .hero-feature-card .card-badge-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: linear-gradient(135deg, #0d6efd, #0284c7);
            color: #ffffff !important;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            flex-shrink: 0;
        }

        .hero-feature-card .card-brand-title {
            color: #ffffff !important;
            font-size: 1.1rem;
            font-weight: 700;
            line-height: 1.2;
        }

        .hero-feature-card .card-brand-subtitle {
            color: #38bdf8 !important;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .hero-feature-card .card-lead-text {
            color: #e2e8f0 !important;
            font-size: 0.92rem;
            margin-bottom: 1rem;
            line-height: 1.5;
        }

        .hero-feature-card .card-list-item {
            color: #f8fafc !important;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.65rem;
        }

        .hero-feature-card .card-list-item i {
            color: #38bdf8 !important;
            font-size: 1.15rem;
            flex-shrink: 0;
        }

        /* Metrics Bar */
        .metric-card {
            background-color: #0f172a !important;
            background: rgba(15, 23, 42, 0.85) !important;
            border: 1px solid rgba(255, 255, 255, 0.18) !important;
            border-radius: 1rem;
            padding: 1.25rem 1rem;
            transition: transform 0.25s ease, background-color 0.25s ease;
        }
        .metric-card:hover {
            transform: translateY(-4px);
            background: rgba(15, 23, 42, 0.95) !important;
            border-color: rgba(56, 189, 248, 0.4) !important;
        }
        .metric-card .metric-title {
            color: #ffffff !important;
            font-weight: 700;
        }
        .metric-card .metric-subtitle {
            color: #94a3b8 !important;
            font-size: 0.85rem;
        }

        /* Enhanced Core Capability Cards */
        .capability-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 1.5rem;
            padding: 1.75rem 1.35rem 1.5rem 1.35rem;
            transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
        }

        .capability-card::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #0d6efd, #06b6d4);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .capability-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 30px -8px rgba(13, 110, 253, 0.16), 0 8px 16px -6px rgba(13, 110, 253, 0.08);
        }

        .capability-card:hover::after {
            opacity: 1;
        }

        .capability-step-badge {
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            padding: 0.35rem 0.8rem;
            border-radius: 2rem;
            display: inline-block;
            margin-bottom: 1.15rem;
        }

        .capability-img-wrapper {
            width: 86px;
            height: 86px;
            margin: 0 auto 1.25rem auto;
            border-radius: 1.25rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.35s ease;
            position: relative;
        }

        .capability-card:hover .capability-img-wrapper {
            transform: scale(1.1) rotate(2deg);
        }

        .capability-img {
            max-width: 56px;
            max-height: 56px;
            object-fit: contain;
            filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
        }

        /* Color-Themed Variants */
        .mod-blue .capability-img-wrapper { background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%); }
        .mod-blue .capability-step-badge { background: #dbeafe; color: #1d4ed8; }
        .mod-blue:hover { border-color: #60a5fa; }

        .mod-indigo .capability-img-wrapper { background: linear-gradient(135deg, #eef2ff 0%, #e0e7ff 100%); }
        .mod-indigo .capability-step-badge { background: #e0e7ff; color: #4338ca; }
        .mod-indigo:hover { border-color: #818cf8; }

        .mod-teal .capability-img-wrapper { background: linear-gradient(135deg, #f0fdfa 0%, #ccfbf1 100%); }
        .mod-teal .capability-step-badge { background: #ccfbf1; color: #0f766e; }
        .mod-teal:hover { border-color: #2dd4bf; }

        .mod-emerald .capability-img-wrapper { background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%); }
        .mod-emerald .capability-step-badge { background: #d1fae5; color: #047857; }
        .mod-emerald:hover { border-color: #34d399; }

        .mod-amber .capability-img-wrapper { background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%); }
        .mod-amber .capability-step-badge { background: #fef3c7; color: #b45309; }
        .mod-amber:hover { border-color: #fbbf24; }

        .mod-rose .capability-img-wrapper { background: linear-gradient(135deg, #fff1f2 0%, #ffe4e6 100%); }
        .mod-rose .capability-step-badge { background: #ffe4e6; color: #be123c; }
        .mod-rose:hover { border-color: #fb7185; }

        .mod-purple .capability-img-wrapper { background: linear-gradient(135deg, #faf5ff 0%, #f3e8ff 100%); }
        .mod-purple .capability-step-badge { background: #f3e8ff; color: #7e22ce; }
        .mod-purple:hover { border-color: #c084fc; }

        .mod-portal {
            background: linear-gradient(145deg, #0f172a 0%, #1e293b 100%);
            border-color: #334155;
            color: #ffffff;
        }
        .mod-portal .capability-step-badge { background: rgba(56, 189, 248, 0.2); color: #38bdf8; }
        .mod-portal:hover { border-color: #38bdf8; box-shadow: 0 20px 30px -8px rgba(56, 189, 248, 0.3); }
        .mod-portal .capability-img-wrapper { background: rgba(255, 255, 255, 0.08); }
        .mod-portal h5 { color: #ffffff !important; }
        .mod-portal p { color: #94a3b8 !important; }

        .capability-badge-pill {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            font-size: 0.8rem;
            font-weight: 600;
            padding: 0.45rem 0.9rem;
            border-radius: 2rem;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #475569;
            transition: all 0.25s ease;
        }

        .capability-card:hover .capability-badge-pill {
            background: #ffffff;
            border-color: #cbd5e1;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        /* Section Title Styling */
        .section-eyebrow {
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--clms-primary);
        }

        .section-title {
            font-size: 2.25rem;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.02em;
        }

        /* Feature Highlight Cards */
        .feature-box {
            background-color: #ffffff;
            border-radius: 1rem;
            border: 1px solid #e2e8f0;
            padding: 1.75rem;
            transition: all 0.3s ease;
        }

        .feature-box:hover {
            border-color: #bfdbfe;
            box-shadow: 0 12px 20px -5px rgba(13, 110, 253, 0.08);
        }

        .feature-icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: #eff6ff;
            color: #2563eb;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.35rem;
            margin-bottom: 1rem;
        }

        /* Custom Login Button */
        .btn-clms-primary {
            background: linear-gradient(135deg, #0d6efd 0%, #0284c7 100%);
            border: none;
            color: #ffffff;
            font-weight: 600;
            padding: 0.85rem 2rem;
            border-radius: 0.75rem;
            box-shadow: 0 10px 18px -4px rgba(13, 110, 253, 0.35);
            transition: all 0.25s ease;
        }

        .btn-clms-primary:hover {
            background: linear-gradient(135deg, #0b5ed7 0%, #0369a1 100%);
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 14px 22px -4px rgba(13, 110, 253, 0.45);
        }

        /* Small Portal CTA Card */
        .portal-cta-card {
            background: linear-gradient(145deg, #f0f7ff 0%, #e0f2fe 100%);
            border: 1.5px solid #bae6fd;
            border-radius: 1.25rem;
            box-shadow: 0 10px 22px -5px rgba(2, 132, 199, 0.16);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            overflow: hidden;
        }

        .portal-cta-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #0d6efd, #06b6d4);
        }

        .portal-cta-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 16px 28px -4px rgba(2, 132, 199, 0.25);
            border-color: #7dd3fc;
        }

        .cta-icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0d6efd 0%, #0284c7 100%);
            color: #ffffff !important;
            font-size: 1.35rem;
            box-shadow: 0 6px 14px rgba(13, 110, 253, 0.28);
        }

        .btn-portal-launch {
            background: linear-gradient(135deg, #0d6efd 0%, #0284c7 100%);
            color: #ffffff !important;
            font-weight: 700;
            font-size: 0.95rem;
            padding: 0.75rem 1.25rem;
            border-radius: 0.75rem;
            border: none;
            letter-spacing: 0.02em;
            box-shadow: 0 8px 18px -2px rgba(13, 110, 253, 0.35);
            transition: all 0.25s ease;
        }

        .btn-portal-launch:hover {
            background: linear-gradient(135deg, #0b5ed7 0%, #0369a1 100%);
            transform: translateY(-2px);
            box-shadow: 0 12px 22px -2px rgba(13, 110, 253, 0.45);
            color: #ffffff !important;
        }

        .btn-portal-launch i {
            transition: transform 0.2s ease;
        }

        .btn-portal-launch:hover i {
            transform: translateX(4px);
        }

        /* Footer */
        .clms-footer {
            background-color: #0f172a;
            color: #94a3b8;
            font-size: 0.9rem;
            border-top: 1px solid #1e293b;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg clms-navbar fixed-top">
            <div class="container py-1">
                <a class="navbar-brand d-flex align-items-center gap-2" href="default.aspx">
                    <img src="images/ElectroSolHeader3.png" alt="Electro Solutions" class="navbar-brand-img" />
                    <span class="d-none d-sm-inline-block text-white fw-bold ps-2 border-start border-secondary small">
                        CLMS PORTAL
                    </span>
                </a>
                
                <button class="navbar-toggler text-white border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="bi bi-list fs-2 text-white"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center gap-2 gap-lg-3">
                        <li class="nav-item">
                            <a class="nav-link text-light opacity-75 opacity-100-hover" href="#capabilities">Capabilities</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light opacity-75 opacity-100-hover" href="#features">Key Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light opacity-75 opacity-100-hover" href="#roles">Portal Access</a>
                        </li>
                        <li class="nav-item ms-lg-2">
                            <a href="login/login.aspx" class="btn btn-primary btn-sm px-3 py-2 rounded-pill fw-semibold shadow-sm d-inline-flex align-items-center gap-2">
                                <i class="bi bi-box-arrow-in-right"></i>
                                <span>Sign In</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <header class="hero-section">
            <div class="container position-relative">
                <div class="row align-items-center g-5">
                    <div class="col-lg-8">
                        <span class="badge hero-badge px-3 py-2 rounded-pill mb-3 d-inline-flex align-items-center gap-2">
                            <i class="bi bi-shield-check text-info"></i>
                            <span>Centralized Workforce Governance</span>
                        </span>
                        
                        <h1 class="hero-title mb-3">
                            Contract Labour <br />
                            <span class="hero-gradient-text">Management System</span>
                        </h1>
                        
                        <p class="hero-subtitle mb-4">
                            An IT-enabled, centralized contract workforce lifecycle management platform by <strong>Electro Solutions</strong>. 
                            Delivers complete transparency between enterprise and contractor records, automated statutory compliance, 
                            and real-time HRIS analytics from a single unified source.
                        </p>

                        <div class="d-flex flex-wrap align-items-center gap-3 pt-2">
                            <asp:Button ID="cmdLogin" runat="server" Text="Sign In to CLMS Portal" CssClass="btn btn-clms-primary btn-lg" OnClick="cmdLogin_Click" />
                            <a href="#capabilities" class="btn btn-outline-light btn-lg px-4 rounded-3 d-inline-flex align-items-center gap-2">
                                <span>Explore Lifecycle</span>
                                <i class="bi bi-arrow-down-short fs-5"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="hero-feature-card">
                            <div class="d-flex align-items-center gap-3 mb-3 pb-3 border-bottom border-white border-opacity-15">
                                <div class="card-badge-icon">
                                    <i class="bi bi-building-check"></i>
                                </div>
                                <div>
                                    <div class="card-brand-title">Electro Solutions</div>
                                    <div class="card-brand-subtitle">Enterprise CLM Services</div>
                                </div>
                            </div>
                            <p class="card-lead-text">
                                Comprehensive start-to-end workforce management supporting:
                            </p>
                            <ul class="list-unstyled mb-0 d-flex flex-column gap-2">
                                <li class="card-list-item">
                                    <i class="bi bi-check2-circle"></i>
                                    <span>Contractor Onboarding & KYC</span>
                                </li>
                                <li class="card-list-item">
                                    <i class="bi bi-check2-circle"></i>
                                    <span>Biometric Attendance Integration</span>
                                </li>
                                <li class="card-list-item">
                                    <i class="bi bi-check2-circle"></i>
                                    <span>Automated Wage & Statutory Checks</span>
                                </li>
                                <li class="card-list-item">
                                    <i class="bi bi-check2-circle"></i>
                                    <span>Multi-tier Safety & Admin Approvals</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Highlights Strip -->
                <div class="row row-cols-2 row-cols-md-4 g-3 mt-5">
                    <div class="col">
                        <div class="metric-card text-center">
                            <div class="fs-4 text-info mb-1"><i class="bi bi-speedometer2"></i></div>
                            <div class="metric-title">Real-Time Tracking</div>
                            <div class="metric-subtitle">Live deployment visibility</div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="metric-card text-center">
                            <div class="fs-4 text-success mb-1"><i class="bi bi-patch-check"></i></div>
                            <div class="metric-title">100% Compliance</div>
                            <div class="metric-subtitle">PF, ESIC & CLRA regulations</div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="metric-card text-center">
                            <div class="fs-4 text-warning mb-1"><i class="bi bi-pie-chart"></i></div>
                            <div class="metric-title">Unified HRIS</div>
                            <div class="metric-subtitle">Accurate, audit-ready data</div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="metric-card text-center">
                            <div class="fs-4 text-primary mb-1"><i class="bi bi-shield-lock"></i></div>
                            <div class="metric-title">Role-Based Security</div>
                            <div class="metric-subtitle">Segregated department access</div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Core Lifecycle Capabilities Section -->
        <section id="capabilities" class="py-5 bg-light">
            <div class="container py-4">
                <div class="text-center max-w-700 mx-auto mb-5">
                    <div class="section-eyebrow mb-2">Full Spectrum Administration</div>
                    <h2 class="section-title mb-3">Core Workforce Lifecycle Modules</h2>
                    <p class="text-secondary">
                        Integrated modules enabling complete control over every stage of contract engagement from initial vendor verification to final exit settlement.
                    </p>
                </div>

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 justify-content-center">
                    <!-- 1. Contractors Onboarding -->
                    <div class="col">
                        <div class="capability-card mod-blue text-center">
                            <div>
                                <span class="capability-step-badge">Phase 01 &bull; Onboarding</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/Contract_Onboarding.png" alt="Contractors Onboarding" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Contractors Onboarding</h5>
                                <p class="text-muted small mb-3">
                                    Vendor registration, work order allotment, statutory license validation & digital document vault.
                                </p>
                            </div>
                            <div>
                                <a href="login/login.aspx" class="capability-badge-pill text-decoration-none text-primary">
                                    <i class="bi bi-box-arrow-in-right"></i> Launch Module
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 2. Workers Onboarding -->
                    <div class="col">
                        <div class="capability-card mod-indigo text-center">
                            <div>
                                <span class="capability-step-badge">Phase 02 &bull; Induction</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/onboarding_contract_labour.png" alt="Workers Onboarding" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Workers Onboarding</h5>
                                <p class="text-muted small mb-3">
                                    Aadhaar KYC, age/domicile verification, police verification, medical fitness & digital gate pass.
                                </p>
                            </div>
                            <div>
                                <span class="capability-badge-pill">
                                    <i class="bi bi-shield-check text-primary"></i> KYC & Verification
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- 3. Attendance Management -->
                    <div class="col">
                        <div class="capability-card mod-teal text-center">
                            <div>
                                <span class="capability-step-badge">Phase 03 &bull; Operations</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/Attendance_mgmt.png" alt="Attendance Management" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Attendance Management</h5>
                                <p class="text-muted small mb-3">
                                    Daily attendance logs, shift rosters, overtime controls & real-time biometric hardware synchronization.
                                </p>
                            </div>
                            <div>
                                <span class="capability-badge-pill">
                                    <i class="bi bi-fingerprint text-info"></i> Biometric Sync
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- 4. Payroll Management -->
                    <div class="col">
                        <div class="capability-card mod-emerald text-center">
                            <div>
                                <span class="capability-step-badge">Phase 04 &bull; Payroll</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/Payroll_Management.png" alt="Payroll Management" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Payroll Management</h5>
                                <p class="text-muted small mb-3">
                                    Automated wage calculations, wage register generation (Form 17), payment proofs & statutory wage audits.
                                </p>
                            </div>
                            <div>
                                <span class="capability-badge-pill">
                                    <i class="bi bi-cash-coin text-success"></i> Form 17 Registers
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- 5. Compliance Management -->
                    <div class="col">
                        <div class="capability-card mod-amber text-center">
                            <div>
                                <span class="capability-step-badge">Phase 05 &bull; Statutory</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/statutory_compliance.png" alt="Compliance Management" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Compliance Management</h5>
                                <p class="text-muted small mb-3">
                                    Provident Fund (PF), ESIC monthly returns, insurance coverage, and labor law filings for 100% audit readiness.
                                </p>
                            </div>
                            <div>
                                <span class="capability-badge-pill">
                                    <i class="bi bi-patch-check-fill text-warning"></i> 100% Audit Ready
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- 6. Workers Offboarding -->
                    <div class="col">
                        <div class="capability-card mod-rose text-center">
                            <div>
                                <span class="capability-step-badge">Phase 06 &bull; Clearances</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/offboarding_contract.png" alt="Workers Offboarding" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Workers Offboarding</h5>
                                <p class="text-muted small mb-3">
                                    Inter-departmental clearance workflows, gate pass deactivation, dues verification & settlement certificates.
                                </p>
                            </div>
                            <div>
                                <span class="capability-badge-pill">
                                    <i class="bi bi-door-closed text-danger"></i> Controlled Exit
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- 7. HRIS Analytics -->
                    <div class="col">
                        <div class="capability-card mod-purple text-center">
                            <div>
                                <span class="capability-step-badge">Phase 07 &bull; Intelligence</span>
                                <div class="capability-img-wrapper">
                                    <img src="images/HR-IS.png" alt="HRIS Analytics" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">HRIS & Analytics</h5>
                                <p class="text-muted small mb-3">
                                    Contractor KPIs, active deployment headcounts, attrition metrics, and periodic management reports.
                                </p>
                            </div>
                            <div>
                                <span class="capability-badge-pill">
                                    <i class="bi bi-graph-up-arrow text-primary"></i> Live Dashboards
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- 8. Central Control & Portal Access -->
                    <div class="col">
                        <div class="capability-card mod-portal text-center">
                            <div>
                                <span class="capability-step-badge">Gateway &bull; SSO Hub</span>
                                <div class="capability-img-wrapper">
                                    <i class="bi bi-shield-lock-fill text-info" style="font-size: 2.3rem;"></i>
                                </div>
                                <h5 class="fw-bold mb-2">Central SSO Portal</h5>
                                <p class="small mb-3">
                                    Authenticated workspace for System Admin, Contractor Cell, Safety Dept, User Dept & Vendors.
                                </p>
                            </div>
                            <div>
                                <a href="login/login.aspx" class="btn btn-primary btn-sm rounded-pill w-100 py-2 fw-semibold d-inline-flex align-items-center justify-content-center gap-1 shadow-sm">
                                    <span>Sign In Portal</span>
                                    <i class="bi bi-box-arrow-in-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Key Features Section -->
        <section id="features" class="py-5 bg-white">
            <div class="container py-4">
                <div class="row align-items-center mb-5">
                    <div class="col-lg-7">
                        <div class="section-eyebrow mb-2">Enterprise Advantages</div>
                        <h2 class="section-title">Built for Reliability, Scalability & Compliance</h2>
                    </div>
                    <div class="col-lg-5">
                        <p class="text-secondary mb-0">
                            Our system eliminates compliance exposure, reduces vendor disputes, and automates administrative bottlenecks through digital verification pipelines.
                        </p>
                    </div>
                </div>

                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="feature-box h-100">
                            <div class="feature-icon-circle">
                                <i class="bi bi-file-earmark-check"></i>
                            </div>
                            <h5 class="fw-bold text-dark mb-2">Form 16 & Form 17</h5>
                            <p class="text-secondary small mb-0">
                                Generate official statutory registers, employment cards, and wage payment statements in one click.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="feature-box h-100">
                            <div class="feature-icon-circle">
                                <i class="bi bi-qr-code-scan"></i>
                            </div>
                            <h5 class="fw-bold text-dark mb-2">Gate Pass Control</h5>
                            <p class="text-secondary small mb-0">
                                Digital gate pass issuance with photo verification and automatic expiry control based on contract tenure.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="feature-box h-100">
                            <div class="feature-icon-circle">
                                <i class="bi bi-shield-shaded"></i>
                            </div>
                            <h5 class="fw-bold text-dark mb-2">Safety Approvals</h5>
                            <p class="text-secondary small mb-0">
                                Mandatory safety training, medical certificate verification, and PPE allotment tracking prior to site access.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="feature-box h-100">
                            <div class="feature-icon-circle">
                                <i class="bi bi-diagram-3"></i>
                            </div>
                            <h5 class="fw-bold text-dark mb-2">Departmental Workflows</h5>
                            <p class="text-secondary small mb-0">
                                Automated multi-stage sign-offs between Contractor Cell, User Department, Safety, and Plant Head.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Role Access Quick Guide -->
        <section id="roles" class="py-5 bg-light border-top border-bottom">
            <div class="container py-3">
                <div class="card border-0 rounded-4 shadow-sm p-4 p-md-5 bg-white">
                    <div class="row align-items-center g-4">
                        <div class="col-lg-8">
                            <h4 class="fw-bold text-dark mb-2">Authorized Departmental Access</h4>
                            <p class="text-muted mb-3">
                                CLMS provides strict role-based separation of duties to ensure integrity across departments:
                            </p>
                            <div class="d-flex flex-wrap gap-2">
                                <span class="badge bg-secondary-subtle text-dark border px-3 py-2 rounded-pill"><i class="bi bi-person-gear me-1"></i> System Admin</span>
                                <span class="badge bg-primary-subtle text-primary border px-3 py-2 rounded-pill"><i class="bi bi-briefcase me-1"></i> Contractor Cell</span>
                                <span class="badge bg-success-subtle text-success border px-3 py-2 rounded-pill"><i class="bi bi-shield-check me-1"></i> Safety Dept</span>
                                <span class="badge bg-info-subtle text-info border px-3 py-2 rounded-pill"><i class="bi bi-building me-1"></i> User Department</span>
                                <span class="badge bg-warning-subtle text-warning-emphasis border px-3 py-2 rounded-pill"><i class="bi bi-person-badge me-1"></i> Vendor / Contractor</span>
                                <span class="badge bg-danger-subtle text-danger border px-3 py-2 rounded-pill"><i class="bi bi-door-open me-1"></i> Gatepass Section</span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="portal-cta-card p-3 p-xl-4 text-center">
                                <div class="d-inline-flex align-items-center justify-content-center cta-icon-circle mb-2">
                                    <i class="bi bi-shield-lock-fill"></i>
                                </div>
                                <h6 class="fw-bold text-dark mb-1">Single Sign-On Portal</h6>
                                <p class="text-muted small mb-3">Role-based departmental access</p>
                                <a href="login/login.aspx" class="btn btn-portal-launch w-100 d-inline-flex align-items-center justify-content-center gap-2">
                                    <span>Access CLMS Portal</span>
                                    <i class="bi bi-arrow-right-circle-fill"></i>
                                </a>
                                <div class="mt-2 pt-2 border-top border-info border-opacity-25 d-flex justify-content-center align-items-center gap-1 text-muted" style="font-size: 11px;">
                                    <i class="bi bi-patch-check-fill text-success"></i>
                                    <span>SSL 256-Bit Encrypted &bull; Secure</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="clms-footer py-4">
            <div class="container">
                <div class="row align-items-center gy-3">
                    <div class="col-md-6 text-center text-md-start">
                        <div class="text-white fw-bold mb-1">Electro Solutions &bull; CLMS</div>
                        <div class="small">
                            &copy; <%= DateTime.Now.Year %> Electro Solutions. All Rights Reserved.
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-md-end small">
                        <span>Platform: ASP.NET (.NET 4.8)</span>
                        <span class="mx-2">&bull;</span>
                        <span>Enterprise Workforce Portal</span>
                    </div>
                </div>
                <div class="mt-3 pt-3 border-top border-secondary border-opacity-25 text-center small text-secondary">
                    <em>Notice: Contents, concepts, modules, and software comprised in CLMS are proprietary to Electro Solutions. Unauthorized access is strictly prohibited.</em>
                </div>
            </div>
        </footer>

        <!-- Bootstrap 5.3 Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Local fallback -->
        <script src="public/newfront/assets/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
