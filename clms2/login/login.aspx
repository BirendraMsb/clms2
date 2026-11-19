<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="clms2.login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Sign In &bull; Contract Labour Management System</title>

    <link rel="icon" href="../public/common/icons/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../public/common/css/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="../public/common/vendors/fontawesome/css/all.min.css" />

    <!-- Google Fonts for modern typography -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />

    <style type="text/css">
        :root {
            --brand-primary: #0d6efd;
            --brand-primary-dark: #0a58ca;
            --brand-dark: #0b1329;
            --brand-card-bg: #ffffff;
        }

        * {
            box-sizing: border-box;
        }

        body.login-page {
            font-family: 'Plus Jakarta Sans', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 100vh;
            background: radial-gradient(ellipse at 80% 20%, #1e3a5f 0%, #0d1b2a 45%, #080d1a 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
            overflow-x: hidden;
        }

        /* Ambient background glow effects */
        body.login-page::before {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(13, 110, 253, 0.15) 0%, rgba(13, 110, 253, 0) 70%);
            top: -100px;
            left: -100px;
            pointer-events: none;
            z-index: 0;
        }

        body.login-page::after {
            content: "";
            position: absolute;
            width: 450px;
            height: 450px;
            background: radial-gradient(circle, rgba(14, 165, 233, 0.12) 0%, rgba(14, 165, 233, 0) 70%);
            bottom: -80px;
            right: -80px;
            pointer-events: none;
            z-index: 0;
        }

        .login-wrapper {
            width: 100%;
            max-width: 460px;
            position: relative;
            z-index: 1;
        }

        .login-card {
            background: var(--brand-card-bg);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 1.25rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(255, 255, 255, 0.05);
            padding: 2.5rem 2.25rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .brand-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .brand-logo-wrap {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.25rem;
            background: #ffffff;
            border-radius: 0.75rem;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            margin-bottom: 1.25rem;
        }

        .brand-logo-wrap img {
            height: 42px;
            width: auto;
            object-fit: contain;
        }

        .login-title {
            font-size: 1.5rem;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.025em;
            margin-bottom: 0.35rem;
        }

        .login-subtitle {
            font-size: 0.875rem;
            color: #64748b;
            margin-bottom: 0;
        }

        .form-label {
            font-size: 0.8125rem;
            font-weight: 700;
            color: #334155;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            margin-bottom: 0.375rem;
        }

        .input-group {
            border-radius: 0.625rem;
            overflow: hidden;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.04);
            border: 1px solid #cbd5e1;
            transition: all 0.2s ease;
        }

        .input-group:focus-within {
            border-color: var(--brand-primary);
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.15);
        }

        .input-group-text {
            background-color: #f8fafc;
            border: none;
            color: #64748b;
            padding-left: 1rem;
            padding-right: 0.85rem;
            font-size: 0.95rem;
        }

        .form-control, .form-select {
            border: none !important;
            box-shadow: none !important;
            padding: 0.75rem 0.85rem;
            font-size: 0.95rem;
            color: #0f172a;
            background-color: #ffffff;
        }

        .form-control::placeholder {
            color: #94a3b8;
            font-size: 0.9rem;
        }

        .btn-toggle-pwd {
            background-color: #ffffff;
            border: none;
            color: #64748b;
            padding-right: 1rem;
            cursor: pointer;
            transition: color 0.15s ease;
        }

        .btn-toggle-pwd:hover {
            color: #0f172a;
        }

        .btn-submit {
            background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
            border: none;
            border-radius: 0.625rem;
            padding: 0.85rem 1.5rem;
            font-size: 1rem;
            font-weight: 700;
            letter-spacing: 0.01em;
            color: #ffffff;
            box-shadow: 0 4px 14px rgba(13, 110, 253, 0.35);
            transition: all 0.25s ease;
            cursor: pointer;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #0b5ed7 0%, #094bb5 100%);
            box-shadow: 0 6px 20px rgba(13, 110, 253, 0.45);
            transform: translateY(-1px);
            color: #ffffff;
        }

        .btn-submit:active {
            transform: translateY(0);
            box-shadow: 0 2px 8px rgba(13, 110, 253, 0.3);
        }

        .forgot-link {
            font-size: 0.8125rem;
            font-weight: 600;
            color: var(--brand-primary);
            text-decoration: none;
            transition: color 0.15s ease;
        }

        .forgot-link:hover {
            color: var(--brand-primary-dark);
            text-decoration: underline;
        }

        .validation-hint {
            font-size: 0.8rem;
            font-weight: 600;
            color: #dc3545;
            margin-top: 0.35rem;
            display: block;
        }

        .system-pill {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            background: rgba(13, 110, 253, 0.08);
            color: #0d6efd;
            border: 1px solid rgba(13, 110, 253, 0.15);
            border-radius: 2rem;
            padding: 0.25rem 0.85rem;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            margin-bottom: 0.75rem;
        }

        .system-pill i {
            font-size: 0.65rem;
        }

        .alert-custom {
            border-radius: 0.625rem;
            padding: 0.75rem 1rem;
            font-size: 0.875rem;
            font-weight: 600;
            background-color: #fee2e2;
            border: 1px solid #fca5a5;
            color: #991b1b;
        }

        .footer-note {
            text-align: center;
            color: rgba(255, 255, 255, 0.55);
            font-size: 0.8125rem;
            margin-top: 1.75rem;
        }

        .footer-note a {
            color: rgba(255, 255, 255, 0.85);
            text-decoration: none;
            font-weight: 600;
        }

        .footer-note a:hover {
            color: #ffffff;
            text-decoration: underline;
        }

        .card-divider {
            height: 1px;
            background: #e2e8f0;
            margin: 1.5rem 0 1.25rem 0;
        }
    </style>
