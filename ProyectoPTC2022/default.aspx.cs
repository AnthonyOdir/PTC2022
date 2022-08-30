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
    public partial class _default : System.Web.UI.Page
    {
        public static GTranslate gTranslate;
        protected void Page_Load(object sender, EventArgs e)
        {
            localStorageLiteral.Text =
                "<script>" +
                $"const userName = {JsLocalStorage.getItem("userName")}" +
                $"const isAdmin = {JsLocalStorage.getItem("isAdmin")}" +
                $"if(userName && isAdmin == 1) {{{JsService.ReplaceLocation("Inicio.aspx")}}}" +
                $"if(userName) {JsService.ReplaceLocation("defaultcliente.aspx")}" +
                "</script>";
            gTranslate = new GTranslate(Convert.ToInt32(Session["language"]));
            btn_idioma.Text = gTranslate.GetLanguageButtonText();
            cargarCarrusel();
            Load_Products();
        }
        protected void cargarCarrusel()
        {
            string[] datos = conexiones.ObtenerImagenes();
            IndicatorsLiteral.Text = datos[1];
            ImagesLiteral.Text = datos[0];
        }
       
        protected void Load_Products()
        {
            string template = "";

            DataTable products = conexiones.Fetch_Products(false);

            foreach (DataRow row in products.Rows)
            {
                template += "<div class='col-sm-6 col-lg-4 all ENTRADA'>" +
                                "<div class='box'>" +
                                "<img  height='100%' width='100%' src='images/" + row["Image"]+"'/>" +
                                    "<div class='detail-box'>" + " <h5>" +
                                         row["Nombre"] + "</h5>" + row["Estado"] + " - " + row["Modelo"] + "<h5>" +
                                "<h6>" + "$" + row["Precio"]  + 
                            "</h6>" + "<h6>" + "Stock: " + row["Quantity"] + "</h6>" +
                            "<a href='PagoFinal.aspx?itemId=" + row["Id"] + "' class='btn btn-primary'> Comprar ahora</a>" +
                "</div>" +
                    "</div>" +
                     "</div>";


            }

            ProductosLiteral.Text = template;
        }

        protected void btn_idioma_Click(object sender, EventArgs e)
        {
            gTranslate.ChangeLanguage();
            Session["language"] = gTranslate.language;
        }
    }
}
