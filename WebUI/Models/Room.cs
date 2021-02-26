using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Models
{
    [JsonObjectAttribute]
    public class Room
    {
        public string hotelName { get; set; }
        public string cityName { get; set; }
        public DateTime dateFrom { get; set; }
        public DateTime? dateTo { get; set; }
        public string descriptionHotelRoom { get; set; }
        public List<string> picturesHotelsRoom { get; set; }
        public List<RoomPricesBedQuantity> freeRooms { get; set; }
        public string[] Photos { get; set; }

  
    }
}
