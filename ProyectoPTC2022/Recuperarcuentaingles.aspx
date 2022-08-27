<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarCuenta.aspx.cs" Inherits="ProyectoPTC2022.RecuperarCuenta" %>

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
    <title>Recuperar Contraseña</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    
    <!-- Main css -->
    <link rel="stylesheet" href="css/stylelog.css">
</head>
<body>
    <form id="form1" runat="server">
         <!-- Sing in  Form -->
                <div>
        </div>
                <div>
        </div>
                <div>
        </div>
        <section class="sign-in">
            <div class="container">
                <a class="navbar-brand" href="defaultingles.aspx">
            <span>
              <-- Back
            </span>
          </a>
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image1.jpg" alt="sing up image"></figure>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Big Car</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="txtcuenta" runat="server" placeholder="User..." type="text" class="zmdi zmdi-account material-icons-name" />
                            </div>
                        </form>
                         <div class="form-group form-button">
                                <asp:Button runat="server" Text="Recuperar" CssClass="form-submit" OnClick="Unnamed1_Click"></asp:Button>
                            </div>
                    </div>
                </div>
            </div>
        </section>
          <asp:Literal ID="alertas" runat="server" Text=""></asp:Literal>
         <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </form>
     <!-- JS -->
</body>
</html>