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
                            <img class="logo-dark navb-img" src="images/electro_sol1.png" style="height:40px;width:100px" alt="" title="" />
                            <img class="logo-light navb-img " src="images/electro_sol1.png" style="height:40px;width:100px" alt="" title=""  />
                          
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
                <div class="container py-14 py-md-16">

                    <div class="row gx-lg-8 gx-xl-12 gy-6 align-items-center" style="margin-top: -5rem; margin-bottom: -50rem;">

                        <table width="100%" border="0">
                            <tr>
                                <td align="center">
                                    <img src="images/Contract_Onboarding.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                                <td align="center">
                                    <img src="images/onboarding_contract_labour.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                                <td align="center">
                                    <img src="images/Attendance_mgmt.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                                <td align="center">
                                    <img src="images/Payroll_Management.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                                <td align="center">
                                    <img src="images/statutory_compliance.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                                <td align="center">
                                    <img src="images/offboarding_contract.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                                <td align="center">
                                    <img src="images/HR-IS.png" alt="" title="" style="width: 110px; height: auto;" /></td>
                            </tr>
                            <tr>
                                <td align="center"><a href="login/login.aspx">Contractors Onboarding</a></td>
                                <td align="center">Workers Onboarding</td>
                                <td align="center">Attendance Management</td>
                                <td align="center">Payroll Management</td>
                                <td align="center">Compliance Management</td>
                                <td align="center">Workers Offboarding</td>
                                <td align="center">HRIS Management</td>
                            </tr>
                        </table>

                    </div>
                </div>
            </section>

            <section class="wrapper bg-light">
                <div class="container py-14 py-md-16" style="background-color: ffffff; padding-bottom: -100px;">

                    <div class="row gx-lg-7 gx-xl-12 gy-10 align-items-center" style="margin-top: -7rem;">
                        <div class="col-lg-12 order-lg-2" style="font-size: 12px">
                            <center><asp:Button ID="cmdLogin" runat="server" Text="Click Here to Login" Width="200px" class="btn btn-info" OnClick="cmdLogin_Click"></asp:Button></center>
                            <br />
                            <br />
                            <strong>Disclaimer : </strong>
                            Contents, concept, template, logo, tagline, method and software, 
                 comprised in and associated with CLMS are proprietary to 
                 Electro Solutions and any unauthorized use or disclosure thereof is strictly prohibited.<br />
                            <p style="text-align: center"><strong>Plateform : Dot Net <span>| </span>Technology : ASP.NET <span>| </span>Ver : 4.5 </strong></p>
                        </div>

                    </div>
                    <div class="text-right">

                        <p>
                            <br />
                        </p>
                        <p>
                            <br />
                        </p>
                        <p>
                            <br />
                        </p>
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
