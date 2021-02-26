using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer
{
    public class SearchResultWebObj
    {
        public int HotelID { get; set; }
        public string HotelName { get; set; }
        public string CityName { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string MainPhoto { get; set; }

    }
}
