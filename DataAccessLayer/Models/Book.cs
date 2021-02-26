using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DataAccessLayer
{
    public class Book
    {
        [Required]
        public string passportID { get; set; }
        [Required]
        public string personName { get; set; }
        [Required]
        public string personSurname { get; set; }
        [Required]
        public string personGender { get; set; }
        [Required]
        public string personEmail { get; set; }
        [Required]
        public string personCity { get; set; }
        [Required]
        public string personCountry { get; set; }
        [Required]
        public string personCreditCardNumber { get; set; }
        [Required]
        public DateTime? from { get; set; }
        [Required]
        public DateTime? to { get; set; }
        [Required]
        public string hotelName { get; set; }
        [Required]
        public string cityName { get; set; }
        [Required]
        public decimal Money { get; set; }
        [Required]
        public Byte BedQuantity { get; set; }
    }
}
