<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginingles.aspx.cs" Inherits="ProyectoPTC2022.Loginingles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="Font-awesome/css/fontawesome.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,400&display=swap" rel="stylesheet" />
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Big Car</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/stylelog.css">
</head>
<body>
    <form id="form1" runat="server">
         <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <a class="navbar-brand" href="default.aspx">
            <span>
              <-- Back
            </span>
          </a>
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="olvidaste" Text="Don't have an account?" NavigateUrl="Registroingles.aspx" />
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Big Car</h2>
                          <div method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="TxtUsuario" runat="server" placeholder="User" type="text" class="zmdi zmdi-account material-icons-name" />
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                 <asp:TextBox ID="TxtContra" runat="server" placeholder="Password" type="password" class="zmdi zmdi-lock" />
                            </div>
                             <div>
                                    <asp:HyperLink ID="olvidaste" runat="server" CssClass="olvidaste" Text="Forgot your password?" NavigateUrl="RecuperarCuentaingles.aspx" />
                                </div>
                            <div class="form-group form-button">
                                <asp:Button runat="server" Text="Sign in" class="form-submit" OnClick="Unnamed1_Click"></asp:Button>
                            </div>
                             <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
        </section> 
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <script src="js/bootstrap.min.js"></script>
    </form>
     <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
</body>
</html>