using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class defaultcliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            try
            {
                String nombre = Session["usermane"].ToString();

            }
            catch (Exception ex)
            {
                Response.Redirect("Login2.aspx");
            }
            cargarCarrusel();
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
