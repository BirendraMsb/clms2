<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="clms2.login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLMS | Login!</title>

<link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
<link rel="stylesheet" href="../public/common/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="../public/common/vendors/fontawesome/css/all.min.css" />
<link rel="stylesheet" href="../public/common/css/commoncss.min.css" />
  
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
    <style type="text/css">
        .auto-style1 {
            width: 312px;
        }
        .auto-style2 {
            height: 10px;
            width: 312px;
        }
    </style>
</head>
<head>
    <title>CLMS | Login!</title>
    <link rel="icon" href="../public/common/icons/favicon.ico" type="icon/png" />
    <link rel="stylesheet" href="../public/common/css/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/common/vendors/fontawesome/css/all.min.css" />
    <link rel="stylesheet" href="../public/common/css/commoncss.min.css" />

    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />
    <style type="text/css">
        .auto-style2 {
            height: 10px;
        }
        </style>
</head>
<body class="login">
    <form id="form1" runat="server">
        <div class="container h-100">
            <div class="login_name_wrapper">
                <div class="text-center mb-4">
                    <h4 class="robotobold">Green<span class="robotonormal">HRM</span><span class="robotonormal"> Solutions</span></h4>
                </div>
            </div>
            <div class="d-flex justify-content-center h-50">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="login_logo_container">
                            <img sizes="(max-width: 150px) 100vw, 150px"
                                srcset="../public/common/images/logoicon/Makewhite_kgvyyw_c_scale,w_150.png 150w"
                                src="../public/common/images/logoicon/Makewhite_kgvyyw_c_scale,w_150.png"
                                class="login_logo" alt="GreenHRM Solutions | Breaking Stereotypes Logo" width="150" height="150" />
                        </div>
                    </div>
                    <div class="form_container">
                        <div class="text-center mb-4">
                            <h4 class="robotobold">Admin
					    <span class="robotonormal">Login</span></h4>
                        </div>
                        <div class="d-flex justify-content-center">
                            <table>
                                <tr>
                                    <td>
                                        <div class="input-group">
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="fa fa-users"></i>
                                                </span>
                                            </div>
                                              <asp:DropDownList ID="ddlUserType" class="form-control" runat="server" Height="35px">
                                              </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * " ControlToValidate="ddlUserType" SetFocusOnError="true" InitialValue="UserType" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
                                           <%-- <asp:DropDownList ID="ddlUserType" class="form-control" runat="server" Height="35px">
                                                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                                <asp:ListItem Value="Dept">User Department</asp:ListItem>
                                                <asp:ListItem Value="CC">Contractor Cell</asp:ListItem>
                                                <asp:ListItem Value="Safety">Safety</asp:ListItem>
                                                <asp:ListItem Value="Gatepass">Gatepass</asp:ListItem>
                                                <asp:ListItem Value="Vendor">Vendor</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="input-group">
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtLogin" class="form-control" runat="server" placeholder="Login ID"></asp:TextBox>  
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * " ControlToValidate="txtLogin" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="input-group">
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="fa fa-key"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtPWD" class="form-control" runat="server" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password:';}" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * " ControlToValidate="txtPWD" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="txtSubmit" runat="server" Text="Log in" class="btn login_btn" OnClick="txtSubmit_Click" Width="311px"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Small"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <%--	<div class="errormessage mb-4">

						</div><br />--%>
                            <%--<div class="errormessage mb-4">

						</div>--%>
                            <%--<div class="d-flex justify-content-center mt-3 login_container">
							
						</div>--%>
                        </div>
                    </div>
                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            <a href="forgot-password.aspx">Forgot password?</a>
                        </div>
                    </div>
                    <div class="mt-4 d-flex justify-content-center">
                        <p class="mb-0">&copy; 2022 GreenHRM Solutions | Breaking Stereotypes</p>
                    </div>
                </div>
            </div>
        </div>

    </form>


    <script src="../public/common/js/jquery.min.js"></script>
    <script src="../public/common/js/jquery.validate.min.js"></script>
    <script defer>
        window.onload = function () {
            $("alert").fadeTo(5000, 500).slideUp(500, function () {
                $(".alert").slideUp(500);
            });
            $("#login_form").validate({
                rules: {
                    adminemail: {
                        required: true,
                        email: true,
                        maxlength: 200,
                    },
                    adminpassword: "required",
                },
                errorPlacement: function (error, element) {
                    $(element).parents('.errormessage').append(error)
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });
        }
    </script>
</body>
</html>
