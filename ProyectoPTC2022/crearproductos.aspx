<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crearproductos.aspx.cs" Inherits="ProyectoPTC2022.crearproductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Administrar productos</title>
 <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/.png" type="">


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
    <link href="css/BTN.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />


</head>
<body>
    <script type="text/javascript">
        function validar(e) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla == 8) return true; // 3
            patron = /[A-Za-z\s]/; // 4
            te = String.fromCharCode(tecla); // 5
            return patron.test(te); // 6
        }
    </script>
    <script type="text/javascript">
        function numeros(nu) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla == 8) return true; // 3
            ppatron = /\d/; // Solo acepta números// 4
            te = String.fromCharCode(tecla); // 5
            return patron.test(te); // 6
        }
    </script>
    <script type="text/javascript">   
        document.addEventListener('keypress', ValidarNumero);
        function ValidarNumero(numero) {
            if ((event.keyCode < 100) || (event.keyCode > 0))
                event.returnValue = true;
            else
                event.returnValue = false;
        }
    </script>
  <form id="form1" enctype="multipart/form-data" runat="server">
       <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              Big Car
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item ">
                <a class="nav-link" href="Inicio.aspx">Inicio </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="crearproductos.aspx">Agregar carro</a>
              </li>
              <li class="nav-item">
               <a class="nav-link" href="administrarproductos.aspx">Administrar carros </a>
              </li>
              <li class="nav-item">
               <a class="nav-link" href="Ventas.aspx">Ventas </a>
              </li>
               <li class="nav-item">
               <a class="nav-link" href="AgregarImagen.aspx">Agregar imagen </a>
              </li>
                   <li class="nav-item">
               <a class="nav-link" href="EditarImagen.aspx">Administar imagen </a>
              </li>

            </ul>
        </nav>
      </div>
    </header>

        <div class="centered my-5">
            <div class="row">
                <div class="col-sm-12 col-md-8 col-lg-8 m-auto">
                    <div class="card ">
                        <div class="card-body">
                            <h5 class="card-title">Iniciar sesión</h5>
                            <hr />
                            <div class="mb-3">
                                <asp:Label ID="LabelProduct" CssClass="form-label" runat="server" Text="Nombre del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Nombre" CssClass="form-control third" runat="server" onpaste="return false" onkeypress="return validar(event)"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelModelo" CssClass="form-label" runat="server" Text="Modelo del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Modelo" CssClass="form-control third" runat="server" onpaste="return false" onkeypress="return validar(event)"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelEstado" CssClass="form-label" runat="server" Text="Estado del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Estado" CssClass="form-control third" runat="server" onpaste="return false" onkeypress="return validar(event)"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelPrice" CssClass="form-label" runat="server" Text="Precio del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Price" CssClass="form-control third" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="4"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelQty" CssClass="form-label" runat="server" Text="Cantidad Producto" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Quantity" CssClass="form-control third" runat="server" onkeypress="return event.charCode >= 48 && event.charCode <= 57" maxlength="2"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelImage" CssClass="form-label" runat="server" Text="Imagen Producto" Font-Bold="True"></asp:Label>
                                <asp:FileUpload ID="PhotoFile" CssClass="form-control third" runat="server" />
                            </div>
                            
                            <asp:Button ID="Create" CssClass="buton third btn-success" runat="server" Text="Crear" OnClick="Create_Click" />
                              
                         </div>     
                     </div>   
                </div>
            </div>

        </div>
    </form>
  <asp:Literal ID="localStorageLiteral" runat="server" Text=""></asp:Literal>
</body>
</html>
