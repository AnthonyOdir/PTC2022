using Google.Cloud.Translation.V2;
using System;

namespace ProyectoPTC2022.Utils
{
    public class GTranslate
    {
        private const string _apiKey = "AIzaSyCWZBn_pqN-SGLDU7HOL8FulWKXbPoJ5tw";
        public int language;

        public GTranslate(int _language)
        {
            language = _language;
        }
        public string Translate(string text) 
        {
            var client = TranslationClient.CreateFromApiKey(_apiKey);
            if (language == Languages.ENGLISH)
            {
                return client.TranslateText(text, LanguageCodes.English, LanguageCodes.Spanish).TranslatedText;
            }
            else {
                return client.TranslateText(text, LanguageCodes.Spanish, LanguageCodes.English).TranslatedText;
            }
        }

        public string GetLanguageButtonText()
        {
            return language == Languages.ENGLISH ? "Español" : "English";
        }

        public void ChangeLanguage()
        {
            if (language == Languages.ENGLISH)
            {
                language = Languages.SPANISH;
            }
            else
            {
                language = Languages.ENGLISH;
            }
        }
    }
}

public static class Languages 
{
    public static int SPANISH = 0;
    public static int ENGLISH = 1;
}