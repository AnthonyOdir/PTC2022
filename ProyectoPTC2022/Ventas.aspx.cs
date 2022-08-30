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
    public partial class Ventas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
               
            Load_Sales();
        }

        protected void Load_Sales()
        {
            DataTable myTable = conexiones.Get_Sales();
            Sales.DataSource = myTable;
            Sales.DataBind();
        }
    }
}
