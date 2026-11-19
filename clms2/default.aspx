<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="clms2._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="public/common/icons/favicon.ico" />
    <link rel="stylesheet" href="public/webfront/website/assets/css/main.min.css" />
    <link rel="preload" href="public/webfront/website/assets/css/fonts/urbanist.css" />
    <meta property="og:url" content="index.html">
    <meta property="og:type" content="HR Solutions and Services">
    <meta property="og:title" content="Organization Profile">
    <meta property="og:description" content="Electro Solutions has defined its Mission, Vision & Core Values to bring clarity to all our stakeholders.">
    <meta property="og:image" content="public/webfront/website/assets/img/websocial/Facebook_Banner.html">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@greenhrmsolutions">
    <meta name="twitter:creator" content="@greenhrmsolutions">
    <meta property="og:site_name" content="greenhrm.in">
    <link rel="apple-touch-icon" sizes="57x57" href="public/common/icons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="public/common/icons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="public/common/icons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="public/common/icons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="public/common/icons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="public/common/icons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="public/common/icons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="public/common/icons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="public/common/icons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="public/common/icons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="512x512" href="public/common/icons/android-icon-512x512.png">
    <link rel="icon" type="image/png" sizes="32x32" href="public/common/icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="public/common/icons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="public/common/icons/favicon-16x16.png">
    <link rel="manifest" href="manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <style>
        .textjustify {
            text-align: justify !important;
        }

        @media (max-width:992px) {
            .textjustifymd {
                text-align: left !important;
            }
        }

        @media (max-width:767px) {
            .textjustifysm {
                text-align: left !important;
            }
        }

        @media (max-width:578px) {
            .ps-sm-0 {
                padding-left: 0 !important;
            }

            .pe-sm-0 {
                padding-right: 0 !important;
            }

            .ptsm5 {
                padding-top: 3rem !important;
            }

            .mb-sm-6 {
                margin-bottom: 0 !important;
            }
        }
    </style>
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-SX5ZN713JP"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-SX5ZN713JP');
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <%--  <div class="loading">
            <div class="loader"></div>
        </div>--%>
        <div class="content-wrapper">
            <header class="wrapper bg-soft-primary">
                <nav class="navbar navbar-expand-lg center-nav transparent bg-greenhrm position-absolute navbar-dark">

                    <div class="container flex-lg-row flex-nowrap align-items-center" style="padding: 8px;">
                        <div class="navbar-brand w-100">
                            <%--<a href="#" aria-label="Website">--%>
                            <img class="logo-dark navb-img" src="images/ElectroSolHeader3.png" style="height:50px;width:188px" alt="" title="" />
                            <img class="logo-light navb-img " src="images/ElectroSolHeader3.png" style="height:50px;width:188px" alt="" title=""  />
                          
                            <%--<img class="logo-dark navb-img" src="images/greenhrmwhite.png" alt="" title="" />--%>
                            <%--<img class="logo-light navb-img" src="images/ghrm.png" alt="" title="" />--%>
                            <%--<img class="logo-dark navb-img" src="public/webfront/website/assets/img/weblogo/greenhrmcolor.svg" srcset="http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmcolor@2x.svg 2x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmcolor@3x.svg 3x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmcolor@4x.svg 4x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmcolor@5x.svg 5x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmcolor@6x.svg 6x" alt="" width="233" height="70">
						<img class="logo-light navb-img" src="public/webfront/website/assets/img/weblogo/greenhrmwhite.svg" srcset="http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmwhite@2x.svg 2x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmwhite@3x.svg 3x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmwhite@4x.svg 4x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmwhite@5x.svg 5x, http://localhost:2873/public/webfront/website/assets/img/weblogo/greenhrmwhite@6x.svg 6x" alt="" width="233" height="70">--%>
                            <%--</a>--%>
                        </div>
                        <div class="navbar-collapse offcanvas offcanvas-nav offcanvas-start">
                            <div class="offcanvas-header d-lg-none">
                                <div class="text-white fs-21 mb-0">Electro Solutions</div>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                            </div>
                        </div>
                        <div class="navbar-other w-100 d-flex ms-auto d-block d-sm-none">
                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <li class="nav-item d-lg-none">
                                    <button class="hamburger offcanvas-nav-btn" aria-label="Hamburger Menu"><span aria-hidden="true"></span></button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>

            <section class="wrapper bg-light">
                <div class="container py-14 py-md-15">
                    <div class="row gx-lg-8 gx-xl-12 gy-10 align-items-center" style="margin-top: -3rem; margin-bottom: -5rem;">

                        <div class="col-lg-12">
                            <h2>Contract Labour Management System</h2>
                            <p align="justify">
                                <strong>CLM Services from Electro Solutions is an IT enabled,</strong>
                                one of the most innovatively designed, cost effective, start to end centralised contract 
