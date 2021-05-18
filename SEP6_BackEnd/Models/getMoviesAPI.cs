using System.Collections.Generic;

namespace SEP6_BackEnd.Models
{
    public class getMoviesAPI
    {
        
         //   public List<int> genre_ids { get; set; }
            public int id { get; set; }
            public string original_language { get; set; }
            public string original_title { get; set; }
            public string overview { get; set; }
            public double popularity { get; set; }
            public string release_date { get; set; }
            public string title { get; set; }
            public double vote_average { get; set; }
            public int vote_count { get; set; }
        }
}