</head>
<body class="login-page">
    <form id="form1" runat="server" class="login-wrapper">
        <div class="login-card">
            <!-- Brand & Heading -->
            <div class="brand-header">
                <a href="../default.aspx" title="Go to Homepage" class="d-inline-block">
                    <div class="brand-logo-wrap">
                        <img src="../public/common/images/ElectroSolHeader3.png" alt="Electro Solutions Logo" />
                    </div>
                </a>
                <div>
                    <span class="system-pill">
                        <i class="fa fa-circle"></i> CLMS Enterprise Portal
                    </span>
                </div>
                <h1 class="login-title">Sign In</h1>
                <p class="login-subtitle">Contract Labour Management System</p>
            </div>

            <!-- Status / Error Notification -->
            <div id="msgContainer" class="text-center mb-3">
                <asp:Label ID="lblMsg" runat="server" CssClass="text-danger fw-bold small"></asp:Label>
            </div>

            <!-- Role Selector -->
            <div class="mb-3">
                <label class="form-label" for="ddlUserType">
                    <i class="fa fa-users text-primary me-1"></i> User Role / Portal
                </label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-id-badge"></i></span>
                    <asp:DropDownList ID="ddlUserType" CssClass="form-select" runat="server">
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="* Please select a valid user role" 
                    ControlToValidate="ddlUserType" 
                    SetFocusOnError="true" 
                    InitialValue="UserType" 
                    CssClass="validation-hint" 
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- User ID Input -->
            <div class="mb-3">
                <label class="form-label" for="txtLogin">
                    <i class="fa fa-user text-primary me-1"></i> Login ID / Code
                </label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-user-circle"></i></span>
                    <asp:TextBox ID="txtLogin" CssClass="form-control" runat="server" 
                        placeholder="Enter your user ID" autocomplete="username">
                    </asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="* Login ID is required" 
                    ControlToValidate="txtLogin" 
                    SetFocusOnError="true"
                    CssClass="validation-hint" 
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Password Input -->
            <div class="mb-4">
                <div class="d-flex justify-content-between align-items-center mb-1">
                    <label class="form-label mb-0" for="txtPWD">
                        <i class="fa fa-lock text-primary me-1"></i> Password
                    </label>
                    <a href="forgot-password.aspx" class="forgot-link">Forgot password?</a>
                </div>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-key"></i></span>
                    <asp:TextBox ID="txtPWD" CssClass="form-control" runat="server" 
                        TextMode="Password" placeholder="Enter your password" autocomplete="current-password">
                    </asp:TextBox>
                    <button type="button" class="btn-toggle-pwd" id="btnTogglePwd" onclick="togglePasswordVisibility()" title="Show/Hide Password" aria-label="Toggle password visibility">
                        <i class="fa fa-eye" id="toggleIcon"></i>
                    </button>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="* Password is required" 
                    ControlToValidate="txtPWD" 
                    SetFocusOnError="true"
                    CssClass="validation-hint" 
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Submit Button -->
            <div class="mb-2">
                <asp:Button ID="txtSubmit" runat="server" Text="Log In" 
                    Cssclass="btn-submit w-100 rounded-pill" OnClick="txtSubmit_Click">
                </asp:Button>
            </div>

            <div class="card-divider"></div>

            <!-- Navigation Links -->
            <div class="d-flex justify-content-between align-items-center text-muted small">
                <a href="../default.aspx" class="text-decoration-none text-secondary d-inline-flex align-items-center">
                    <i class="fa fa-arrow-left me-1"></i> Return to Home
                </a>
                <a href="new-vendor-registration.aspx" class="text-decoration-none text-primary fw-semibold">
                    New Vendor? Register
                </a>
            </div>
        </div>

        <!-- Footer Copyright -->
        <div class="footer-note">
            &copy; <%= DateTime.Now.Year %> <strong>Electro Solutions</strong> &bull; All Rights Reserved
        </div>
    </form>

    <script src="../public/common/js/jquery.min.js"></script>
    <script>
        function togglePasswordVisibility() {
            var pwdField = document.getElementById('<%= txtPWD.ClientID %>');
            var icon = document.getElementById('toggleIcon');
            if (pwdField.type === "password") {
                pwdField.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                pwdField.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }

        // Style the message if it has text from server postback
        $(document).ready(function () {
            var msg = $('#<%= lblMsg.ClientID %>').text().trim();
            if (msg.length > 0) {
                $('#msgContainer').html('<div class="alert-custom mb-3 d-flex align-items-center justify-content-center"><i class="fa fa-exclamation-triangle me-2"></i><span>' + msg + '</span></div>');
            }
        });
    </script>
</body>
</html>
