﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="purposed-emp-detail.aspx.cs" Inherits="clms2.safety_dept.purposed_emp_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CLMS | Safety Department | Dashboard</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="description" />
    <meta content="GreenHRM Solutions | Breaking Stereotypes" name="author" />

    <link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/newfront/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/newfront/datatables/datatables.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/icons.min.css" />
    <link rel="stylesheet" href="../public/newfront/assets/css/app.min.css" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css" />
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
        <table class="table">
            <tr>
                <td>
                    <nav class="navbar navbar-expand-lg transparent navbar-dark bg-dark">
                        <div class="container-fluid">
                            <%-- <a class="navbar-brand" href="#">clms</a>--%>
                            <div class="navbar-brand w-40">
                                <a class="navbar-brand" href="safety-dashboard.aspx">
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
                                        <a class="nav-link" href="safety-dashboard.aspx">Dashboard
                                <span class="visually-hidden">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle " href="#" id="navbarweb" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Employee <span class="fa fa-angle-down ms-1"></span></a>
                                        <ul class="dropdown-menu ">
                                            <li>
                                                <a class="dropdown-item" href="purposed-emp-detail-approval.aspx">
                                                    <i class="fa fa-angle-right me-1"></i> Emp Approval
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
                                        <span>Employee Detail</span>
                                        <%--<span><a href="work-order-entry.aspx" class="text-white">Add New</a></span>--%>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive" style="overflow: auto;">
                                            <%--========================================================================================--%>
                                            <%-- <asp:Button ID="CheckAll" runat="server" Text="Check All" />
 
<asp:Button ID="UncheckAll" runat="server" Text="Uncheck All" />--%>

                                            <asp:GridView ID="GvEmp" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                                                GridLines="Vertical" OnPageIndexChanging="GvEmp_PageIndexChanging" AllowPaging="true" PageSize="10" DataKeyNames="id" Class="table table-bordered nowrap" ShowHeaderWhenEmpty="true" OnRowCancelingEdit="GvEmp_RowCancelingEdit" OnRowEditing="GvEmp_RowEditing" OnRowUpdating="GvEmp_RowUpdating">

                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl. No">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>


                                                    <%--<asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk" runat="server"/>
                                </ItemTemplate>
                                <ItemStyle Width="10px" />
                            </asp:TemplateField> --%>


                                                    <asp:TemplateField HeaderText="Emp Name" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_name" runat="server" Text='<%#Eval("emp_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_add" runat="server" Text='<%#Eval("emp_add") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contact No. 1" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_ph_no1" runat="server" Text='<%#Eval("emp_ph_no1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contact No. 2" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emp_ph_no2" runat="server" Text='<%#Eval("emp_ph_no2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="E-Mail" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Gender" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_gender" runat="server" Text='<%#Eval("gender") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DOB" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_dob" runat="server" Text='<%#Eval("dob") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--   <asp:TemplateField HeaderText="Cast" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_emp_cast" runat="server" Text='<%#Eval("emp_cast") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Blood Grp" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_blood_grp" runat="server" Text='<%#Eval("blood_grp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Nationality" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_nationality" runat="server" Text='<%#Eval("nationality") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Aadhar No." ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_aadhar_no" runat="server" Text='<%#Eval("aadhar_no") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="UAN No." ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_pfno" runat="server" Text='<%#Eval("pfno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ESIC NO" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_escic" runat="server" Text='<%#Eval("escic") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--                 <asp:TemplateField HeaderText="Educational" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Educational" runat="server" Text='<%#Eval("education") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  --%>
                                                    <%--                 <asp:TemplateField HeaderText="Police Verification" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_police_verification" runat="server" Text='<%#Eval("police_verification") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>


                                                    <asp:TemplateField HeaderText="Police Verification">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Text='<%# Bind("police_verification") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.police_verification", "../police_verification_doc/{0}") %>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%--                  <asp:TemplateField HeaderText="Medical Examination" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_medical_examination" runat="server" Text='<%#Eval("medical_examination") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>


                                                    <asp:TemplateField HeaderText="Medical Examination">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" Text='<%# Bind("medical_examination") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.medical_examination", "../medical_examination_doc/{0}") %>'></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%--                  <asp:TemplateField HeaderText="Bank Name" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bank_name" runat="server" Text='<%#Eval("bank_name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Account No." ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="acc_no" runat="server" Text='<%#Eval("acc_no") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="IFSC" ItemStyle-Wrap="false">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ifs_code" runat="server" Text='<%#Eval("ifs_code") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="In case of Emergency Contact Person Name" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_emergency_contact_person_name" runat="server" Text='<%#Eval("emergency_contact_person_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contact Person Ph. No." ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_ecpn_ph_no" runat="server" Text='<%#Eval("ecpn_ph_no") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action By Safety">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_SafetyApproval" runat="server" Text='<%#Eval("safety_approval") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlApproval" runat="server">
                                                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                                                <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Safety Remarks" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_remarks" runat="server" Text='<%#Eval("safety_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_remarks" runat="server" Text='<%#Eval("safety_remarks") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                            <asp:Button ID="btn_Update" runat="server" Text="OK" CommandName="Update" />
                                                           <%-- <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />--%>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>
                                                <AlternatingRowStyle BackColor="#FFFFFF" />
                                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <HeaderStyle CssClass="myheader" BackColor="#eeeeee" Height="30px" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle CssClass="GridPager" BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#FFFFFF" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="Black" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#000065" />
                                            </asp:GridView>
                                            <%--  <asp:HiddenField ID="hfCount" runat="server" Value = "0" />--%>
                                            <%--========================================================================================--%>
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
        <script type="text/jscript">
            $(window).on("load", function () {
                $('#example').DataTable({ responsive: true });
            });
        </script>

    </form>
</body>

</html>
