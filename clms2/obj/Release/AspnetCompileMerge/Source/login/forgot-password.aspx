<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="clms2.login.forgot_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLMS | Forgot Password</title>
    <link rel="stylesheet" href="../login_css/bootstrap.min.css" />
    <link rel="stylesheet" href="../login_css/bootstrap-select.css" />
    <link href="../login_css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <!--fonts-->
    <link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css' />
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">
        <%--for blue color = style="background-color: #0b4e47;"--%>
        <div class="header" style="background-color: black;">
            <div class="container">
                <div class="logo">
                    <%--<a href="#">GreenHRM</a>--%>
                   <%-- <img src="../images/greenhrm.png" title="GreenHRM" alt="GreenHRM" />--%>
                     <img src="../public/common/images/straight_logo_greenhrm.png" class="logo-lg logo-light" alt="GreenHRM Solutions | Breaking Stereotypes Logo" width="188" height="50" />
                </div>
                <div class="header-right">
                    <%--			<a class="account" href="#">Admin Login</a>&nbsp;&nbsp;
			<a class="account" href="#">Vendor Login</a>&nbsp;&nbsp;--%>
                    <!--<a class="account" href="#">Register Now!</a>-->
                    <!-- Large modal -->

                </div>
            </div>
        </div>

        <section>

            <div id="page-wrapper" class="sign-in-wrapper">
                <div class="graphs">
                    <div class="sign-in-form">
                        <div class="sign-in-form-top">
                            <h1>Forgot Password</h1>
                        </div>
                        <div class="signin">
                            <div class="log-input" style="margin-top: -15px;">
                                <div class="log-input-left">
                                    Enter Your Email
                                   <asp:TextBox ID="txtEmail" runat="server"  class="user"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"></asp:Button>
                            <asp:Label CssClass="text-primary" ID="lblMsg" runat="server" Font-Bold="True" />
                             <asp:Label CssClass="text-danger" ID="lblError" runat="server" Font-Bold="True" />
                            
                            <div class="signin-rit">
                                <div class="clearfix"></div>
                            </div>
                         </div>
                        <div class="new_people">
                            <a href="login.aspx">Back to Login</a>
                        </div>
                    </div>
                </div>
            </div>

            <!--footer section start-->
            <footer class="diff" style="height: 25px;">
                <p class="text-center">&copy; 2022 | GreenHRM Solutions | All Rights Reserved</p>
            </footer>
            <!--footer section end-->
        </section>
    </form>
</body>
</html>
