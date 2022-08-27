using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace ProyectoPTC2022
{
    public class MCompra
    {
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

        public static int insertar(int llave, string usuario, double precio, string nombreCarro)//Inserta la venta en la tabla de ventas
        {
            int retorno = 0;
            MySqlCommand insertar = new MySqlCommand(String.Format("Insert Into ventas (Comprador, Valor_Compra, N_Tarjeta, Llave_Codigo, Evento) values('{0}', '{1}', '{2}', '4-38582-836800-0982', '{3}','{4}')", usuario, precio.ToString(), llave.ToString(), nombreCarro), MCompra.ObtenerConexion());

            retorno = insertar.ExecuteNonQuery();

            return retorno;
        }
        public static int actualizarEntradas(int entradas, string nombreEvento)//Inserta la venta en la tabla de ventas
        {
            int retorno = 0;
            var cmd = "Select Entradas_Disponibles from eventos where Nombre_Evento ='" + nombreEvento + "'";
            MySqlCommand cmdActualizarP1 = new MySqlCommand(cmd, ObtenerConexion());
            Int32 cantidadEntradas;
            cmdActualizarP1.Parameters.Add("@Name", MySqlDbType.VarChar);
            cantidadEntradas = (int)cmdActualizarP1.ExecuteScalar();
            int NuevaCantidad = cantidadEntradas - entradas;
            if (NuevaCantidad >= 0)
            {
                var cmd2 = "Update eventos Set Entradas_Disponibles = '" + NuevaCantidad + "' WHERE Nombre_Evento = '" + nombreEvento + "';";
                MySqlCommand cmdActualizarP2 = new MySqlCommand(cmd2, ObtenerConexion());
                retorno = cmdActualizarP2.ExecuteNonQuery();
            }
            return retorno;

        }
        public static int estadisticas(int entradas, string nombreEvento)

        {
            int retorno;

            var cmd = "Update eventos Set Ausentes = Ausentes+ " + entradas + " where Nombre_Evento='" + nombreEvento + "'";
            MySqlCommand cmdestadisticas = new MySqlCommand(cmd, ObtenerConexion());
            retorno = cmdestadisticas.ExecuteNonQuery();
            return retorno;
        }
        public static int Compra(string id_usuario, double pago, string id_carro, string tarjeta)//Inserta la venta en la tabla de ventas
        {
            int retorno = 0;
            MySqlCommand insertar = new MySqlCommand(String.Format("Insert Into Compra (id_usuario, pago, id_carro, tarjeta) values('{0}', '{1}', '{2}', '{3}')", id_usuario, pago.ToString(), id_carro.ToString(), tarjeta), MCompra.ObtenerConexion());

            retorno = insertar.ExecuteNonQuery();

            return retorno;
        }
    }
}
