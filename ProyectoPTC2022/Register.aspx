<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProyectoPTC2022.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="Font-awesome/css/fontawesome.min.css" rel="stylesheet" />    
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,400&display=swap" rel="stylesheet"/>
        <script src="SweetAlert/sweetalert2.all.min.js"></script>
        <script src="SweetAlert/sweetalert2.js"></script>
     <link href="EstilosCss/Register.css" rel="stylesheet" />
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
         <script type="text/javascript">
                function validar(e) { // 1
                tecla = (document.all) ? e.keyCode : e.which; // 2
                if (tecla==8) return true; // 3
                patron =/[A-Za-z\s]/; // 4
                te = String.fromCharCode(tecla); // 5
                return patron.test(te); // 6
                }
            </script>
            <script type="text/javascript">
                function numeros(nu) { // 1
                tecla = (document.all) ? e.keyCode : e.which; // 2
                if (tecla==8) return true; // 3
                ppatron = /\d/; // Solo acepta números// 4
                te = String.fromCharCode(tecla); // 5
                return patron.test(te); // 6
                }
            </script>    
 <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <a class="navbar-brand" href="default.aspx">
            <span>
              <-- Regresar
            </span>
          </a>
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Registrese</h2>
                        <div method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                 <asp:TextBox ID="txtfirst" runat="server"  placeholder="Nombre" type="text" onpaste="return false" onkeypress="return validar(event)" ></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="txtapellido" runat="server"  placeholder="Apellido" type="text" onpaste="return false" onkeypress="return validar(event)"></asp:TextBox> 
                            </div>
                           
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                 <asp:TextBox ID="txtusuario" runat="server"  placeholder="Usuario..." type="text" onpaste="return false"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox ID="txtclave" runat="server"  placeholder="Contraseña..." type="password" onpaste="return false"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <asp:TextBox ID="txtconfirm" runat="server"  placeholder="Repita Contraseña..." type="password" onpaste="return false"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="txtgmail" runat="server"  placeholder="Correo" type="email" onpaste="return false"/>
                            </div>
                            <div>
                            <asp:Button ID="btnCalendario_Click" runat="server" Text="Calendario" OnClick="Button1_Click" />
                            <asp:Calendar ID="Calendar1" runat="server" Height="72px" Width="156px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"> </asp:Calendar>
                            <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox></div>
                        <div>
                   </div>
                            </div>

                        </div>
                   </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                          <div>
                              <asp:HyperLink ID="olvidaste" runat="server" CssClass="Login" Text="¿Ya tienes una cuenta?" NavigateUrl="Login2.aspx" />
                          </div>
                        <div class="form-group form-button"> 
                                <asp:Button runat="server" Text="Registrarse" CssClass="form-submit" OnClick="Unnamed1_Click"></asp:Button>
                            </div>
                          <asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>
                    </div>
                </div>
            </div>
        </section>
        <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="js/bootstrap.min.js"></script>
    </form>
     <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
</body>
</html>