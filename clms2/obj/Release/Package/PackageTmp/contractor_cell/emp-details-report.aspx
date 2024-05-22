<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emp-details-report.aspx.cs" Inherits="clms2.contractor_cell.emp_details_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLMS | Employee | Details</title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="/public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css" />
    <%-- <link rel="stylesheet" href="../public/common/css/commoncss.min.css" />--%>
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
    </style>
</head>
<body data-layout="horizontal" class="dark-topbar">
    <form id="form1" runat="server">
        <div class="loading">
            <div class="loader"></div>
        </div>
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar fixed-top navbar-expand-lg transparent navbar-dark bg-dark">
                        <div class="container-fluid">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="dashboard.aspx">
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee <span class="fa fa-angle-down ms-1"></span>
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
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Attendance <span class="fa fa-angle-down ms-1"></span>
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
                    <div class="page-wrapper">
                        <div class="page-content-tab">
                            <div class="container-fluid">

                                <br />
                                <br />
                                <br />
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">
                                        <span>Employee Detail</span>
                                        <%--<span><a href="emp_onboarding.aspx" class="text-white">Add New</a></span>--%>
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <div class="table-responsive" style="overflow: scroll; width: 1800px">
                                                <%--========================================================================================--%>
                                                <p style="text-align: center">
                                                    <asp:Label ID="lblSearch" runat="server" Text="Employee Name"></asp:Label>
                                                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                                    <asp:Button ID="btnSearch" runat="server" Text="Search" BackColor="#99ccff" Font-Bold="true" Width="100px" OnClick="btnSearch_Click" /><br />
                                                </p>
                                                <asp:GridView ID="GvEmp" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                    GridLines="Vertical" AllowPaging="true" PageSize="5" DataKeyNames="id" Class="table table-bordered nowrap" ShowHeaderWhenEmpty="true" OnPageIndexChanging="GvEmp_PageIndexChanging" OnRowDataBound="GvEmp_RowDataBound">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl. No">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="emp_code" HeaderText="Emp. code" SortExpression="emp_code" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="emp_name" HeaderText="Emp. Name" SortExpression="emp_name" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Photo">
                                                            <ItemTemplate>
                                                                <asp:Image ID="image1" runat="server" Width="80px" Height="100px" ImageUrl='<%# Eval("img_file","../emp_pic/{0}") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle Height="50px" Width="50px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="emp_add" HeaderText="Address" SortExpression="emp_add" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="emp_ph_no1" HeaderText="Contact No." SortExpression="emp_ph_no1" ItemStyle-Wrap="false" />
                                                        <%-- <asp:BoundField DataField="emp_ph_no2" HeaderText="Contact No. 2" SortExpression="emp_ph_no2" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>--%>

                                                        <asp:BoundField DataField="email" HeaderText="E-Mail" SortExpression="email" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="emp_cast" HeaderText="Cast" SortExpression="emp_cast" ItemStyle-Wrap="false"></asp:BoundField>

                                                        <asp:BoundField DataField="blood_grp" HeaderText="Blood Grp" SortExpression="blood_grp" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="nationality" HeaderText="Nationality" SortExpression="nationality" DataFormatString="{0:d}" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="aadhar_no" HeaderText="Aadhar No." SortExpression="aadhar_no" DataFormatString="{0:d}" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="pfno" HeaderText="UAN No." SortExpression="pfno" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="pf_declaration" HeaderText="UAN Declaration" SortExpression="pf_declaration" ItemStyle-Wrap="false"></asp:BoundField>

                                                        <asp:BoundField DataField="escic" HeaderText="ESIC NO" SortExpression="escic" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="esic_declaration" HeaderText="ESIC Declaration" SortExpression="esic_declaration" ItemStyle-Wrap="false"></asp:BoundField>

                                                        <asp:BoundField DataField="education" HeaderText="Educational" SortExpression="education" ItemStyle-Wrap="false"></asp:BoundField>

                                                        <asp:TemplateField HeaderText="Police Verification Certificate" ItemStyle-Wrap="True">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Text='<%# Bind("police_verification") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.police_verification", "../police_verification_doc/{0}") %>'></asp:HyperLink>
                                                                <%-- <asp:Image ID="pvimage1" runat="server" Width="80px" Height="100px"/>--%>
                                                            </ItemTemplate>
                                                            <ItemStyle Height="50px" Width="50px" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Medical Examination Certificate" ItemStyle-Wrap="True">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" Text='<%# Bind("medical_examination") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.medical_examination", "../medical_examination_doc/{0}") %>'></asp:HyperLink>
                                                                <%-- <asp:Image ID="mvimage1" runat="server" Width="80px" Height="100px"/>--%>
                                                            </ItemTemplate>
                                                            <ItemStyle Height="50px" Width="50px" />
                                                        </asp:TemplateField>

                                                        <%-- <asp:BoundField DataField="police_verification" HeaderText="Police Verification" SortExpression="police_verification" ItemStyle-Wrap="false"></asp:BoundField>--%>
                                                        <asp:BoundField DataField="medical_report" HeaderText="Medical Report" SortExpression="medical_report" ItemStyle-Wrap="false"></asp:BoundField>


                                                        <asp:BoundField DataField="bank_name" HeaderText="Bank" SortExpression="bank_name" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="acc_no" HeaderText="Account No." SortExpression="acc_no" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="ifs_code" HeaderText="IFSC" SortExpression="ifs_code" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="emergency_contact_person_name" HeaderText="In case of Emergency Contact Person Name" SortExpression="emergency_contact_person_name" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="ecpn_ph_no" HeaderText="Contact Person Ph. No." SortExpression="ecpn_ph_no" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="security_approval" HeaderText="Dept Approval" SortExpression="dept_approval" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="security_approval" HeaderText="HR Approval" SortExpression="hr_approval" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="security_approval" HeaderText="Safety Approval" SortExpression="safety_approval" ItemStyle-Wrap="false"></asp:BoundField>
                                                        <asp:BoundField DataField="security_approval" HeaderText="Security Approval" SortExpression="security_approval" ItemStyle-Wrap="false"></asp:BoundField>

                                                        <%--   <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="../images/select.png" HeaderText="Select">
                                                            <ControlStyle Height="25px" Width="25px" />
                                                        </asp:CommandField>--%>
                                                    </Columns>

                                                    <AlternatingRowStyle BackColor="#FFFFFF" />
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle CssClass="GridPager" BackColor="#999999" ForeColor="#0033CC" HorizontalAlign="Center" BorderColor="#FF9900" Font-Bold="True" Font-Size="X-Large" />
                                                    <RowStyle BackColor="#FFFFFF" ForeColor="Black" />
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                                </asp:GridView>

                                                <div id="dialog" style="display: none">
                                                </div>

                                                <asp:Button ID="btnExportToExcel" Visible="false" runat="server" Text="Export To Excel" />
                                                <%--========================================================================================--%>
                                            </div>
                                        </div>
                                        <div></div>
                                        <div style="text-align-last: center">
                                            <asp:LinkButton ID="lbPrint" PostBackUrl="~/contractor_cell/emp-details-print.aspx" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="Blue">Print</asp:LinkButton>
                                        </div>
                                        <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>

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
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</div>

                            </div>
                        </div>
                    </footer>
                </td>
            </tr>
        </table>

        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js" defer></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
        <%--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>--%>

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

        <%-- <script type="text/jscript">
            $(window).on("load", function () {
                $('#GvEmp').DataTable({ responsive: true });
            });
        </script>--%>

        <!--Image zooming jquery fucntion for any html image element -->
        <%-- <script type="text/javascript">
            $(function () {
                $("#dialog").dialog({
                    autoOpen: false,
                    modal: true,
                    height: 600,
                    width: 600,
                    title: "Zoomed Image"
                });
                $("[id*=GvEmp] img").click(function () {
                    $('#dialog').html('');
                    $('#dialog').append($(this).clone());
                    $('#dialog').dialog('open');
                });
            });
        </script>--%>
    </form>
</body>
</html>
