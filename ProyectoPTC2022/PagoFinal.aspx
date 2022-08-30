<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PagoFinal.aspx.cs" Inherits="ProyectoPTC2022.PagoFinal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link href="CSS/EstiloTarjeta.css" rel="stylesheet" />
 	<title>Comprar</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js"integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"/>

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

    <script src="https://code.jquery.com/jquery-2.2.4.js"integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="crossorigin="anonymous"></script>
 <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/.png" type=""/>


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

    <script src="JavaScript/sweetalert2.all.min.js"></script>
 

    <style type="text/css">
        .auto-style1 {
            width: 110px;
            height: 144px;
        }
        .auto-style2 {
            background: #ffffff;
            max-width: 360px;
            margin: 80px auto;
            height: auto;
            padding-top: 70px;
            border-radius: 5px;
            position: relative;
            left: 0px;
            top: 0px;
            padding-left: 35px;
            padding-right: 35px;
            padding-bottom: 35px;
        }
        #Cardholder {
            width: 305px;
        }
    </style>


</head>
<body>
    <form id="Form1" runat="server">
                                                           <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt=""
                    </div>
           </div>
        <div class="centered my-5">
            <div class="row">
                <div class="col-sm-12 col-md-8 col-lg-8 m-auto">
                    <div class="card ">
                        <div class="card-body">
                            <hr />
                            <div class="mb-3 justify-content-center">
                <asp:Label ID="PGF" runat="server" Text="Pago Final" CssClass="form-label justify-content-center" Font-Bold="True"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="Nombre del propietario" Font-Bold="True"></asp:Label>
				                <br />
                                </div>
                            <div class="mb-3 justify-content-center">
				<asp:TextBox ID="name" CssClass="form-control" placeholder="Nombre de propietario" Autofocus="autofocus"  runat="server" ></asp:TextBox>
			                    <br />
                                <br />
			    <asp:Label ID="Label2" CssClass="form-label" runat="server" Text="Tarjeta de Credito" Font-Bold="True"></asp:Label>
				                <br />
                                </div>
                            <div class="mb-3 justify-content-center">
				<asp:TextBox ID="Cardnumber" CssClass="form-control" runat="server"  placeholder="0000 0000 0000 0000" data-mask="0000 0000 0000 0000"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" ></asp:TextBox>
				                <br />
                                <br />
				<asp:Label ID="Label3" CssClass="form-label" runat="server" Text="Fecha de vencimiento" Font-Bold="True"></asp:Label>
		                        <br />
                                </div>
                            <div class="mb-3 justify-content-center">
		        <asp:TextBox ID="vence" CssClass="form-control" runat="server" placeholder="00  /  00" data-mask="00  /  00"  onkeypress="return event.charCode >= 48 && event.charCode <= 57"></asp:TextBox>
				                <br />
                                <br />
				<asp:Label ID="Label4" CssClass="form-label" runat="server" Text="CVC" Font-Bold="True"></asp:Label>
	                            <br />
                                </div>
                            <div class="mb-3 justify-content-center">
	            <asp:TextBox ID="codigo" CssClass="form-control" placeholder="000" data-mask="000" runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57"></asp:TextBox>
                                <br />
                                <br />
                                </div>
                <asp:Button ID="btnBuy_Click" CssClass="btn btn-success" runat="server" Text="Comprar ahora" OnClick="btnBuy_Click_Click"/>
                <asp:Literal runat="server" ID ="Literal1" Text=""></asp:Literal>
                         </div> 
        <asp:HiddenField runat="server" id="userId"></asp:HiddenField>
                        </div>
                    </div>
                </div>
            </div> />
    </form>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <asp:Literal runat="server" ID ="alert" Text=""></asp:Literal>
  <asp:Literal ID="localStorageLiteral" runat="server" Text=""></asp:Literal>
   <script>
       //Get userId from localStorage and placed it to HiddenLabel
       document.getElementById("userId").value = window.localStorage.getItem("userId");
   </script>
</body>
</html>