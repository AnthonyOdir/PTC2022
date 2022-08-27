using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoPTC2022
{
    public class Producto
    {
        public int id { get; set; }
        public string Nombre { get; set; }
        public string Modelo { get; set; }
        public string Estado { get; set; }
        public double Precio { get; set; }
        public int Quantity { get; set; }
        public string Image { get; set; }
    }
}