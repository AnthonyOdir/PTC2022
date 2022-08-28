<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrarproductos.aspx.cs" Inherits="ProyectoPTC2022.administrarproductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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
 <div class="container">
            <div class="row">
                <div class="col-sm-6  m-auto">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title ">Administrar productos</h5>
                            <div class="myform-top">
                                <asp:Image ID="ImagePreview" Width="90%" CssClass="py-3" runat="server" />
                            </div>
                       <div class="myform-bottom">
                                <div class="mb-3">
                                    <asp:TextBox ID="ProductId" CssClass="form-control" placeholder="Id producto" runat="server"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                <asp:Label ID="LabelProduct" CssClass="form-label" runat="server" Text="Nombre del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Nombre" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelModelo" CssClass="form-label" runat="server" Text="Modelo del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Modelo" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelEstado" CssClass="form-label" runat="server" Text="Estado del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Estado" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelPrice" CssClass="form-label" runat="server" Text="Precio del Carro" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Price" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelQty" CssClass="form-label" runat="server" Text="Cantidad Producto" Font-Bold="True"></asp:Label>
                                <asp:TextBox ID="Quantity" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="LabelImage" CssClass="form-label" runat="server" Text="Imagen Producto" Font-Bold="True"></asp:Label>
                                <asp:FileUpload ID="PhotoFile" CssClass="form-control" runat="server" />
                            </div>
                                <div class="pt-2">
                                    <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" CssClass="btn btn-primary" Width="30%" OnClick="btnSeleccionar_Click" ></asp:Button>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-success" Width="30%" OnClick="btnEditar_Click"></asp:Button>
                                    <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-danger" Width="30%" Text="Eliminar" OnClick="btnEliminar_Click" />
                                </div>
                                
                               <div class="my-4">
                <div class="center">
                    <asp:GridView ID="ProductsList" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Id">
                                <ItemTemplate>
                                   <%# Eval ("Id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                   <%# Eval ("Nombre") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modelo">
                                <ItemTemplate>
                                   <%# Eval ("Modelo") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                   <%# Eval ("Estado") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio">
                                <ItemTemplate>
                                   <%# Eval ("Precio") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad">
                                <ItemTemplate>
                                   <%# Eval ("Quantity") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                   <%# Eval ("Image") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
              </div>
           </div>
        </div>
     </div>
   </div>
 </div>
</div>
                   
     

         

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <!-- end slider section -->
  </div>


 
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
