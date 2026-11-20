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

        /* Capability Cards */
        .capability-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 1.25rem;
            padding: 1.75rem 1.25rem;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }

        .capability-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--clms-primary), var(--clms-accent));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .capability-card:hover {
            transform: translateY(-6px);
            border-color: #cbd5e1;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.08), 0 8px 10px -6px rgba(0, 0, 0, 0.04);
        }

        .capability-card:hover::before {
            opacity: 1;
        }

        .capability-img-wrapper {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.25rem auto;
            border-radius: 1rem;
            background-color: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease;
        }

        .capability-card:hover .capability-img-wrapper {
            transform: scale(1.08);
            background-color: #e0f2fe;
        }

        .capability-img {
            max-width: 52px;
            max-height: 52px;
            object-fit: contain;
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
                        <a href="login/login.aspx" class="text-decoration-none">
                            <div class="capability-card text-center">
                                <div>
                                    <div class="capability-img-wrapper">
                                        <img src="images/Contract_Onboarding.png" alt="Contractors Onboarding" class="capability-img" />
                                    </div>
                                    <h5 class="fw-bold text-dark mb-2">Contractors Onboarding</h5>
                                    <p class="text-muted small mb-3">
                                        Vendor registration, work order allotment, statutory license validation & documentation.
                                    </p>
                                </div>
                                <span class="badge bg-primary-subtle text-primary py-2 px-3 rounded-pill fw-semibold small">
                                    Access Module <i class="bi bi-arrow-right ms-1"></i>
                                </span>
                            </div>
                        </a>
                    </div>

                    <!-- 2. Workers Onboarding -->
                    <div class="col">
                        <div class="capability-card text-center">
                            <div>
                                <div class="capability-img-wrapper">
                                    <img src="images/onboarding_contract_labour.png" alt="Workers Onboarding" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Workers Onboarding</h5>
                                <p class="text-muted small mb-3">
                                    KYC records, police verification, age/domicile proof, and digital gatepass generation.
                                </p>
                            </div>
                            <span class="text-secondary small fw-medium">Safety & Medical Verified</span>
                        </div>
                    </div>

                    <!-- 3. Attendance Management -->
                    <div class="col">
                        <div class="capability-card text-center">
                            <div>
                                <div class="capability-img-wrapper">
                                    <img src="images/Attendance_mgmt.png" alt="Attendance Management" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Attendance Management</h5>
                                <p class="text-muted small mb-3">
                                    Daily attendance logs, shift rosters, overtime controls, and biometric hardware sync.
                                </p>
                            </div>
                            <span class="text-secondary small fw-medium">Real-Time Shift Sync</span>
                        </div>
                    </div>

                    <!-- 4. Payroll Management -->
                    <div class="col">
                        <div class="capability-card text-center">
                            <div>
                                <div class="capability-img-wrapper">
                                    <img src="images/Payroll_Management.png" alt="Payroll Management" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Payroll Management</h5>
                                <p class="text-muted small mb-3">
                                    Automated wage calculations, wage register generation (Form 17), and payment proofs.
                                </p>
                            </div>
                            <span class="text-secondary small fw-medium">Statutory Wage Audits</span>
                        </div>
                    </div>

                    <!-- 5. Compliance Management -->
                    <div class="col">
                        <div class="capability-card text-center">
                            <div>
                                <div class="capability-img-wrapper">
                                    <img src="images/statutory_compliance.png" alt="Compliance Management" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Compliance Management</h5>
                                <p class="text-muted small mb-3">
                                    Provident Fund (PF), ESIC monthly returns, insurance coverage, and labor law filings.
                                </p>
                            </div>
                            <span class="text-secondary small fw-medium">100% Audit Readiness</span>
                        </div>
                    </div>

                    <!-- 6. Workers Offboarding -->
                    <div class="col">
                        <div class="capability-card text-center">
                            <div>
                                <div class="capability-img-wrapper">
                                    <img src="images/offboarding_contract.png" alt="Workers Offboarding" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">Workers Offboarding</h5>
                                <p class="text-muted small mb-3">
                                    Structured clearance processes, gate pass deactivation, and full & final settlement records.
                                </p>
                            </div>
                            <span class="text-secondary small fw-medium">Controlled Clearances</span>
                        </div>
                    </div>

                    <!-- 7. HRIS Analytics -->
                    <div class="col">
                        <div class="capability-card text-center">
                            <div>
                                <div class="capability-img-wrapper">
                                    <img src="images/HR-IS.png" alt="HRIS Analytics" class="capability-img" />
                                </div>
                                <h5 class="fw-bold text-dark mb-2">HRIS & Analytics</h5>
                                <p class="text-muted small mb-3">
                                    Headcount analytics, contractor performance KPIs, and periodic statutory management reporting.
                                </p>
                            </div>
                            <span class="text-secondary small fw-medium">Executive Dashboards</span>
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
                        <div class="col-lg-4 text-lg-end">
                            <a href="login/login.aspx" class="btn btn-clms-primary btn-lg w-100 w-lg-auto d-inline-flex align-items-center justify-content-center gap-2">
                                <i class="bi bi-box-arrow-in-right"></i>
                                <span>Go to Login Portal</span>
                            </a>
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
