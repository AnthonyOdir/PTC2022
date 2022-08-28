using ProyectoPTC2022.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class Inicio : System.Web.UI.Page
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
            cargarCarrusel();
        }
        protected void btningresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarProducto.aspx");
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarProducto.aspx");
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditarProducto.aspx");
        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
            localStorageLiteral.Text =
                    "<script>" +
                        JsLocalStorage.Clear() +
                        JsService.ReplaceLocation("Login2.aspx") +
                    "</script>";
            Session.Clear();
        }

        protected void cargarCarrusel()
        {
            string[] datos = conexiones.ObtenerImagenes();
            IndicatorsLiteral.Text = datos[1];
            ImagesLiteral.Text = datos[0];
        }

        protected void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarImagen.aspx");
        }

        protected void btnEditarImagen_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditarImagen.aspx");
        }
    }
}