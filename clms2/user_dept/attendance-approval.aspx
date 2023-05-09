<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attendance-approval.aspx.cs" Inherits="clms2.user_dept.attendance_approval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />

    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link href="~/public/common/css/bootswatchTheme.css" rel="stylesheet" />
    <link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css" />

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

        .gridview-container {
            overflow: auto;
            width: 700px; /* set your desired width here */
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
                    <nav class="navbar navbar-expand-lg transparent navbar-dark bg-dark">
                        <div class="container-fluid">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="dept-home.aspx">
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
                                        <a class="nav-link" href="dept-home.aspx">Dashboard
                                <span class="visually-hidden">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employee <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="vendor-list.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Emp Approval
                                                </a>
                                            </li>


                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarAdmin" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Attendance <span class="fa fa-angle-down ms-1"></span>
                                        </a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="../user_dept/attendance-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i>Attendance Approval
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
                                <div class="card shadow border">
                                    <div class="card-heading bg-dark text-white p-2 d-flex justify-content-between">
                                        <span>Attendance Details</span>

                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow:scroll; width:70%">
                                            <%--========================================================================================--%>
                                            <asp:DropDownList ID="ddlWorkOrder" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlWorkOrder_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:Label ID="lblMSG" runat="server" Text="" Font-Size="15" ForeColor="Red"></asp:Label>
                                            <asp:Label ID="lblVendorName" runat="server" Text="" Font-Size="15" ForeColor="Blue"></asp:Label>

                                            <asp:GridView ID="GvAttn" runat="server" CssClass="gridview-container" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                GridLines="Vertical" DataKeyNames="id" Class="table table-bordered nowrap" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GvAttn_PageIndexChanging" OnRowCancelingEdit="GvAttn_RowCancelingEdit" OnRowEditing="GvAttn_RowEditing" OnRowUpdating="GvAttn_RowUpdating">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl. No">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>


                                                    <%--<asp:BoundField DataField="vendor_name" HeaderText="Vendor Name" SortExpression="vendor_name" ItemStyle-Wrap="false"></asp:BoundField>--%>


                                                    <%--    <asp:BoundField DataField="workorder" HeaderText="Work Order" SortExpression="workorder" ItemStyle-Wrap="false"></asp:BoundField>--%>
                                                    <asp:TemplateField HeaderText="Vendor Code" SortExpression="vendor_code">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("vendor_code") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("vendor_code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="70px" />
                                                        <ItemStyle Width="10px" Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Emp Code">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id") %>' Text='<%# Eval("emp_code") %>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="150px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Emp Name" SortExpression="emp_name">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("emp_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label44" runat="server" Text='<%# Bind("emp_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <%--<ControlStyle Width="200px" />--%>
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Department" SortExpression="department">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("emp_name") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Year" SortExpression="year1">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("year1") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("year1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Month" SortExpression="month1">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("month1") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("month1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D1" SortExpression="d1">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("d1") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("d1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D2" SortExpression="d2">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("d2") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("d2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D3" SortExpression="d3">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("d3") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("d3") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D4" SortExpression="d4">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("d4") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("d4") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D5" SortExpression="d5">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("d5") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("d5") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D6" SortExpression="d6">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("d6") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("d6") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D7" SortExpression="d7">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("d7") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("d7") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D8" SortExpression="d8">
                                                     <%--   <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("d8") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("d8") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D9" SortExpression="d9">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("d9") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("d9") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D10" SortExpression="d10">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("d10") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("d10") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D11" SortExpression="d11">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("d11") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("d11") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D12" SortExpression="d12">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("d12") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("d12") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D13" SortExpression="d13">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("d13") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("d13") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D14" SortExpression="d14">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("d14") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("d14") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D15" SortExpression="d15">
                                                        <%--<EditItemTemplate>
                                                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("d15") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("d15") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D16" SortExpression="d16">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("d16") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label19" runat="server" Text='<%# Bind("d16") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D17" SortExpression="d17">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("d17") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label20" runat="server" Text='<%# Bind("d17") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D18" SortExpression="d18">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("d18") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label21" runat="server" Text='<%# Bind("d18") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D19" SortExpression="d19">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("d19") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Bind("d19") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D20" SortExpression="d20">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("d20") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23" runat="server" Text='<%# Bind("d20") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D21" SortExpression="d21">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("d21") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label24" runat="server" Text='<%# Bind("d21") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D22" SortExpression="d22">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("d22") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label25" runat="server" Text='<%# Bind("d22") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D23" SortExpression="d23">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("d23") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Bind("d23") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D24" SortExpression="d24">
                                                     <%--   <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("d24") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label27" runat="server" Text='<%# Bind("d24") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D25" SortExpression="d25">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("d25") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Bind("d25") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D26" SortExpression="d26">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("d26") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label29" runat="server" Text='<%# Bind("d26") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D27" SortExpression="d27">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("d27") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label30" runat="server" Text='<%# Bind("d27") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D28" SortExpression="d28">
                                                     <%--   <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("d28") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label31" runat="server" Text='<%# Bind("d28") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D29" SortExpression="d29">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("d29") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label32" runat="server" Text='<%# Bind("d29") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D30" SortExpression="d30">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("d30") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label33" runat="server" Text='<%# Bind("d30") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="D31" SortExpression="d31">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("d31") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label34" runat="server" Text='<%# Bind("d31") %>'></asp:Label>
                                                        </ItemTemplate>
                                                         <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Present" SortExpression="Present">
                                                    <%--    <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox34" runat="server" Text='<%# Bind("Present") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label35" runat="server" Text='<%# Bind("Present") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="30px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Absent" SortExpression="Absent">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox35" runat="server" Text='<%# Bind("Absent") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label36" runat="server" Text='<%# Bind("Absent") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tot. Working Day" SortExpression="tot_working_day">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("tot_working_day") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Bind("tot_working_day") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tot. Leave" SortExpression="tot_leave">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox37" runat="server" Text='<%# Bind("tot_leave") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Bind("tot_leave") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tot. HL" SortExpression="tot_holidays">
                                                      <%--  <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox38" runat="server" Text='<%# Bind("tot_holidays") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label39" runat="server" Text='<%# Bind("tot_holidays") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tot. Week off" SortExpression="tot_week_off">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox39" runat="server" Text='<%# Bind("tot_week_off") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label40" runat="server" Text='<%# Bind("tot_week_off") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Working Hrs" SortExpression="daily_working_hrs">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("daily_working_hrs") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("daily_working_hrs") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Monthly Working Hrs" SortExpression="monthly_work_hrs">
                                                    <%--    <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("monthly_work_hrs") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label42" runat="server" Text='<%# Bind("monthly_work_hrs") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Monthly OT Hrs" SortExpression="monthly_ot_hrs">
                                                       <%-- <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("monthly_ot_hrs") %>'></asp:TextBox>
                                                        </EditItemTemplate>--%>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label43" runat="server" Text='<%# Bind("monthly_ot_hrs") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="50px" />
                                                        <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Action By Dept">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_DeptApproval" runat="server" Text='<%#Eval("dept_approval") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlDeptApproval" runat="server" AutoPostBack="false">
                                                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                                                <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dept Remarks" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_DeptRemarks" runat="server" Text='<%#Eval("dept_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_DeptRemarks" runat="server" Text='<%#Eval("dept_remarks")%>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                            <asp:Button ID="btn_Update" runat="server" Text="OK" CommandName="Update" />
                                                            <%--<asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />--%>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <AlternatingRowStyle BackColor="#FFFFFF" />
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="White" />
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
                            <%--<h6 style="text-align: right; color: green">Present=18 | Absent=8  | WO=4</h6>--%>
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
        <%--<div class="alert alert-success animated fadeInUp">
            Logged out Successfully
        </div>--%>
        <script type="text/jscript" src="../public/newfront/js/jquery.min.js"></script>
        <script type="text/jscript" src="../public/newfront/jquery-ui/jquery-ui.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/assets/js/app.js" defer></script>
        <script type="text/jscript" src="../public/newfront/datatables/datatables.min.js" defer></script>
        <script type="text/jscript" src="../public/newfront/js/jquery.validate.min.js"></script>
        <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>--%>

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
                $('#GvAttn').DataTable({ responsive: true });
            });
        </script>--%>
    </form>
</body>
</html>
