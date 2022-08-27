<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarroCompraPrueba1.aspx.cs" Inherits="ProyectoPTC2022.CarroCompraPrueba1" %>

<!DOCTYPE HTML>
<html>
<head>
    <form runat="server">
    <title>Express Car Group | Sin :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="catalogoStyle/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="catalogoStyle/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="catalogoStyle/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function () {
                $(".dropdown dd ul").toggle();
            });

            $(".dropdown dd ul li a").click(function () {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });

            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function (e) {
                var $clicked = $(e.target);
                if (!$clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function () {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
    </script>
    <!-- start menu -->
    <link href="catalogoStyle/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="catalogoStyle/js/megamenu.js"></script>
    <script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>
    <!-- end menu -->
    <script type="text/javascript" src="catalogoStyle/js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function () {
            $('.scroll-pane').jScrollPane();
        });
    </script>
    <!----details-product-slider--->
    <!-- Include the Etalage files -->
    <link rel="stylesheet" href="catalogoStyle/css/etalage.css">
    <script src="catalogoStyle/js/jquery.etalage.min.js"></script>
    <!-- Include the Etalage files -->
    <script>
        jQuery(document).ready(function ($) {

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,

                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });
            // This is for the dropdown list example:
            $('.dropdownlist').change(function () {
                etalage_show($(this).find('option:selected').attr('class'));
            });

        });
    </script>
    <!----//details-product-slider--->
    <!-- top scrolling -->
    <script type="text/javascript" src="catalogoStyle/js/move-top.js"></script>
    <script type="text/javascript" src="catalogoStyle/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
            });
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 76%;
            margin-left: 43;
        }
    </style>
