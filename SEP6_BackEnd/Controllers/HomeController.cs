using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using RestSharp;
using SEP6_BackEnd.Models;

namespace SEP6_BackEnd.Controllers
{
    public class HomeController : Controller
    {
        public readonly SEP6_MoviesEntities db = new SEP6_MoviesEntities();
        public readonly string baseURL = "https://api.themoviedb.org/3/";
        static string apiKey = "a1b0b79a4d389a27f1a2caf6f232089a";

        public async Task MovieSearch(string search)
        {          
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };

            var baseAddress = new Uri("http://api.themoviedb.org/3/");

            using (var httpClient = new HttpClient { BaseAddress = baseAddress })
            {     
                httpClient.DefaultRequestHeaders.TryAddWithoutValidation("accept", "application/json");

                // api_key can be requestred on TMDB website
                using (var response = await httpClient.GetAsync("search/movie?api_key=" + apiKey + "&query=" + search))
                {
                    string responseData = await response.Content.ReadAsStringAsync();

                    var model = JsonConvert.DeserializeObject<getMoviesAPI>(responseData);
                     Console.WriteLine(responseData);

                }
            }
        }
        
        public ActionResult Index()
        {
            MovieSearch("Star Wars");
            return View();
        }

        
    }
}