using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class Ventas : System.Web.UI.Page
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

            Load_Sales();
        }

        protected void Load_Sales()
        {
            DataTable myTable = conexiones.Get_Sales();
            Sales.DataSource = myTable;
            Sales.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string QRCode = Code.Text.Trim();
            if (!string.IsNullOrWhiteSpace(QRCode) && !string.IsNullOrEmpty(QRCode))
            {
                DataTable myTable = conexiones.Get_Sale(QRCode);
                Sale.DataSource = myTable;
                Sale.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Debe de ingresar un código');", true);
            }

        }
    }
}