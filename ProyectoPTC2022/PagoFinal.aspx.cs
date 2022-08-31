using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using MessagingToolkit.QRCode.Codec;
using System.ComponentModel;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Net;
using ProyectoPTC2022.Utils;

namespace ProyectoPTC2022
{
	public partial class PagoFinal : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            localStorageLiteral.Text =
                "<script>" +
                    $"const userName = {JsLocalStorage.getItem("userName")}" +
                    $"if(!userName) {{{JsService.ReplaceLocation("Login2.aspx")}}}" +
                "</script>";
		}


        protected void btnBuy_Click_Click(object sender, EventArgs e)
        {
            
            if (Cardnumber.Text != "" && name.Text != "" && codigo.Text != "" && vence.Text != "")
            {
                string credit_card = Cardnumber.Text;                 
                //Obtener correo de base de datos
                MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=root; pwd=;");

                try
                {
                    conexion.Open();

                    //Obtener precio de la entrada
                    string id_carro = Request.QueryString["itemId"];
                    var cmdPrecio = "Select Precio from productos where ID='" + id_carro + "'";
                    MySqlCommand obtenerPrecio = new MySqlCommand(cmdPrecio, conexion);
                    double precio = (double)obtenerPrecio.ExecuteScalar();

                    var cmdModelo = "Select Modelo from productos where ID='" + id_carro + "'";
                    MySqlCommand obtenerModelo = new MySqlCommand(cmdModelo, conexion);
                    string valorModelo = (string)obtenerModelo.ExecuteScalar();

                    var cmdEstado = "Select Estado from productos where ID='" + id_carro + "'";
                    MySqlCommand obtenerEstado = new MySqlCommand(cmdEstado, conexion);
                    string valorEstado = (string)obtenerEstado.ExecuteScalar();

                    //Subir información a base de datos
                    
                    string usuario = (string)Session["userId"];

                    double monto = precio;
                    string validarPropietario = name.Text;
                    string tarjeta = Cardnumber.Text;

                    if (MCompra.Compra(userId.Value, precio, id_carro, valorModelo, valorEstado, tarjeta) != 0)
                    {

                        alert.Text = 
                            "<script>" +
                                $"Swal.fire('Éxito', 'El carro ha sido comprado exitosamente', 'success').then((value) => {{{JsService.ReplaceLocation("defaultcliente.aspx")}}});" +
                            "</script>";
                        //Response.Redirect("defaultcliente.aspx");
                    }
                    else {
                        alert.Text = 
                            $"<script>" +
                                $"Swal.fire('Error', 'El carro ya fue comprado por alguien mas, intente con otro', 'error').then((value) => {{{ JsService.ReplaceLocation("defaultcliente.aspx")}}});" +
                            $"</script>";
                    }
                    conexion.Close();

                }

                catch
                {
                    Response.Write("<script>alert('Error.');</script> ");
                    conexion.Close();
                }

            }
            else
            {
                Response.Write("<script>alert('You have blank fields.'); </script>");
            }
          
        }

        protected void txtTexto_TextChanged(object sender, EventArgs e)
        { }

    }


}

