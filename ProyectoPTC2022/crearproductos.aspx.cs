using ProyectoPTC2022;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class crearproductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);

                if (!isAdmin)
                    Response.Redirect("index");

            }
            catch (Exception ex)
            {
                Response.Redirect("login");
            }
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath("./images/");

            if (PhotoFile.HasFile)
            {
                strFileName = PhotoFile.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);

                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + strFileName;
                if (!File.Exists(strFilePath))
                {
                    PhotoFile.PostedFile.SaveAs(strFilePath);
                }
                string nombre = Nombre.Text.Trim();
                string modelo = Modelo.Text.Trim();
                string estado = Estado.Text.Trim();
                double price = Convert.ToDouble(Price.Text.Trim());
                int qty = Convert.ToInt32(Quantity.Text.Trim());
                string image = strFileName;
                int guardado = conexiones.Add_Product(nombre, modelo, estado, price, qty, image);

                if (guardado == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Registro guardado exitosamente');", true);

                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Hubo un error al guardar los datos');", true);

            }
        }
    }
}