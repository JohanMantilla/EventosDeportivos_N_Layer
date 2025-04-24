<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppEventosDeportivosEx1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sports Calendar Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: 
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><path d="M50,10 L90,50 L50,90 L10,50 Z" fill="rgba(255,255,255,0.03)"/></svg>'),
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="30" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="5"/></svg>');
            background-size: 200px 200px;
            animation: backgroundMove 15s linear infinite;
        }
        @keyframes backgroundMove {
            from { background-position: 0 0; }
            to { background-position: 200px 200px; }
        }
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
            position: relative;
            overflow: hidden;
        }
        .error-indicator {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: #ff0000;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .error-visible .error-indicator {
            opacity: 1;
        }
        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .login-header h2 {
            color: #1e3c72;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 800;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .sports-icon-container {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }
        .sports-icon {
            font-size: 2rem;
            color: #1e3c72;
            animation: bounce 2s infinite;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .form-group {
            margin-bottom: 1.8rem;
            position: relative;
        }
        .form-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #1e3c72;
        }
        .form-group input {
            width: 100%;
            padding: 1rem 1rem 1rem 45px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        .form-group input:focus {
            border-color: #1e3c72;
            box-shadow: 0 0 0 3px rgba(30, 60, 114, 0.2);
            outline: none;
        }
        #btnLogin {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        #btnLogin:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(30, 60, 114, 0.3);
            background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);
        }
        #lblMessage {
            display: none;
            background-color: #ffe6e6;
            color: #ff0000;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 500;
        }
        .message-visible {
            display: block !important;
        }
        @media (max-width: 480px) {
            .login-container {
                margin: 1.5rem;
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="error-indicator"></div>
        <div class="login-header">
            <div class="sports-icon-container">
                <i class="fas fa-running sports-icon"></i>
                <i class="fas fa-basketball-ball sports-icon"></i>
                <i class="fas fa-futbol sports-icon"></i>
            </div>
            <h2>Sports Calendar</h2>
        </div>
        <form id="formLogin" runat="server">
            <div class="form-group">
                <i class="fas fa-user"></i>
                <asp:TextBox ID="txtLogin" runat="server" placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-group">
                <i class="fas fa-lock"></i>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" />
            </div>
        </form>
    </div>

    <script type="text/javascript">
        // Mostrar/ocultar la línea roja y el mensaje cuando hay un error
        function checkError() {
            var message = document.getElementById('<%= lblMessage.ClientID %>');
            var container = document.querySelector('.login-container');
            
            if (message.innerHTML.trim() !== '') {
                message.classList.add('message-visible');
                container.classList.add('error-visible');
            } else {
                message.classList.remove('message-visible');
                container.classList.remove('error-visible');
            }
        }

        // Ejecutar al cargar la página y después de cada postback
        window.onload = checkError;
        if (typeof Sys !== 'undefined') {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(checkError);
        }
    </script>
</body>
</html>

