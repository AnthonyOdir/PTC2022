using ProyectoPTC2022.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoPTC2022
{
    public partial class Carrocliente : System.Web.UI.Page
    {
        public static GTranslate gTranslate;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Translate Service
            gTranslate = new GTranslate(Convert.ToInt32(Session["language"]));
            btn_idioma.Text = gTranslate.GetLanguageButtonText();
        }

        protected void btn_idioma_Click(object sender, EventArgs e)
        {
            gTranslate.ChangeLanguage();
            Session["language"] = gTranslate.language;
            btn_idioma.Text = gTranslate.GetLanguageButtonText();
            btncerrar.Text = gTranslate.Translate("Cerrar Sesión");
        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
            localStorageLiteral.Text =
                    "<script>" +
                        JsLocalStorage.Clear() +
                        JsService.ReplaceLocation("Login2.aspx") +
                    "</script>";
            gTranslate.ChangeLanguage();
            Session["language"] = gTranslate.language;
            btn_idioma.Text = gTranslate.GetLanguageButtonText();
        }
    }
}