labour lifecycle management services. It’s a real time solution giving complete visibility of 
the contract, bringing in transparency between company & contractor records, with many management 
controls for better administration. It also provides periodic HRIS as per organisational thrust areas, 
with reliable data from single source is one of the high points of this services. 
Icing on the top is we support you with Manpower, Software, Hardware, Consumables all under one roof. 
It’s a win-win solution for all the stakeholders as it minimises business risk and provide many tangible 
and intangible benefits to Service Providers/Contractors/Contract Workers and Principal Employers.
                            </p>

                        </div>
                    </div>
                </div>
            </section>

            <section class="wrapper bg-soft-primary" id="MissionStatement">
                <div class="container py-10 py-md-12">
                    <div class="row text-center mb-6">
                        <div class="col-12">
                            <h3 class="display-6 fw-bold text-dark">Core Lifecycle Capabilities</h3>
                            <p class="text-muted">Integrated, real-time lifecycle management for contract workforce</p>
                        </div>
                    </div>
                    <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-7 g-4 text-center justify-content-center">
                        <div class="col">
                            <a href="login/login.aspx" class="text-decoration-none text-dark">
                                <div class="card h-100 p-3 shadow-sm border-0 rounded-4 transition-card bg-white">
                                    <img src="images/Contract_Onboarding.png" alt="Contractors Onboarding" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                    <div class="fw-bold small text-primary">Contractors Onboarding</div>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <div class="card h-100 p-3 shadow-sm border-0 rounded-4 bg-white">
                                <img src="images/onboarding_contract_labour.png" alt="Workers Onboarding" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                <div class="fw-bold small text-dark">Workers Onboarding</div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100 p-3 shadow-sm border-0 rounded-4 bg-white">
                                <img src="images/Attendance_mgmt.png" alt="Attendance Management" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                <div class="fw-bold small text-dark">Attendance Management</div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100 p-3 shadow-sm border-0 rounded-4 bg-white">
                                <img src="images/Payroll_Management.png" alt="Payroll Management" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                <div class="fw-bold small text-dark">Payroll Management</div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100 p-3 shadow-sm border-0 rounded-4 bg-white">
                                <img src="images/statutory_compliance.png" alt="Compliance Management" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                <div class="fw-bold small text-dark">Compliance Management</div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100 p-3 shadow-sm border-0 rounded-4 bg-white">
                                <img src="images/offboarding_contract.png" alt="Workers Offboarding" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                <div class="fw-bold small text-dark">Workers Offboarding</div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100 p-3 shadow-sm border-0 rounded-4 bg-white">
                                <img src="images/HR-IS.png" alt="HRIS Management" class="mx-auto mb-2" style="width: 72px; height: auto;" />
                                <div class="fw-bold small text-dark">HRIS Analytics</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="wrapper bg-light">
                <div class="container py-10 py-md-12">
                    <div class="row justify-content-center text-center">
                        <div class="col-lg-8">
                            <div class="mb-5">
                                <asp:Button ID="cmdLogin" runat="server" Text="Sign In to CLMS Portal" CssClass="btn btn-primary btn-lg px-5 py-3 fw-bold shadow-lg rounded-pill" OnClick="cmdLogin_Click"></asp:Button>
                            </div>
                            <div class="card bg-white p-4 border rounded-3 shadow-sm text-start" style="font-size: 13px;">
                                <strong class="text-dark"><i class="fa fa-shield-alt text-primary me-1"></i> Proprietary Notice:</strong>
                                <p class="text-muted mb-2 mt-1">
                                    Contents, concept, template, logo, tagline, method and software comprised in and associated with CLMS are proprietary to 
                                    <strong>Electro Solutions</strong> and any unauthorized use or disclosure thereof is strictly prohibited.
                                </p>
                                <div class="text-center pt-2 border-top text-secondary small">
                                    <strong>Platform:</strong> .NET Framework 4.8 <span class="mx-2">&bull;</span> 
                                    <strong>Technology:</strong> ASP.NET Web Forms <span class="mx-2">&bull;</span> 
                                    <strong>Security:</strong> Enterprise Role-Based Access
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <footer class="bg-navy text-inverse">
            &copy; Electro Solutions | All Rights Reserved 
        </footer>
        <script src="public/webfront/website/assets/js/primary.min.js"></script>
        <script> $("h2").addClass("display-5 mb-3"); $(".icon-list.bullet-bg li").append("<i class='uil uil-check'></i> ");</script>
        <script>
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
    </form>
</body>
</html>
