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
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
<script src="SweetAlert/sweetalert2.js"></script>
<script src="SweetAlert/sweetalert2.all.min.js"></script>
    <title>Agregar imagen</title>
</head>
<body>
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
              <li class="nav-item ">
                <a class="nav-link" href="Carros.aspx">Carros <span class="sr-only">(current)</span> </a>
              </li>
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
                                      <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 myform-cont">
                        <h1>Agregar</h1>
                        <div class="myform-top">
                        </div>
                        <div class="myform-bottom">
                            <div role="form" action="" method="post" class="">
                                <div class="form-group">
                                    <asp:TextBox ID="TextoImagen" runat="server" placeholder="Texto" type="text" class="nav-link align-items-center justify-content-between" onpaste="return false" onkeypress="return validar(event)" minlength="1" ></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="LabelFoto" runat="server" CssClass="nav-link align-items-center justify-content-between" Text="Foto"></asp:Label>
                                    <asp:FileUpload ID="PhotoFile" CssClass="form-control align-items-center justify-content-between" name="File" runat="server" />
                                </div>
                                
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn-box" OnClick="btnAgregar_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </form>
  <asp:Literal ID="localStorageLiteral" runat="server" Text=""></asp:Literal>

</body>
</html>
