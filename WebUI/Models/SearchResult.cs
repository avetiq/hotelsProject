using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Models
{
    public class SearchResult
    {
        public List<Hotel> hotelListObj;

        public string SearchHotelName { get; set; }
        public string SearchCity { get; set; }
        public DateTime? SearchFromDate { get; set; }
        public DateTime? SearchToDate { get; set; }

        public void Init(ForLoadingInfo obj)
        {
            this.SearchHotelName = obj.SearchHotelName;
            this.SearchCity = obj.SearchCity;
            this.SearchFromDate = obj.SearchFromDate;
            this.SearchToDate = obj.SearchToDate;
        }

        public SearchResult()
        {
            hotelListObj = new List<Hotel>();
        }
    }
}
