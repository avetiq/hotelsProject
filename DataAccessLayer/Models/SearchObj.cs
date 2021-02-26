using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer
{
    public class SearchObj
    {
        public string SearchHotelName { get; set; }
        public string SearchCity { get; set; }
        public DateTime? SearchFromDate { get; set; }
        public DateTime? SearchToDate { get; set; }
        public int BedQuantity { get; set; }
    }
}
