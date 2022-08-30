<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ProyectoPTC2022._default" %>

<!DOCTYPE html>
<html>

<head>
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

  <title> Big Car </title>

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
              <li class="nav-item">
	            <asp:Button ID="btn_idioma" class="nav-link" type="submit" runat="server" Text="" BackColor="transparent" BorderColor="Transparent" OnClick="btn_idioma_Click" />
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="Inicio.aspx"><%=gTranslate.Translate("Inicio") %></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Carro.aspx">Carros <span class="sr-only">(current)</span> </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Sobre_Nosotros.aspx">Sobre Nosotros </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Register.aspx">Registro</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Register.aspx">Comprar </a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->


    <!-- slider section -->

      <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 30%;
            height: 30%;
        }
    </style>
     <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <asp:Literal ID="IndicatorsLiteral" Text="" runat="server"></asp:Literal>
          
        </ul>
        <br>
        <br>
        <br>
        <br>

        <!-- The slideshow -->

        <div class="carousel-inner">
            <asp:Literal ID="ImagesLiteral" Text="" runat="server"></asp:Literal>
           
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <asp:Label ID="label1" runat="server" Text=""></asp:Label>
    <asp:Label ID="label2" runat="server" Text=""></asp:Label>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <!-- end slider section -->
  </div>

  <!-- food section -->

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Categorias
        </h2>
      </div>
        
      <ul class="filters_menu">
        <li class="active" data-filter="*">Todos</li>
        <li data-filter=".PESADOS">Carros Pesados</li>
        <li data-filter=".ENTRADA">Carros de entrada</li>
        <li data-filter=".CASI_NUEVOS">Casi Nuevos</li>
        <li data-filter=".MUY_USADOS">Muy usado</li> 
      </ul>

      <div class="filters-content">
        <div class="row grid">
            <%--<div class="col-sm-6 col-lg-4 all ENTRADA">
              <div class="box">
              <div>--%>
               <div>
                <asp:Literal ID="ProductosLiteral" runat="server"></asp:Literal>
            </div>
                  </div>
                </div>

  </section>
        
  <!-- end food section -->

  <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="images/MicrosoftTeams-image.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                Somos Big Car
              </h2>
            </div>
            <p>
              Tratamos de proporcionarle carros de segunda mano de buena calidad, para que usted tenga
              una experiencia amistosa sin tener el miedo de que algun carro tenga defectos, le aseguramos 
              con seguridad que su carro tendra una buena calidad y podra disfrutar de las vetanjas que este
              le ofrece, tenemos la obligacion de darle una experiencia agradable y segura en nuestra plataforma
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->

  <!-- book section -->
   <section>
        <div class="col-md-6 justify-content-center">
          <div class="map_container justify-content-center">
              <!-- Google Map -->
             <script> src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap" </script>
             <!-- End Google Map -->
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3876.6722024533165!2d-89.28956775059127!3d13.6776854903483!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8f632efe53778fb3%3A0x21f34da7f1473fd3!2sColegio%20Salesiano%20Santa%20Cecilia!5e0!3m2!1ses-419!2ssv!4v1657655597658!5m2!1ses-419!2ssv" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
           </div>
          </div>
        </div>

  </section>
  <!-- end book section -->

  <!-- client section -->

  <section class="client_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center psudo_white_primary mb_45">
        <h2>
          Reseñas
        </h2>
      </div>
      <div class="carousel-wrap row ">
        <div class="owl-carousel client_owl-carousel">
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  Es una pagina muy buena, me es muy funcional y me ayudo a comprarle el regalo de cumpleaños a mi ex novia.
                </p>
                <h6>
                  Jefferson Chiquito
                </h6>
                <p>
                  Lobo solitario
                </p>
              </div>
              <div class="img-box">
                <img src="images/client1.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
          <div class="item">
            <div class="box">
              <div class="detail-box">
                <p>
                  Me gusta mucho esta pagina, sus carros tienen precios accecibles y aqui fue donde mi ex novio me compro un carro.
                </p>
                <h6>
                  Valentina Martinez
                </h6>
                <p>
                  Elamordemibida
                </p>
              </div>
              <div class="img-box">
                <img src="images/client2.jpg" alt="" class="box-img">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end client section -->

  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>
              Contact Us
            </h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call +01 1234567890
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  demo@gmail.com
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">
              bigcar.png
            </a>
            <p>
              Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
            </p>
            <div class="footer_social">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>
            Opening Hours
          </h4>
          <p>
            Everyday
          </p>
          <p>
            10.00 Am -10.00 Pm
          </p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="https://html.design/">Free Html Templates</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By
          <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
        </p>
      </div>
    </div>
  </footer>
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
  <asp:Literal ID="localStorageLiteral" runat="server" Text=""></asp:Literal>
</body>
</html>