</head>
<body>
    <div class="header-top">
        <div class="wrap">
            <div class="logo">
                &nbsp;</div>
            <div class="cssmenu">
                <ul>
                    <li class="active"><a href="Registro.aspx">Crear una cuenta</a></li>
                    <li><a href="Menu_principal.aspx">Pagina principal</a></li>
                    <li><a href="login.asp">Mi cuenta</a></li>
                    
                </ul>
            </div>
            <ul class="icon2 sub-icon2 profile_img">
                <li><a class="active-icon c2" href="#"></a>
                    <ul class="sub-icon2 list">
                        <li>
                            <h3>Products</h3>
                            <a href=""></a></li>
                        <li>
                            <p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="wrap">
            <!-- start header menu -->
            <ul class="megamenu skyblue">
                <li><a class="color1" href="catalogo.aspx">Inicio</a></li>
                <li class="grid"><a class="color2" href="carrosnuevos.aspx">Carros nuevos</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>popular</h4>
                                    <ul>
                                        <li><a href="shop.html">new arrivals</a></li>
                                        <li><a href="shop.html">men</a></li>
                                        <li><a href="shop.html">women</a></li>
                                        <li><a href="shop.html">accessories</a></li>
                                        <li><a href="shop.html">kids</a></li>
                                        <li><a href="shop.html">login</a></li>
                                    </ul>
                                </div>
                                <div class="h_nav">
                                    <h4 class="top">men</h4>
                                    <ul>
                                        <li><a href="shop.html">new arrivals</a></li>
                                        <li><a href="shop.html">men</a></li>
                                        <li><a href="shop.html">women</a></li>
                                        <li><a href="shop.html">accessories</a></li>
                                        <li><a href="shop.html">kids</a></li>
                                        <li><a href="shop.html">style videos</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>style zone</h4>
                                    <ul>
                                        <li><a href="shop.html">men</a></li>
                                        <li><a href="shop.html">women</a></li>
                                        <li><a href="shop.html">accessories</a></li>
                                        <li><a href="shop.html">kids</a></li>
                                        <li><a href="shop.html">brands</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <img src="catalogoStyle/images/nav_img.jpg" alt="" />
                        </div>
                    </div>
                </li>
                <li class="active grid"><a class="color4" href="carrosusados.aspx">Carros Usados</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                  
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                   
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col2"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                        </div>
                    </div>
                </li>
                
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <p>
                                        &nbsp;</p>
                        </div>
                    </div>
                </li>
                
                    <div class="megapanel">
                        <div class="row">
                            <div class="col2"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                        </div>
                    </div>
                </li>
           
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                   
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col2"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                        </div>
                    </div>
                </li>
              
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                   
                                    </ul>
                                </div>
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                                <div class="col1"></div>
                                <div class="col1"></div>
                                <div class="col1"></div>
                                <div class="col1"></div>
                            </div>
                        </div>
                </li>
                
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                   
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>popular</h4>
                                    <ul>
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col2"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                            <div class="col1"></div>
                        </div>
                    </div>
                </li>
              
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="single">
        <div class="wrap">
            <div class="cont span_2_of_3">
                <div class="labout span_1_of_a1">
                    <!-- start product_slider -->
                    <ul id="etalage">
                        <li>
                            <a href="optionallink.html">
                                <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes.jpg" />
                                <img class="etalage_source_image" src="catalogoStyle/images/mercedes 2.jpg" />
                            </a>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes 2.jpg" />
                            <img class="etalage_source_image" src="catalogoStyle/images/mercedes 2.jpg" />
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes 3.jpg" />
                            <img class="etalage_source_image" src="catalogoStyle/images/mercedes 3.jpg" />
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes 4.jpg" />
                            <img class="etalage_source_image" src="catalogoStyle/images/mercedes 4.jpg" />
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes 10.jpg" />
                            <img class="etalage_source_image" src="catalogoStyle/images/mercedes 10.jpg" />
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes 11.jpg" />
                            <img class="etalage_source_image" src="catalogoStyle/images/mercedes 11.jpg" />
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="catalogoStyle/images/mercedes 13.jpg" />
                            <img class="etalage_source_image" src="catalogoStyle/images/mercedes 13.jpg" />
                        </li>
                    </ul>

                    <!-- end product_slider -->
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <div class="auto-style1">
                    <h3 class="m_3">Camioneta mercedes AMG G65</h3>

                    <div class="price_single">
                        <span class="reducedfrom">$100.000</span>
                        <span class="actual">$88.000</span><a href="#"></a>
                    </div>
                   
                    <div class="btn_form">
                        <form>
                            <asp:Button ID="btnComprar" type="submit" runat="server" Text="Comprar" OnClick="btnComprar_Click" BorderStyle="Groove" CssClass="animated bounceIn" BackColor="lightblue" BorderColor="lightblue" Height="82px" Width="261px" />
                        </form>
                    </div>
                    <ul class="add-to-links">
                        <li>
                            
                    </ul>
                    <p class="m_desc">El G65 AMG  Contará con el motor V12 twin turbo de 6.0 litros con 621 caballos de fuerza y 738 lb-ft de torque. Mercedes fue pionera en el diseño de carrocerías con zonas de deformación programada, sistemas de frenos antibloqueo electrónicos o los airbags, presentados como primicia en los Mercedes Clase S de la generación W126... Date una nueva experiencia con este nuevo módelo</p>

                    <div class="social_single">
                        <ul>
                            
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>


              
                    </li>
                </ul>
                <script type="text/javascript">
                    $(window).load(function () {
                        $("#flexiselDemo1").flexisel();
                        $("#flexiselDemo2").flexisel({
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                        $("#flexiselDemo3").flexisel({
                            visibleItems: 5,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="catalogoStyle/js/jquery.flexisel.js"></script>
                <div class="toogle">
                    <h3 class="m_3">Carasteristicas del mercedes clase G</h3>
                    <div style="box-sizing: border-box; font-family: &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;">
                        <div style="box-sizing: border-box; font-family: &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;">
                            El Mercedes Clase G es un todoterreno fabricado por Mercedes-Benz. Se trata de uno de los todoterrenos más auténticos que quedan, con un sencillo diseño &quot;cuadrado&quot;, que se ha mantenido prácticamente inalterado desde que su producción arrancara en 1979, cuando fue concebido como un vehículo militar y de uso profesional. La &quot;G&quot; de su nombre hace referencia a la palabra Geländewagen, lo que podríamos traducir como “coche para el campo”. El precio del Mercedes Clase G parte desde los 127.450 euros. Ofrece un gran catalogo de personalización para un vehículo cuyo principal mercado se establece en Oriente Medio. El Mercedes Clase G se fabrica por Magna Steyr en Austria. El Jeep Wrangler y el Land Rover Defender son otras de las últimas alternativas todoterreno puras que existen en el mercado, aunque no rivalizan directamente con el Mercedes, que aborda el segmento con la condición de coche de lujo aún contando con ciertos detalles espartanos.</div>
                        <p style="color:#da846b;font-size:1.25rem;font-style:normal;font-weight:400;">
                            <br />
                        </p>
                        <div style="box-sizing: border-box; font-family: &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif; font-size: 12.5px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;">
                            .</div>
                        <p>
                        </p>
                    </div>
                    <p class="m_text">&nbsp;</p>
                </div>
                <div class="toogle">
                    <h3 class="m_3">diseño del mercedes clase g</h3>
                    <div style="box-sizing: border-box; font-family: &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;">
                        Su diseño es robusto, con grandes capacidades off-road, lujoso, potente, con un diseño tradicional y muy caro. El de 2018 era el mayor cambio realizado por la marca alemana a su todoterreno estrella en casi cuatro décadas con un gran cuidado para no modificar su identidad propia. Llegan elementos nuevos como los faros LED o una completa renovación en el interior, destacando la presencia de dos grandes pantallas de 12,3″. Sin embargo, no se renunciaba a elementos clásicos como la rueda de repuesto en el portón trasero. Las medidas del Mercedes Clase G, partiendo de la versión estándar, pasan por una longitud de 4.817 mm, una anchura de 1.931 mm y una altura de 1.969 mm aunque hay diferentes carrocerías y configuraciones que alteran estas cotas. Además cuenta con un ángulo de ataque y de salida de 30º, de mantenerse estable con una inclinación lateral de hasta 35°, una capacidad de vadeo de 70 cm (10 más que la anterior generación) y una altura libre disponible de 24,1 cm, 27 en el eje 
                        delantero. Ha contado con una cura de adelgazamiento a base de la utilización de aceros de alta resistencia y aluminio en defensas, capó y puertas que le han permitido reducir en 170 kilogramos su peso total hasta situarse en los 2.429 kg. Las mayores dimensiones y la nueva distribución del espacio interior permiten además una mayor habitabilidad, con más espacio para piernas, hombros y codos.</div>
                    <p class="m_text">&nbsp;</p>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-top">
            <div class="wrap">
                <div class="col_1_of_footer-top span_1_of_footer-top">
                    <ul class="f_list">
                        <li>
                    
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear'
            };


            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
</form>
</body>


</html>
