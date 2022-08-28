using ProyectoPTC2022;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoPTC2022
{
    public class CartItem : IEquatable<CartItem>
    {
        #region Properties

        // A place to store the quantity in the cart
        // This property has an implicit getter and setter.
        public int Quantity { get; set; }

        private int id_carro;
        public int ProductId
        {
            get { return id_carro; }
            set
            {               // To ensure that the Prod object will be re-created
                _product = null;
                id_carro = value;
            }
        }

        private Product _product = null;
        public Product Prod
        {
            get
            {
                // Lazy initialization - the object won't be created until it is needed
                if (_product == null)
                {
                    _product = new Product(ProductId);
                }
                return _product;
            }
        }

        public string Description
        {
            get { return Prod.Description; }
        }

        public decimal Precio
        {
            get { return Prod.Precio; }
        }

        public decimal TotalPrice
        {
            get { return Precio * Quantity; }
        }

        #endregion

        // CartItem constructor just needs a productId
        public CartItem(int productId)
        {
            this.ProductId = productId;
        }

        /**
         * Equals() - Needed to implement the IEquatable interface
         *    Tests whether or not this item is equal to the parameter
         *    This method is called by the Contains() method in the List class
         *    We used this Contains() method in the ShoppingCart AddItem() method
         */
        public bool Equals(CartItem item)
        {
            return item.ProductId == this.ProductId;
        }
    }
}