using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Models
{
    public class ForLoadingInfo
    {
        public string SearchHotelName { get; set; }
        public string SearchCity { get; set; }
        public DateTime? SearchFromDate { get; set; }
        public DateTime? SearchToDate { get; set; }
        public int BedQuantity { get; set; }

        public List<string> Cities { get; set; }
        public List<string> Hotels { get; set; }

        public ForLoadingInfo()
        {
            this.Cities = new List<string>();
            this.Hotels = new List<string>();
        }

    }
}
