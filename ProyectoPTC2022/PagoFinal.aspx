<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PagoFinal.aspx.cs" Inherits="ProyectoPTC2022.PagoFinal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link href="CSS/EstiloTarjeta.css" rel="stylesheet" />
 	<title>Comprar</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js"integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"/>


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
       <div class="logologin" style="width: 40%; height:80%;">
             <img src="Imagenes/credit-card-icon-png-0.jpg" class="logo" />

             <div id="Panel" style="width: 40%; height: 80%;">
                     
				     <asp:Label ID="Label1" runat="server" Text="Credit Card Holder"></asp:Label>
				     <asp:TextBox ID="name" placeholder="Credit Card Holder" Autofocus="autofocus"  runat="server" ></asp:TextBox>
			         <asp:Label ID="Label2" runat="server" Text="Credit Card Number"></asp:Label>
				     <asp:TextBox ID="Cardnumber" runat="server"  placeholder="0000 0000 0000 0000" data-mask="0000 0000 0000 0000"  onkeypress="return event.charCode >= 48 && event.charCode <= 57" ></asp:TextBox>
				     <asp:Label ID="Label3" runat="server" Text="Expiry date"></asp:Label>
		             <asp:TextBox ID="vence" runat="server" placeholder="00  /  00" data-mask="00  /  00"  onkeypress="return event.charCode >= 48 && event.charCode <= 57"></asp:TextBox>
				     <asp:Label ID="Label4" runat="server" Text="CVC"></asp:Label>
	                 <asp:TextBox ID="codigo" placeholder="000" data-mask="000" runat="server"  onkeypress="return event.charCode >= 48 && event.charCode <= 57"></asp:TextBox>
                     <asp:Button ID="btnBuy_Click" runat="server" Text="Purchase" OnClick="btnBuy_Click_Click" UseSubmitBehavior="false" />
                     
                     <asp:Literal runat="server" ID ="alert" Text=""></asp:Literal>
                     
                </div>
           </div>
          </form>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
</body>
</html>