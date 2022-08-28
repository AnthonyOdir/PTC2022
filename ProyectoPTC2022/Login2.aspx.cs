﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace ProyectoPTC2022
{
    public partial class Login2 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool logged_in = Convert.ToBoolean(Session["username"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);
                if (logged_in)
                {
                    if (isAdmin)
                        Response.Redirect("Inicio.aspx");
                    Response.Redirect("Defaultcliente.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (TxtContra.Text != "" && TxtUsuario.Text != "")
            {

                string usuario;
                string hashedPassword = Hash_SHA256(TxtContra.Text);
                usuario = TxtUsuario.Text;

                datos1.valorGlobal = usuario;
                MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=root; pwd=;");
                var cmd = "SELECT id from usuarios WHERE nombre_usuario='" + usuario + "' AND Password='" + hashedPassword + "';";
                MySqlCommand comando = new MySqlCommand(cmd, conexion);
                conexion.Open();
                int id = Convert.ToInt32(comando.ExecuteScalar());
                int isAdmin = Check_Admin(id);
                if (id != 0)
                {
                    Session["username"] = TxtUsuario;
                    Session["userId"] = id;
                    Session["isAdmin"] = isAdmin;

                    // 0 = User
                    if (isAdmin == 0)
                    {
                        Response.Redirect("Defaultcliente.aspx");
                    }
                    else
                    {
                        //Not admin
                        Response.Redirect("Inicio.aspx");
                    }

                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Algo salio mal', 'Su usuario o contraseña no son correctos', 'error') </script>";
                    TxtContra.Text = "";
                    TxtUsuario.Text = "";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS', 'No deje espacios en blanco', 'error') </script>";
            }
        }

        public static string Hash_SHA256(string text)
        {
            StringBuilder sb = new StringBuilder();
            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(text));
                foreach (Byte b in result)
                    sb.Append(b.ToString("x2"));
            }
            return sb.ToString();
        }

        public static int Check_Admin(int id)
        {
            MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=ptc; Uid=root; pwd=;");
            conexion.Open();
            int userType = 0;
            MySqlCommand cmd = new MySqlCommand(String.Format("SELECT User_Type FROM usuarios WHERE Id = {0};", id), conexion); //Realizamos una selecion de la tabla usuarios.

            if (cmd.ExecuteScalar() == null)
            {
                userType = 0;
            }
            else
                userType = Convert.ToInt32(cmd.ExecuteScalar());
            conexion.Close();
            return userType;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}