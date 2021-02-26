using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Models
{
    public class RoomPassingObj
    {
        public int id { get; set; }
        public string hotelName { get; set; }
        public string cityName { get; set; }
        public DateTime dateFrom { get; set; }
        public DateTime dateTo { get; set; }

        public string descriptionHotelRoom { get; set; }

    }
}
