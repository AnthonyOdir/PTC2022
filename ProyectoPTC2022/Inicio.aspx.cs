using ProyectoPTC2022.Utils;
using System;
using System.Collections.Generic;
using System.Data;
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
            Load_Products();
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
        protected void Load_Products()
        {
            string template = "";

            DataTable products = conexiones.Fetch_Products(false);

            foreach (DataRow row in products.Rows)
            {
                template += "<div class='col-sm-6 col-lg-4 all ENTRADA'>" +
                                "<div class='box'>" +
                                "<img  height='100%' width='100%' src='images/" + row["Image"] + "'/>" +
                                    "<div class='detail-box'>" + " <h5>" +
                                         row["Nombre"] + "</h5>" + row["Estado"] + " - " + row["Modelo"] + "<h5>" +
                                "<h6>" + "$" + row["Precio"] +
                            "</h6>" + "<h6>" + "Stock: " + row["Quantity"] + "</h6>" +
                            "<a href='PagoFinal.aspx?itemId=" + row["Id"] + "' class='btn btn-primary'> Comprar ahora</a>" +
                "</div>" +
                    "</div>" +
                     "</div>";


            }

            ProductosLiteral.Text = template;
        }
     }
}