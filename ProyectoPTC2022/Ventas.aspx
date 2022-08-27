<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="ProyectoPTC2022.Ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/html5-qrcode" type="text/javascript">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Ventas</title>
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

  <link href="EstilosCss/EstiloInicio.css" rel="stylesheet" />

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
    <form id="form2" enctype="multipart/form-data" runat="server">
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
              <li class="nav-item ">
                <a class="nav-link" href="Carro.aspx">Carros <span class="sr-only">(current)</span> </a>
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
  <div class="container my-3">
            <div class="mb-2">
               <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <asp:TextBox ID="Code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-12 col-md-1 col-lg-1">
                        <button class="btn btn-primary" id="scan" >Escanear</button>
                    </div>
                    <div class="col-sm-12 col-md-1 col-lg-1">
                         <asp:Button ID="Search" cssClass="btn btn-success" runat="server" Text="Buscar" OnClick="Search_Click" />
                    </div>
                </div>
			    
                
               
 
                <div id="preview" class="my-3"></div>
            </div>
            <asp:GridView ID="Sale" CssClass="table table-dark table-striped table-hover table-bordered my-3"  runat="server"></asp:GridView>
            <asp:GridView ID="Sales" CssClass="table table-striped table-hover table-bordered" runat="server"></asp:GridView>
        </div>
    <script type="module">


        let txtCode = document.getElementById('Code')
        function onScanSuccess(decodedText, decodedResult) {
            // handle the scanned code as you like, for example:
            txtCode.value = decodedText;
            console.log(`Code matched = ${decodedText}`, decodedResult);
        }
        function onScanFailure(error) {
            // handle scan failure, usually better to ignore and keep scanning.
            // for example:
            console.log(`Error al escanear = ${error}`);
        }
        let html5QrcodeScanner = new Html5QrcodeScanner(
            "preview",
            { fps: 20, qrbox: { width: 250, height: 250 } },
        /* verbose= */ false);

        $('#scan').click(function (e) {
            e.preventDefault();
            html5QrcodeScanner.render(onScanSuccess, onScanFailure)
        })


    </script>

 
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  </form>
</body>

</html>
