using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Api
{
    public class SearchObjApi
    {
        public string SearchHotelName { get; set; }
        public string SearchCity { get; set; }

        [Required]
        public DateTime? SearchFromDate { get; set; }
        public DateTime? SearchToDate { get; set; }
        public int BedQuantity { get; set; }
    }
}
