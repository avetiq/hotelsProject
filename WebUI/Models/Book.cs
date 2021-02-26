using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebUI.Models
{
    public class Book
    {
        public string passportID { get; set; }
        public string personName { get; set; }
        public string personSurname { get; set; }
        public string personGender { get; set; }

        public string personEmail { get; set; }
        public string personCity { get; set; }
        public string personCountry { get; set; }

        public string personCreditCardNumber { get; set; }

        public DateTime FROM { get; set; }
        public DateTime to { get; set; }

        public string hotelName { get; set; }
        public string cityName { get; set; }

        public decimal Money { get; set; }
        public int BedQuantity { get; set; }




    }
}
