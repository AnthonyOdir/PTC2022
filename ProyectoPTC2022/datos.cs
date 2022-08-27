using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MySql.Data.MySqlClient;


namespace ProyectoPTC2022
{
    public class datos
    {
        public static MySqlConnection ObtenerConexion()
        {
            MySqlConnection datos = new MySqlConnection("server=127.0.0.1; database=ptc; Uid=root; pwd=;");
            datos.Open();
            return datos;
        }
    }
}