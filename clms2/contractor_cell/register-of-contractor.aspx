<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register-of-contractor.aspx.cs" Inherits="clms2.contractor_cell.register_of_contractor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="public/common/icons/favicon.ico" type="icon/png" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport" />
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
        .nav-link
        {
            padding: 0.32rem 0.75rem;
        }
        
        .bg-dark
        {
            background-color: #292e40 !important;
        }
        
        .icon-svg, .icon-svg.icon-svg-lg
        {
            width: 3rem;
            height: 3rem;
        }
        
        img, svg
        {
            vertical-align: middle;
        }
        
        svg:not(:root)
        {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <%--<div class="loading">
            <div class="loader"></div>
        </div>--%>
    <table class="table">
        <tr>
            <td>
                 <nav class="navbar navbar-expand-lg transparent navbar-dark bg-dark">
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
                                        <a class="nav-link dropdown-toggle " href="#"  data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Compliances <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/purposed-wages-doc-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Wages Document 
                                                </a>
                                            </li>
                                           
                                        </ul>
                                    </li>
                                     <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#"  data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Statutory <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/register-of-contractor.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Registor of Contractors 
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/annual-return.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Annual Return
                                                </a>
                                            </li>
                                             <li>
                                                <a class="dropdown-item" href="../contractor_cell/emp_chart_report.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Employee Chart Report
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="../contractor_cell/vendor_chart.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Vendor Chart
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
    </table>
    <!--======================================================================================= -->
    <div class="container">
        <div class="text-center">
            <h6 class="mb-0">
                FORM XII</h6>
            <h6 class="my-0">
                (Sec rule 74)</h6>
            <h5 class="my-0">
                Register of Contractors</h5>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label>
                        Principal Employer Name</label>
                    <asp:TextBox ID="txtPrincipalEmpName" runat="server" class="form-control m-b-0 m-t-0"
                        placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true"
                        ControlToValidate="txtPrincipalEmpName" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label>
                        Principal Employer Address</label>
                    <asp:TextBox ID="txtPrincipalEmpAdd" runat="server" class="form-control m-b-0 m-t-0"
                        placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true"
                        ControlToValidate="txtPrincipalEmpAdd" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label>
                        Name of establishment</label>
                    <asp:TextBox ID="txtEstbName" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true"
                        ControlToValidate="txtEstbName" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label>
                        Address of establishment</label>
                    <asp:TextBox ID="txtEstbAdd" runat="server" class="form-control m-b-0 m-t-0" placeholder=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="true"
                        ControlToValidate="txtEstbAdd" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>

    <br/> <br/><br/><br/> <br/><br/>   
    
     <!-- ===================================================================================== -->
    <div class="container-fluid mx-0 px-0">
        <div class="row">
            <div class="page-wrapper">
                <div class="">
                    <div class="container-fluid">
                        <div class="card-body">
                            <div class="table-responsive" style="overflow: auto;">
                                <%--========================================================================================--%>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                                    AllowPaging="True" DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                    OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" EmptyDataText="No records has been added."
                                    Class="table table-bordered nowrap" ShowHeaderWhenEmpty="True">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="1. Sl. No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2. Name andaddress ofcontractor" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNameAddrContractor" runat="server" Text='<%# Eval("vendor_code")%>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="3. Nature of workon contract " ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNatureWork" runat="server" Text='<%# Eval("workorderno")%>'></asp:Label>
                                            </ItemTemplate>
                                            <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="txtWorkorderno" runat="server" Text='<%# Eval("workorderno")%>' Width="140"></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="4. Location ofcontractwork" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocationContractWork" runat="server" Text='<%# Eval("emp_code")%>'></asp:Label>
                                            </ItemTemplate>
                                            <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="txtEmp_code" runat="server" Text='<%# Eval("emp_code")%>' Width="140"></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="5. Period_From" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPeriodFrom" runat="server" Text='<%# Eval("emp_name")%>'></asp:Label>
                                            </ItemTemplate>
                                            <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="txtEmpName" runat="server" Text='<%# Eval("emp_name")%>' Width="140"></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="6. Period_To " ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPeriodTo" runat="server" Text='<%# Eval("skill_category")%>'></asp:Label>
                                            </ItemTemplate>
                                            <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="txtSkillCategory" runat="server" Text='<%# Eval("skill_category")%>' Width="140"></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="7. of contract Maximum number of workmen employed by contractor" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMaxWorkedEmpByContractor" runat="server" Text='<%# Eval("basic")%>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
                                       
                                        <asp:CommandField ButtonType="Link" HeaderText="Action" ShowEditButton="true" ItemStyle-Width="150">
                                            <ItemStyle Width="150px" />
                                        </asp:CommandField>
                                    </Columns>
                                    <AlternatingRowStyle BackColor="#FFFFFF" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True"
                                        ForeColor="White" />
                                    <PagerStyle CssClass="GridPager" BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#B2DFDB" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                                <%--========================================================================================--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid mx-0 px-0">
        <div class="row">
            <footer class="py-3 bg-dark mt-auto navbar-fixed-bottom">
                        <div class="container-fluid">
                            <div class="text-center small">
                                <div class="text-light ">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</div>

                            </div>
                        </div>
                    </footer>
            </td>
        </div>
    </div>
    <%--<div class="alert alert-success animated fadeInUp">
            Logged out Successfully
        </div>--%>
    <script type="text/jscript" src="~/public/newfront/js/jquery.min.js"></script>
    <script type="text/jscript" src="~/public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
    <script type="text/jscript" src="~/public/newfront/assets/js/app.js" defer></script>
    <script type="text/jscript" src="~/public/newfront/datatables/datatables.min.js"
        defer></script>
    <script type="text/jscript" src="~/public/newfront/js/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
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
    </form>
</body>
</html>
