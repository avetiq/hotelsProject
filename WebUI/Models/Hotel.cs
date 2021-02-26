using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Models
{
    public class Hotel
    {
        public int hotelID { get; set; }
        public string hotelName { get; set; }
        public string cityName { get; set; }
        public string shortDescription { get; set; }
        public string longDescription { get; set; }
        public string mainPhoto { get; set; }

    }
}
