<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarImagen.aspx.cs" Inherits="ProyectoPTC2022.EditarImagen" %>

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

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="Font-awesome/css/fontawesome.min.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet" />
<link href="EstilosCss/EstilosStorage.css" rel="stylesheet" />
<script src="SweetAlert/sweetalert2.js"></script>
<script src="SweetAlert/sweetalert2.all.min.js"></script>
    <title>Editar Imagen</title>
    <style>
        .center{
            width: 80vw;
            height: 60vh;
            margin:auto;
            overflow-y: auto;
        }
        
    </style>
</head>
<body>
    <form id="form2" runat="server">
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
             <div class="my-content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 myform-cont">
                        <h1>Editar</h1>
                        <div class="myform-top">
                            <asp:Image ID="ImagePreview" Width="90%" CssClass="py-3" runat="server" />
                            
                        </div>
                        <div class="myform-bottom">
                            
                                <div class="form-group">
                                    <asp:TextBox ID="IdImagen" runat="server" placeholder="ID imagen" type="text" class="form-control" onpaste="return false" onkeypress="return NumCheck(event, this)"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="Texto" runat="server" placeholder="Texto" type="text" class="form-control" onpaste="return false" onkeypress="return validar(event)" minlength="1" ></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="LabelFoto" runat="server" CssClass="form-label" Text="Foto"></asp:Label>
                                    <asp:FileUpload ID="PhotoFile" CssClass="form-control" name="File" runat="server" />
                                </div>
                                                               
                                <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" CssClass="mybtn" Width="30%" OnClick="btnSeleccionar_Click"></asp:Button>
                                <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="mybtn" Width="30%" OnClick="btnEditar_Click"></asp:Button>
                                <asp:Button ID="btnEliminar" runat="server" CssClass="mybtn" Width="30%" Text="Eliminar" OnClick="btnEliminar_Click" />
                                <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
         </div>
                   <div class="container2">
            <div class="container2">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 container2">
       <div class="mb-4">
            <div class="center">
                 <asp:GridView ID="ListaImagenes" AutoGenerateColumns="False" CssClass="table table-dark table-striped table-bordered" runat="server">
                     <Columns>
                         <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                               <%# Eval ("Id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Texto">
                            <ItemTemplate>
                               <%# Eval ("Texto") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Imagen">
                            <ItemTemplate>
                                <asp:Literal id="Literal1" runat="server" text='<%# Eval ("Direccion") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                     </Columns>
                 
                     <EditRowStyle ForeColor="White" />
                 
                 </asp:GridView>
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

