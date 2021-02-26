using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api
{
    public class SearchResultWebObjApi
    {
        public int HotelID { get; set; }
        public string HotelName { get; set; }
        public string CityName { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string MainPhoto { get; set; }
    }
}
