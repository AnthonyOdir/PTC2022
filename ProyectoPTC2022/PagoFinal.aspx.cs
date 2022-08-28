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

namespace ProyectoPTC2022
{
	public partial class PagoFinal : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["username"] == null)
			{
				Response.Redirect("Login2.aspx");
			}
		}


        protected void btnBuy_Click_Click(object sender, EventArgs e)
        {
            if (MCompra.valorGlobal != "")
            {
                if (Cardnumber.Text != "" && name.Text != "" && codigo.Text != "" && vence.Text != "")
                {
                    string credit_card = Cardnumber.Text;

                    //Generar código QR
                    var randomNumber = new Random().Next(Convert.ToInt32(100000), Convert.ToInt32(999999));//Número random para código qr
                    Cardnumber.Text = "Your entry code is: " + randomNumber.ToString();
                    string direccion = "C:/QR.png";//Dirección donde se guarda el código QR
                    var qrEncoder = new QrEncoder(ErrorCorrectionLevel.H);
                    var qrCode = qrEncoder.Encode(randomNumber.ToString());

                    var renderer = new GraphicsRenderer(new FixedModuleSize(5, QuietZoneModules.Two), Brushes.Black, Brushes.White);
                    using (var stream = new FileStream(direccion, FileMode.Create))
                        renderer.WriteToStream(qrCode.Matrix, ImageFormat.Png, stream);


                    //Obtener correo de base de datos

                    MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=root; pwd=;");
                    var cmd = "SELECT correo FROM usuarios WHERE nombre_usuario='" + MCompra.valorGlobal + "';"; //Cambiar el nombre de usuario por el valor de la variable global del nombre de usuario.
                    MySqlCommand getGmail = new MySqlCommand(cmd, conexion);
                    string valorQuery;
                    getGmail.Parameters.Add("@Name", MySqlDbType.VarChar);
                    var cmd1 = "Select nombre from usuarios where nombre_Usuario = '" + MCompra.valorGlobal + "'";
                    MySqlCommand obtenerNombre = new MySqlCommand(cmd1, conexion);

                    try
                    {
                        conexion.Open();
                        valorQuery = (string)getGmail.ExecuteScalar();//Obtiene el valor de la consulta sql.


                        //Enviar coreo
                        //Datos del envío
                        string correo = valorQuery;// cambiar por correo del usuario que realiza la compra
                        string nombre = "My Events";
                        string nombrecliente = (string)obtenerNombre.ExecuteScalar();
                        var fromAddress = new MailAddress("myeventsPTC@gmail.com", "Moisés");
                        const string fromPassword = "PTC123456";
                        var toAddress = new MailAddress(correo, nombre);//Dirección de correo y nombre que se muestra				
                        const string subject = "Purchase of entries";//Asunto del correo
                        Attachment att = new Attachment("C:/QR.png"); //es la dirección del archivo adjunto que se envía (incluye el nombre del archivo)

                        string body = "Mr. (Ms.)" + nombrecliente + ", Thanks for buy in our website . We have the honor of send you the QR Code for you event. Enjoy your event!";
                        //Fin de datos del envío

                        var smtp = new SmtpClient
                        {
                            Host = "smtp.gmail.com",
                            Port = 587,
                            EnableSsl = true,
                            DeliveryMethod = SmtpDeliveryMethod.Network,
                            UseDefaultCredentials = false,
                            Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                        };
                        using (var message = new MailMessage(fromAddress, toAddress)
                        {
                            Subject = subject,
                            Body = body,
                            Attachments = { att }//Archivo adjunto

                        })
                        {
                            smtp.Send(message);//Enviar el correo
                        }
                        //Fin del envío del correo

                        //Obtener precio de la entrada
                        string id_carro = Request.QueryString["itemId"];
                        var cmdPrecio = "Select Precio from productos where ID='" + id_carro + "'";
                        MySqlCommand obtenerPrecio = new MySqlCommand(cmdPrecio, conexion);
                        double valorEntrada;
                        obtenerPrecio.Parameters.Add("@Name", MySqlDbType.VarChar);
                        valorEntrada = (double)obtenerPrecio.ExecuteScalar();
                        //Subir información a base de datos

                        string usuario = MCompra.valorGlobal;
                        string usuarioAsociado = usuario;

                        double precio = valorEntrada;
                        double monto = precio;
                        string validarPropietario = name.Text;
                        string tarjeta = Cardnumber.Text;
                        if (MCompra.Compra(usuario, precio, id_carro, tarjeta) != 0)
                        {

                            alert.Text = "<script>Swal.fire('Purchased succesfully', \n 'Thanks for use our website! We have send you an email.', \n'success'); </script>";
                            Response.Redirect("deafultcliente.aspx");
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
            else
            {
                alert.Text = "<script>Swal.fire({title:'You must Login to purchase your entries.', type:'error', html:'Go to the '+ <a href='Login.aspx'>login.</a>});</script>";
            }
        }

        protected void txtTexto_TextChanged(object sender, EventArgs e)
        { }

    }


}

