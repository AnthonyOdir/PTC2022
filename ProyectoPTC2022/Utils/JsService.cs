using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoPTC2022.Utils
{
    public class JsService
    {
        private static string _host = "https://localhost:44357";
        public static string ReplaceLocation(string location)
        {
            return $"window.location.replace('{_host}/{location}');";
        }
    }
}