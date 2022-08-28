using ProyectoPTC2022;
using ProyectoPTC2022.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class EditarImagen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            localStorageLiteral.Text =
                "<script>" +
                    $"const userName = {JsLocalStorage.getItem("userName")}" +
                    $"const isAdmin = {JsLocalStorage.getItem("isAdmin")}" +
                    $"if(!userName) {{{JsService.ReplaceLocation("Login2.aspx")}}}" +
                    $"if(isAdmin != 1) {{{JsService.ReplaceLocation("defaultcliente.aspx")}}}" +
                "</script>";
            cargar_datos();
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(IdImagen.Text);
            cargar_registro(id);

        }

        protected void cargar_datos()
        {
            DataTable myTable = conexiones.ListarImagenes();
            ListaImagenes.DataSource = myTable;
            ListaImagenes.DataBind();
        }

        protected void cargar_registro(int id)
        {
            try
            {
                string[] respuesta = conexiones.SeleccionarRegistroImagen(id);
                if (respuesta[0] != null && respuesta[0] != String.Empty && respuesta[0] != "")
                {
                    ImagePreview.ImageUrl = "/images/" + respuesta[0];
                    Texto.Text = respuesta[1];
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Hubo un error al obtener los datos', '', 'error');", true);

            }
            catch (Exception exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Hubo un error al obtener los datos', '', 'error');", true);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("./images/");

            int id = Convert.ToInt32(IdImagen.Text);
            string texto = Texto.Text.Trim();



            if (!Directory.Exists(strFolder))
            {
                Directory.CreateDirectory(strFolder);
            }


            if (PhotoFile.HasFile) //Verifica si se ha subido un archivo
            {
                // Obtener el nombre del archivo subido.
                strFileName = PhotoFile.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);
                string foto = strFileName;
                // Guardando el archivo en el servidor
                strFilePath = strFolder + strFileName;
                if (!File.Exists(strFilePath)) //Si el archivo subido no existe, lo crea en el servidor
                {
                    PhotoFile.PostedFile.SaveAs(strFilePath);
                }



                int guardado = conexiones.ActualizarImagen(id, texto, foto);

                if (guardado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Su Imagen se actualizó con éxito.', '', 'success');", true);
                    cargar_datos();
                    cargar_registro(id);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Hubo un error al actualizar la imagen', '', 'error');", true);
                }
            }
            else //En caso de que no se actualice la foto que posee el registro
            {
                string foto = String.Empty;
                int guardado = conexiones.ActualizarImagen(id, texto, foto);

                if (guardado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Su Imagen se actualizó con éxito.', '', 'success');", true);
                    cargar_datos();
                    cargar_registro(id);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Hubo un error al actualizar la imagen', '', 'error');", true);
                }
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id;
            var isNumber = int.TryParse(IdImagen.Text.Trim(), out id);
            if (isNumber)
            {
                int eliminado = conexiones.EliminarRegistro(id);
                if (eliminado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('El registro se eliminó con éxito.', '', 'success');", true);
                    cargar_datos();
                    Texto.Text = String.Empty;
                    IdImagen.Text = String.Empty;
                    ImagePreview.ImageUrl = null;
                }
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Hubo un error al eliminar la imagen', '', 'error');", true);

        }
    }
}