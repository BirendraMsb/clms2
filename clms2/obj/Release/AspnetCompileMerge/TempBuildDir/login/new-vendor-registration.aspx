<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new-vendor-registration.aspx.cs" Inherits="clms2.login.new_vendor_registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLMS | New Vendor Registratio</title>
<link rel="stylesheet" href="../login_css/bootstrap.min.css"/>
<link rel="stylesheet" href="../login_css/bootstrap-select.css"/>
<link href="../login_css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'/>
</head>
<body>
    <form id="form1" runat="server">
<div class="header" style="background-color:#0b4e47;">
		<div class="container">
			<div class="logo">
				<%--<a href="#">GreenHRM</a>--%>
                <img src="../images/greenhrm.png" title="GreenHRM" alt="GreenHRM" />
			</div>
			<div class="header-right">
<%--			<a class="account" href="#">Admin Login</a>&nbsp;&nbsp;
			<a class="account" href="#">Vendor Login</a>&nbsp;&nbsp;--%>
			 <!--<a class="account" href="#">Register Now!</a>-->
	<!-- Large modal -->
  
		</div>
		</div>
	</div>
    <asp:Label ID="lblMSG" runat="server" Text=""></asp:Label>
	 <section>
	 	 
			<div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-in-form">
					<%--	<div class="sign-in-form-top">
							<h1>Log in</h1>
						</div>--%>
						<div class="signin">
							<div class="log-input">
								<div class="log-input-left">Vendor Reg. Code :
								   <asp:TextBox ID="txtVRegNo" runat="server" class="user"></asp:TextBox>
								</div>
			 
								<div class="clearfix"> </div>
							</div>
							<div class="log-input">
								<div class="log-input-left">E-Mail 
                                   <asp:TextBox ID="txtEMail" runat="server" class="user"></asp:TextBox>
								</div>
				 
								<div class="clearfix"> </div>
							</div>
							<%--<input type="submit" name="login" value="Submit">--%>
                            <asp:Button ID="cmdSubmit" runat="server" Text="Submit"></asp:Button>
							<div class="signin-rit">
						<%--	<span class="checkbox1">
								 <label class="checkbox"><input type="checkbox" name="checkbox" unchecked="">Forgot Password ?</label>
							</span>
							<p><a href="forgot-password.aspx">Click Here</a></p>--%>
                            <p><br /><br /><br /><br /></p>
							<div class="clearfix"> </div>
						    </div>
					 
						</div>
						
				 
					</div>
				</div>
			</div>
	 
		<!--footer section start-->
			<footer class="diff">
			   <p class="text-center">© 2005-2022 Kshitij Info Solutions</p>
			</footer>
        <!--footer section end-->
	</section>
    </form>
</body>
</html>
