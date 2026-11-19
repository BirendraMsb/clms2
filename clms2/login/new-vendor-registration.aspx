<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new-vendor-registration.aspx.cs" Inherits="clms2.login.new_vendor_registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Vendor Registration &bull; Contract Labour Management System</title>

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
            max-width: 480px;
            position: relative;
            z-index: 1;
        }

        .login-card {
            background: var(--brand-card-bg);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 1.25rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(255, 255, 255, 0.05);
            padding: 2.5rem 2.25rem;
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

        .form-control {
            border: none !important;
            box-shadow: none !important;
            padding: 0.75rem 0.85rem;
            font-size: 0.95rem;
            color: #0f172a;
            background-color: #ffffff;
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

        .card-divider {
            height: 1px;
            background: #e2e8f0;
            margin: 1.5rem 0 1.25rem 0;
        }

        .footer-note {
            text-align: center;
            color: rgba(255, 255, 255, 0.55);
            font-size: 0.8125rem;
            margin-top: 1.75rem;
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
                <h1 class="login-title">Vendor Registration</h1>
                <p class="login-subtitle">Initiate new contractor onboarding and verification</p>
            </div>

            <!-- Messages -->
            <div class="text-center mb-3">
                <asp:Label CssClass="text-danger fw-bold small d-block" ID="lblMSG" runat="server" Text=""></asp:Label>
            </div>

            <!-- Vendor Reg Code -->
            <div class="mb-3">
                <label class="form-label" for="txtVRegNo">
                    <i class="fa fa-building text-primary me-1"></i> Vendor Reg. Code
                </label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-id-card"></i></span>
                    <asp:TextBox ID="txtVRegNo" CssClass="form-control" runat="server" 
                        placeholder="Enter vendor registration code">
                    </asp:TextBox>
                </div>
            </div>

            <!-- Email -->
            <div class="mb-4">
                <label class="form-label" for="txtEMail">
                    <i class="fa fa-envelope text-primary me-1"></i> Official Email Address
                </label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-at"></i></span>
                    <asp:TextBox ID="txtEMail" CssClass="form-control" runat="server" 
                        placeholder="vendor@company.com" TextMode="Email" autocomplete="email">
                    </asp:TextBox>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="mb-2">
                <asp:Button ID="cmdSubmit" runat="server" Text="Submit Registration" 
                    Cssclass="btn-submit w-100 rounded-pill">
                </asp:Button>
            </div>

            <div class="card-divider"></div>

            <!-- Back to Login -->
            <div class="text-center">
                <a href="login.aspx" class="text-decoration-none text-primary fw-semibold small d-inline-flex align-items-center">
                    <i class="fa fa-arrow-left me-1"></i> Already registered? Sign In
                </a>
            </div>
        </div>

        <div class="footer-note">
            &copy; <%= DateTime.Now.Year %> <strong>Electro Solutions</strong> &bull; All Rights Reserved
        </div>
    </form>
</body>
</html>
