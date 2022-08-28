using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace ProyectoPTC2022
{
    public class MCompra
    {
        public static MySqlConnection conexion = new MySqlConnection("Server= 127.0.0.1; database=ptc; Uid=root; pwd=;");
        public static int update(int actualizacion, string cmdUpdate)
        {
            int retorno = 0;
            MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=; pwd=;");
            conexion.Open();
            MySqlCommand update = new MySqlCommand(cmdUpdate, conexion);
            retorno = update.ExecuteNonQuery();
            conexion.Close();
            return retorno;
        }

        private static string _valorGlobal = string.Empty;
        public static string valorGlobal
        {
            get { return _valorGlobal; }
            set { _valorGlobal = value; }
        }


        public static MySqlConnection ObtenerConexion()
        {
            MySqlConnection conectar = new MySqlConnection("Server= 127.0.0.1; database=ptc; Uid=root; pwd=;");
            conectar.Open();
            return conectar;
        }


        public static int AgregarUsuarioAsociado(string usuarioAsociado, string n_Tarjeta, string validarPropietario)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Update tarjetas Set Usuario_Asociado='{0}' where N_Tarjeta='{1}' AND Nombre_Cliente= '{2}'", usuarioAsociado, n_Tarjeta, validarPropietario), ObtenerConexion());
            retorno = comando.ExecuteNonQuery();
            //if (retorno != 0
            return retorno;
        }
        public static int AgregarCompra(string usuarioAsociado, double monto, int unidades, string n_Tarjeta)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert into ventas (Comprador, Valor_Compra, Cantidad_Asientos, N_Tarjeta) values ('{0}', '{1}', '{2}', '{3}')", usuarioAsociado, monto, unidades, n_Tarjeta), ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }
        public static int ActualizarSaldoTarjeta(double monto, string n_Tarjeta, string usuarioAsociado, string validarPropietario)
        {
            int retorno = 0;
            var cmd = "Select Saldo from tarjetas where N_Tarjeta = '" + n_Tarjeta + "';";
            MySqlCommand obtenerSaldo = new MySqlCommand(cmd, ObtenerConexion());
            double saldo = (double)obtenerSaldo.ExecuteScalar();
            double nuevoSaldo = saldo - monto;
            if (nuevoSaldo >= 0)
            {
                MySqlCommand comando = new MySqlCommand(string.Format("UPDATE tarjetas SET Saldo= Saldo - '{0}' WHERE N_Tarjeta='{1}' AND Usuario_Asociado='{2}' AND Nombre_Cliente= '{3}'", monto, n_Tarjeta, usuarioAsociado, validarPropietario), ObtenerConexion());
                retorno = comando.ExecuteNonQuery();
            }
            return retorno;
        }
        public static int Login(string Username, string encriptada)
        {
            int retorno = 0;
            var cmd = "SELECT Id_Usuario from usuarios WHERE Nombre_Usuario='" + Username + "' AND Password='" + encriptada + "';";
            MySqlCommand comando = new MySqlCommand(cmd, ObtenerConexion());

            retorno = comando.ExecuteNonQuery();
            return retorno;
        }
        public static int Compra(string id_usuario, double pago, string id_carro, string modelo, string estado, string tarjeta)//Inserta la venta en la tabla de ventas
        {
            int retorno = 0;
            MySqlCommand insertar;

            int retornoCantidad = CantidadDeCarros(id_carro);

            if (retornoCantidad < 1)
            {
                return retorno;
            }
            
            MySqlCommand updateInventory = new MySqlCommand("UPDATE productos SET Quantity = (Quantity - 1) WHERE Id = @itemId;", MCompra.ObtenerConexion());
            updateInventory.Parameters.AddWithValue("@itemId", id_carro);
            updateInventory.Prepare();

            insertar = new MySqlCommand(String.Format("Insert Into compra (id_usuario, pago, id_carro, modelo, estado, tarjeta) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')", id_usuario, pago.ToString(), id_carro.ToString(), modelo, estado, tarjeta), MCompra.ObtenerConexion());

            updateInventory.ExecuteNonQuery();
            retorno = insertar.ExecuteNonQuery();
            return retorno;
        }

        private static int CantidadDeCarros(string id_carro) 
        {
            int cantidad = 0;
            MySqlCommand cmd = new MySqlCommand(String.Format("SELECT Quantity FROM productos WHERE Id = {0};", id_carro), MCompra.ObtenerConexion()); //Realizamos una selecion de la tabla usuarios.
            
            if (cmd.ExecuteScalar() == null)
            {
                cantidad = 0;
            }
            else
                cantidad = Convert.ToInt32(cmd.ExecuteScalar());
            conexion.Close();
            return cantidad;
        }

    }
}
