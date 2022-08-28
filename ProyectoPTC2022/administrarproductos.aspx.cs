using ProyectoPTC2022;
using ProyectoPTC2022.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class administrarproductos : System.Web.UI.Page
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

            Load_Products();
        }

        protected void Load_Products()
        {
            DataTable myTable = conexiones.Fetch_Products(true);
            ProductsList.DataSource = myTable;
            ProductsList.DataBind();
        }


        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ProductId.Text);
            Fetch_product(id);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("./images/");
            try
            {
                int id = Convert.ToInt32(ProductId.Text);
                string nombre = Nombre.Text.Trim();
                string modelo = Modelo.Text.Trim();
                string estado = Estado.Text.Trim();
                double precio = Convert.ToDouble(Price.Text.Trim());
                int quantity = Convert.ToInt32(Quantity.Text.Trim());

                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }

                if (PhotoFile.HasFile)
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

                    int guardado = conexiones.Update_Product(id, nombre, modelo, estado, precio, quantity, foto);
                    if (guardado == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('El registro se actualizó con éxito.');", true);
                        Load_Products();
                        Fetch_product(id);
                    }
                    else
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Error al actualizar el registro');", true);
                }
                else
                {
                    int guardado = conexiones.Update_Product(id, nombre, modelo, estado, precio, quantity);
                    if (guardado == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('El registro se actualizó con éxito.');", true);
                        Load_Products();
                        Fetch_product(id);
                    }
                    else
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Error al actualizar el registro');", true);

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al editar el registro.');", true);
            }


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id;
            var isNumber = int.TryParse(ProductId.Text.Trim(), out id);

            if (isNumber)
            {
                int eliminado = conexiones.Delete_Product(id);

                if (eliminado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('El producto se eliminó con éxito.');", true);
                    Load_Products();
                    Nombre.Text = string.Empty;
                    Modelo.Text = string.Empty;
                    Estado.Text = string.Empty;
                    Price.Text = string.Empty;
                    Quantity.Text = string.Empty;
                    ImagePreview.ImageUrl = null;
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al eliminar el registro');", true);
            }

        }
        protected void Fetch_product(int id)
        {
            try
            {
                Producto respuesta = conexiones.Search_Product(id);
                if (respuesta.id != 0)
                {
                    ImagePreview.ImageUrl = "/images/" + respuesta.Image;
                    Nombre.Text = respuesta.Nombre;
                    Modelo.Text = respuesta.Modelo;
                    Estado.Text = respuesta.Estado;
                    Price.Text = respuesta.Precio.ToString();
                    Quantity.Text = respuesta.Quantity.ToString();

                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al obtener los datos');", true);

            }
            catch (Exception exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al obtener los datos');", true);
            }
        }
    }
}