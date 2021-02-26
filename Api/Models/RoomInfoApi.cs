using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api
{
    public class RoomInfoApi
    {
        public RoomInfoApi()
        {
            picturesHotelsRoom = new List<string>();
        }
        public List<string> picturesHotelsRoom { get; set; }
        //public string descriptionHotelRoom { get; set; }
        //public string hotelName { get; set; }
    }
}
