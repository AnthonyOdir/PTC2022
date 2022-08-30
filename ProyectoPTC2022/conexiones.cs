using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace ProyectoPTC2022
{
    public class conexiones
    {
        public static MySqlConnection conexion = new MySqlConnection("Server= 127.0.0.1; database=ptc; Uid=root; pwd=;");
        public static int UsuariosRepetidos(string usuario, string hashedPassword, string nombre, string apellido, string correo, string fecha)
        {
            int valor = 0;
            MySqlConnection conexion = datos.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("SELECT id FROM usuarios WHERE nombre_usuario='" + usuario + "'", conexion);
            valor = Convert.ToInt32(cmd.ExecuteScalar());
            if (valor != 0)
            {

            }
            else
            {
                conexiones.AgregarUsuario(nombre, apellido, usuario, hashedPassword, correo, fecha);

            }
            conexion.Close();
            return valor;
        }
        //**************************** Método para los usuario ****************************
        public static int AgregarUsuario(string nombre, string apellido, string usuario, string hashedPassword, string correo, string fecha)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert into usuarios (nombre, apellido, nombre_usuario, password, correo, F_nacimiento) values ('{0}','{1}','{2}','{3}','{4}','{5}')", nombre, apellido, usuario, hashedPassword, correo, fecha), datos.ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }    
        public static int Add_Product(string nombre, string estado, string modelo, double precio, int quantity, string image)
        {
            conexion.Open();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand("INSERT INTO productos (Nombre, Estado, Modelo, Precio, Quantity, Image) VALUES (@nombre,@estado, @modelo, @precio, @quantity, @image);", conexion);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@estado", estado);
            comando.Parameters.AddWithValue("@modelo", modelo);
            comando.Parameters.AddWithValue("@precio", precio);
            comando.Parameters.AddWithValue("@quantity", quantity);
            comando.Parameters.AddWithValue("@image", image);

            comando.Prepare();
            retorno = comando.ExecuteNonQuery();
            conexion.Close();
            return retorno;
        }

        public static Producto Search_Product(int id)
        {
            Producto product = new Producto();
            conexion.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM productos WHERE id = @id;", conexion);
            cmd.Parameters.AddWithValue("@id", id);
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                product.id = reader.GetInt32(0);
                product.Nombre = reader.GetString(1);
                product.Modelo = reader.GetString(2);
                product.Estado = reader.GetString(3);
                product.Precio = reader.GetDouble(4);
                product.Quantity = reader.GetInt32(5);
                product.Image = reader.GetString(6);
            }
            conexion.Close();
            return product;
        }

        public static DataTable ListarUsuarios()
        {
            //conexion.Open();

            MySqlDataAdapter DA = new MySqlDataAdapter();
            DA.SelectCommand = new MySqlCommand(string.Format("SELECT productos.id, productos.Nombre, productos.Image FROM productos"), conexion);
            DataTable table = new DataTable();

            DA.Fill(table);

            foreach (DataRow row in table.Rows)
            {
                row["Image"] = "<img src='/images/" + row["Image"] + "' />";
            }
            return table;
        }


        public static DataTable Fetch_Products(bool imgElement)
        {
            conexion.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT productos.id, productos.Nombre, productos.Image, productos.Precio, productos.Modelo, productos.Estado, productos.Quantity FROM productos", conexion);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            if (imgElement)
            {
                foreach (DataRow row in DT.Rows)
                {
                    row["Image"] = "<img width='100px' class='thumbnail' src='./images/" + row["Image"] + "' />";
                }
            }
            conexion.Close();
            return DT;
        }

        public static int Update_Product(int id, string Nombre, string Modelo, string Estado, double price, int quantity)
        {

            conexion.Open();


            int retorno = 0;
            string query = "UPDATE productos SET ";
            query += "Nombre = @Nombre, ";
            query += "Modelo = @Modelo, ";
            query += "Estado = @Estado, ";
            query += "Precio = @price, ";
            query += "Quantity = @quantity ";
            query += "WHERE id = @id;";

            MySqlCommand cmd = new MySqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@Nombre", Nombre);
            cmd.Parameters.AddWithValue("@Modelo", Modelo);
            cmd.Parameters.AddWithValue("@Estado", Estado);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@id", id);

            retorno = cmd.ExecuteNonQuery();

            conexion.Close();
            return retorno;
        }
        public static int Update_Product(int id, string Nombre, string Modelo, string Estado, double precio, int quantity, string image)
        {
            conexion.Open();

            int retorno = 0;
            string query = "UPDATE productos SET ";
            query += "Nombre = @Nombre, ";
            query += "Modelo = @Modelo, ";
            query += "Estado = @Estado, ";
            query += "Precio = @price, ";
            query += "Quantity = @quantity ";
            query += "WHERE id = @id;";

            MySqlCommand cmd = new MySqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@Nombre", Nombre);
            cmd.Parameters.AddWithValue("@Modelo", Modelo);
            cmd.Parameters.AddWithValue("@Estado", Estado);
            cmd.Parameters.AddWithValue("@precio", precio);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@id", id);

            retorno = cmd.ExecuteNonQuery();

            conexion.Close();
            return retorno;
        }

        public static int Delete_Product(int id)
        {
            int retorno = 0;
            conexion.Open();
            MySqlCommand cmd = new MySqlCommand("DELETE FROM productos WHERE Id = @id", conexion);
            cmd.Parameters.AddWithValue("@id", id);
            retorno = cmd.ExecuteNonQuery();

            conexion.Close();
            return retorno;
        }
        public static DataTable Get_Sales()
        {
            conexion.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT id, id_usuario, pago, id_carro, modelo, estado FROM compra; ", conexion);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            conexion.Close();
            return DT;
        }
        public static int AgregarImagen(string foto, string texto)
        {
            MySqlConnection conn = datos.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("INSERT INTO imagenes_carrusel (Direccion, Texto) VALUES ('{0}', '{1}');", foto, texto), conn);
            retorno = comando.ExecuteNonQuery();
            return retorno;
        }
        public static string[] ObtenerImagenes()
        {
            MySqlConnection conn = datos.ObtenerConexion();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            DA.SelectCommand = new MySqlCommand(string.Format("SELECT * from imagenes_carrusel;"), conn);
            DataTable table = new DataTable();

            DA.Fill(table);

            string imagenes = "";

            string indicators = "";
            int contador = 0;
            foreach (DataRow row in table.Rows)
            {

                if (row["ID"].ToString() == "1")
                {
                    imagenes = imagenes + "<div class='carousel-item active'><img src='images/" + row["Direccion"] + "' width='1100' height='500'/><div class='carousel-caption d-none d-md-block'> <h5>" + row["Texto"] + "</h5></div></div>";
                }
                else
                {
                    imagenes = imagenes + "<div class='carousel-item'><img src='images/" + row["Direccion"] + "' width='1100' height='500' /><div class='carousel-caption d-none d-md-block'><h5>" + row["Texto"] + "</h5></div></div>";
                }
                 
                if (contador == 0)
                {
                    indicators = indicators + "<li data-target='#demo' data-slide-to='" + contador.ToString() + "' class='active'></li>";
                }
                else
                {
                    indicators = indicators + "<li data-target='#demo' data-slide-to='" + contador.ToString() + "'></li>";
                }
                contador = contador + 1;
            }

            string[] retorno = new string[2];
            retorno[0] = imagenes;
            retorno[1] = indicators;

            return retorno;

        }

        //**************************** Método para obtener un registro ****************************
        public static string[] SeleccionarRegistroImagen(int id)
        {
            MySqlConnection conn = datos.ObtenerConexion();
            MySqlCommand comando = new MySqlCommand(String.Format("SELECT * FROM imagenes_carrusel WHERE ID = {0}", id), conn);
            MySqlDataReader reader = comando.ExecuteReader();

            string[] retorno = new string[2];
            while (reader.Read())
            {
                retorno[0] = reader.GetString(1);
                retorno[1] = reader.GetString(2);
            }

            return retorno;
        }

        //**************************** Método para obtener todos los registros de imágenes ****************************
        public static DataTable ListarImagenes()
        {
            MySqlConnection conn = datos.ObtenerConexion(); //Abrimos la conexion creada.
            MySqlDataAdapter DA = new MySqlDataAdapter();
            DA.SelectCommand = new MySqlCommand(string.Format("SELECT * FROM imagenes_carrusel"), conn);
            DataTable table = new DataTable();
            DA.Fill(table);

            foreach (DataRow row in table.Rows)
            {
                row["Direccion"] = "<img width='100px' class='thumbnail' src='./images/" + row["Direccion"] + "' />";
            }
            return table;
        }

        //**************************** Método para obtener actualizar un registro de imagen ****************************
        public static int ActualizarImagen(int id, string texto, string foto)
        {
            MySqlConnection conn = datos.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando;

            if (foto != String.Empty)
                comando = new MySqlCommand(string.Format("UPDATE imagenes_carrusel SET Texto = '{0}', Direccion = '{1}' WHERE Id = {2}", texto, foto, id), conn);
            else
                comando = new MySqlCommand(string.Format("UPDATE imagenes_carrusel SET Texto = '{0}' WHERE Id = {1}", texto, id), conn);

            retorno = comando.ExecuteNonQuery();

            return retorno;
        }

        //**************************** Método para obtener eliminar un registro de imagen ****************************
        public static int EliminarRegistro(int id)
        {
            MySqlConnection conn = datos.ObtenerConexion(); //Abrimos la conexion creada.
            MySqlCommand comando = new MySqlCommand(String.Format("DELETE FROM imagenes_carrusel WHERE Id = {0}", id), conn);
            int retorno = comando.ExecuteNonQuery();

            return retorno;
        }
    }
}
