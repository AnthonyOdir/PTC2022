using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Threading;

namespace ProyectoPTC2022
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (txtusuario.Text.Trim() != "" && txtclave.Text.Trim() != "" && txtconfirm.Text.Trim() != "" && txtfirst.Text.Trim() != "" && txtapellido.Text.Trim() != "" && txtgmail.Text.Trim() != "" /*&& txtfecha.Text.Trim() != ""*/)
            {
                if (txtclave.Text == txtconfirm.Text)
                {
                    string nombre;
                    string apellido;
                    string usuario;
                    string correo;
                    //string fecha;

                    nombre = txtfirst.Text;
                    apellido = txtapellido.Text;
                    usuario = txtusuario.Text;

                    string hashedPassword = Hash_SHA256(txtclave.Text);
                    string confirmPwd = txtusuario.Text.Trim();
                    correo = txtgmail.Text;
                    //fecha = Calendar1.SelectedDate.ToString();

                    if (conexiones.UsuariosRepetidos(usuario, hashedPassword, nombre, apellido, correo/*, fecha*/) == 0)
                    {
                        alerta.Text = "<script>Swal.fire('Registrado con éxito', '¡Gracias por preferirnos!', 'success'); </script>";

                        txtfirst.Text = "";
                        txtapellido.Text = "";
                        txtusuario.Text = "";
                        txtclave.Text = "";
                        txtconfirm.Text = "";
                        txtgmail.Text = "";
                    }
                    else
                    {
                        alerta.Text = "<script>Swal.fire('Este usuario ya existe', 'Escoge un nuevo nombre de usuario', 'error'); </script>";
                    }
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Contraseña incorrecta', 'Repita su contraseña.', 'error');</script>";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS', 'No deje espacios en blanco', 'error') </script>";
            }
        }

        public static string Hash_SHA256(string text)
        {
            StringBuilder sb = new StringBuilder();
            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(text));
                foreach (Byte b in result)
                    sb.Append(b.ToString("x2"));
            }
            return sb.ToString();
        }
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
             
            if (e.Day.Date >DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Red;
                e.Cell.Font.Strikeout = true;
            }
        }
    }
}