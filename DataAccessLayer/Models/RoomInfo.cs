using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer
{
    public class RoomInfo
    {
        public RoomInfo()
        {
            picturesHotelsRoom = new List<string>();
        }
        public List<string> picturesHotelsRoom { get; set; }
        //public string descriptionHotelRoom { get; set; }
        //public string hotelName { get; set; }
    }
}
