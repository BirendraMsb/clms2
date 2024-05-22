<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gp-print.aspx.cs" Inherits="clms2.gatepass_section.gp_print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <title>CLMS | User Department | Dashboard</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="/public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="~/public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="~/public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="~/public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="~/public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="~/public/newfront/assets/css/app.min.css" />
    <link rel="stylesheet" href="~/public/common/css/commoncss.min.css" />
    <link rel="apple-touch-icon" sizes="57x57" href="~/public/common/icons/apple-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="60x60" href="~/public/common/icons/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="~/public/common/icons/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="~/public/common/icons/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="~/public/common/icons/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="~/public/common/icons/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="~/public/common/icons/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="~/public/common/icons/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="~/public/common/icons/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="~/public/common/icons/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="~/public/common/icons/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="~/public/common/icons/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="~/public/common/icons/favicon-16x16.png" />

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
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar navbar-expand-lg transparent navbar-dark bg-dark">
                        <div class="container-fluid">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="gp-dashboard.aspx">
                                    <span>
                                        <img src="../public/common/images/straight_logo_greenhrm.png" class="logo-lg logo-light" alt="GreenHRM Solutions | Breaking Stereotypes Logo" width="188" height="50" />
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
                                <form class="d-flex">
                                    <asp:Label ID="lblDate" runat="server" class="form-control bg-dark" Text="Date" Style="color: white; font-size: 15px; width: auto"></asp:Label>
                                    &nbsp;&nbsp;
                         <img src="../images/k2.png" alt="Department" width="50" height="50" />&nbsp;&nbsp;  
                       <asp:Label ID="lblUser" runat="server" Text="" Style="color: #FFFFCC; font-size: 15px"></asp:Label>&nbsp;&nbsp;
                     <%-- <input class="form-control me-sm-2" type="search" placeholder="Search">--%>
                                    <%--  <button class="btn btn-secondary my-2 my-sm-0" type="submit" fdprocessedid="i5uef7">Search</button>--%>
                                </form>
                            </div>
                        </div>
                    </nav>
                </td>

            </tr>
            <tr>
                <td>
                    <p style="text-align: left; padding-left: 200px">
                        <asp:Label ID="lblSearch" runat="server" Text="Emp Name"></asp:Label>
                        <asp:DropDownList ID="txtSearch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="txtSearch_SelectedIndexChanged"></asp:DropDownList>
                    </p>
                </td>
          

            </tr>
            <tr>

                <td>
                    <table border="0" cellpadding="5" cellspacing="0" style="font-family: Urbanist,sans-serif; width: 50%; font-size: 12px; border-bottom: 1px solid; border-top: 1px solid; border-left: 1px solid; border-right: 1px solid;">
                        <tr>
                            <td style="border-bottom: 1px solid;">
                                <img src="../images/logo.png" title="" alt="" /></td>
                            <td style="border-bottom: 1px solid;" colspan="6" align="center"><font size="4"><strong>GreenHRM Solutions</strong></font></td>
                            <td style="border-bottom: 1px solid;" align="right">
                                <img src="../images/logo.png" title="" alt="" /></td>
                        </tr>

                        <tr style="border-bottom: 1px solid; border-top: 1px solid; border-left: 1px solid; border-right: 1px solid;">
                            <td><strong>GP No.</strong></td>
                            <td width="1%">:</td>
                            <td colspan="2">
                                <asp:Label ID="lblGPNo" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right"><strong>Valid From</strong></td>
                            <td width="1%">:</td>
                            <td colspan="2">
                                <asp:Label ID="lblValidFrom" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td style="border-bottom: 1px solid;"><strong>Order No.</strong></td>
                            <td style="border-bottom: 1px solid;">:</td>
                            <td style="border-bottom: 1px solid;" colspan="2">
                                <asp:Label ID="lblOrderNo" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="border-bottom: 1px solid;" align="right"><strong>Valid To</strong></td>
                            <td style="border-bottom: 1px solid;">:</td>
                            <td style="border-bottom: 1px solid;" colspan="2">
                                <asp:Label ID="lblValidTo" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td style="border-bottom: 1px solid;">&nbsp;</td>
                            <td style="border-bottom: 1px solid;" colspan="6" align="center"><font size="2" face="Urbanist, sans-serif">Gatepass Permitted Hrs. : 06:00 AM to 06:00 AM</font></td>
                            <td style="border-bottom: 1px solid;">&nbsp;</td>
                        </tr>

                        <tr>
                            <td colspan="8">

                                <table width="100%" border="0" cellpadding="5" cellspacing="0" style="border-bottom: 0px solid;">
                                    <tr>
                                        <td class="style5"><strong style="font-size: medium"></strong>Photo</td>
                                        <td class="style3"><strong>Name</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="8" valign="top" style="text-align: center">
                                            <asp:Image ID="Image1" runat="server" Style="width: 150px; height: auto;" />
                                        </td>
                                        <td class="style3"><strong>Identity Mark</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblIdentityMark" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3"><strong>Gender</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3"><strong>Blood Grp</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblBloodGrp" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3" width="40%"><strong>Department&nbsp; </strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3"><strong>Vendor</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblVendor" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3"><strong>Vendor Code</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblVendorCode" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3"><strong>ESIC No.</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblESICNo" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3"><strong>UAN No.</strong></td>
                                        <td><strong>:</strong></td>
                                        <td>
                                            <asp:Label ID="lblPFNO" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="style3" valign="top"><strong></strong></td>
                                        <td valign="top"><strong></strong></td>
                                        <td valign="top">
                                            <asp:Label ID="lblLIC" runat="server" Text="" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
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
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</div>

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



    <script type="text/jscript" src="~/public/newfront/js/jquery.min.js"></script>
    <script type="text/jscript" src="~/public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
    <script type="text/jscript" src="~/public/newfront/assets/js/app.js" defer></script>
    <script type="text/jscript" src="~/public/newfront/datatables/datatables.min.js" defer></script>
    <script type="text/jscript" src="~/public/newfront/js/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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
</body>
</html>
