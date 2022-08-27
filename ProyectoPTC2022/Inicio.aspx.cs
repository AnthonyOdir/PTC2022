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

            try
            {
                String nombre = Session["username"].ToString();

            }
            catch (Exception ex)
            {
                Response.Redirect("Login2.aspx");
            }
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
            Session.Remove("usermane");
            Response.Redirect("Login2.aspx");
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