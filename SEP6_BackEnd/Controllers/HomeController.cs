using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Mvc;
using Newtonsoft.Json;
using SEP6_BackEnd.Models;

namespace SEP6_BackEnd.Controllers
{
    public class HomeController : Controller
    {
        private static readonly string apiKey = "a1b0b79a4d389a27f1a2caf6f232089a";
        public readonly string baseURL = "https://api.themoviedb.org/3/";
        public readonly SEP6_MoviesEntities db = new SEP6_MoviesEntities();

        public async Task MovieSearch(string search)
        {
            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };

            var baseAddress = new Uri("http://api.themoviedb.org/3/");

            using (var httpClient = new HttpClient {BaseAddress = baseAddress})
            {
                httpClient.DefaultRequestHeaders.TryAddWithoutValidation("accept", "application/json");

                // api_key can be requestred on TMDB website
                using (var response = await httpClient.GetAsync("search/movie?api_key=" + apiKey + "&query=" + search))
                {
                    var responseData = await response.Content.ReadAsStringAsync();

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