<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new-password.aspx.cs" Inherits="clms2.login.new_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLMS | Create Login Password</title>
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
        <%--green color code = style="background-color:black ;--%>
        <div class="header" style="background-color:black";>
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
                            <h1>Change Login Password</h1>
                        </div>
                        <div class="signin">
                            <div class="log-input" style="margin-top: -15px;">
                                <div class="log-input-left">
                                    Enter Login ID
                                   <asp:TextBox ID="txtUserID" runat="server" class="user" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter User ID:';}"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="log-input">
                                <div class="log-input-left">
                                    Current Password
                                   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="user" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Current Password:';}"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="log-input">
                                <div class="log-input-left">
                                    Enter New Password
                                   <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" class="user" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'New Password:';}"></asp:TextBox>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <asp:Button ID="cmdSubmit" runat="server" Text="Submit" OnClick="cmdSubmit_Click"></asp:Button>
                            <asp:Label CssClass="text-danger" ID="lblMsg" runat="server" />
                            <div class="signin-rit">
                                <div class="clearfix"></div>
                            </div>

                        </div>

                        <div class="new_people">
                            <a href="login.aspx">Log Out</a>
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
