using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class BIGCARCARROPRUEBA1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pago.aspx");
        }
        protected void cargarCarrusel()
        {
            string[] datos = conexiones.ObtenerImagenes();
            IndicatorsLiteral.Text = datos[1];
            ImagesLiteral.Text = datos[0];
        }
    }
}