using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoPTC2022.Utils
{
    public class JsLocalStorage
    {
        public static string getItem(string itemName)
        {
            return $"window.localStorage.getItem('{itemName}');";
        }
        public static string SetItem(string itemName, string itemValue) 
        {
            return $"window.localStorage.setItem('{itemName}', '{itemValue}');";
        }

        public static string RemoveItem(string itemName) 
        {
            return $"window.localStorage.removeItem('{itemName}');";
        }

        public static string Clear()
        {
            return $"window.localStorage.clear();";
        }
    }
}