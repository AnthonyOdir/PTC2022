<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarImagen.aspx.cs" Inherits="ProyectoPTC2022.AgregarImagen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<script src="SweetAlert/sweetalert2.js"></script>
<script src="SweetAlert/sweetalert2.all.min.js"></script>
    <title>Agregar imagen</title>
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

    <form id="form1" runat="server">
  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="Inicio.aspx">
            <span>
              Big Car
            </span>
              </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
                <li class="nav-item">
                  <a class="nav-link" href="Inicio.aspx">Inicio </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="crearproductos.aspx">Agregar </a>
              </li>
              <li class="nav-item">
               <a class="nav-link" href="administrarproductos.aspx">Administrar carros </a>
              </li>
               <li class="nav-item">
               <a class="nav-link" href="AgregarImagen.aspx">Agregar imagen </a>
              </li>
                   <li class="nav-item">
               <a class="nav-link" href="EditarImagen.aspx">Administar imagen </a>
              </li>
            </ul>


    </header>
 <div class="container">
            <div class="row">
                <div class="col-sm-6  m-auto">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Agregar</h5>
                            <div class="myform-top">
                                <asp:Image ID="ImagePreview" Width="90%" CssClass="py-3" runat="server" />
                            </div>
                       <div class="myform-bottom">
                                <div class="mb-3">
                                    <asp:TextBox ID="TextoImagen" runat="server" placeholder="Texto" type="text" class="nav-link third align-items-center justify-content-between" onpaste="return false" onkeypress="return validar(event)"  ></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                <asp:Label ID="LabelFoto" runat="server" CssClass="nav-link align-items-center justify-content-between" Text="Foto"></asp:Label>
                                    <asp:FileUpload ID="PhotoFile" CssClass="form-control third align-items-center justify-content-between" name="File" runat="server" />
                                </div>
                            <div class="mb-3">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="buton third btn-success" OnClick="btnAgregar_Click"></asp:Button>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
</div>
    </div>

    </form>
  <asp:Literal ID="localStorageLiteral" runat="server" Text=""></asp:Literal>

</body>
</html>
