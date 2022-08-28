using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoPTC2022
{
    public class Product
    {
        public int Id { get; set; }
        public decimal Precio { get; set; }
        public string Description { get; set; }

        public Product(int id)
        {
            this.Id = id;
            switch (id)
            {
                case 1:
                    this.Precio = 19.95m;
                    this.Description = "Shoes";
                    break;
                case 2:
                    this.Precio = 9.95m;
                    this.Description = "Shirt";
                    break;
                case 3:
                    this.Precio = 14.95m;
                    this.Description = "Pants";
                    break;
            }
        }
    }
}