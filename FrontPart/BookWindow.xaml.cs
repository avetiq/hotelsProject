using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace FrontPart
{
    /// <summary>
    /// Interaction logic for BookWindow.xaml
    /// </summary>
    public partial class BookWindow : Window
    {
        AfterSearchObj infoForBooking { get; set; }
        DateTime? fromBook { get; set; }
        DateTime? toBook { get; set; }
        public BookWindow(AfterSearchObj selectedHotelinfo, DateTime? from, DateTime? to)
        {
            InitializeComponent();
            infoForBooking = new AfterSearchObj();
            List<string> genders = new List<string>();
            genders.Add("M");
            genders.Add("F");
            genderComboBox.ItemsSource = genders;
            infoForBooking = selectedHotelinfo;
            fromBook = from;
            toBook = to;
            if (toBook == null)
                MessageBox.Show("You don't need to fill your To date, because you have already done it.");
        }

        private void Book_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Book obj = new Book();
                if (name.Text == "")
                    MessageBox.Show("Please insert your name");
                else if (surname.Text == "")
                    MessageBox.Show("Please insert your surname");
                else if (pID.Text == "")
                    MessageBox.Show("Please insert your Passport ID");
                else if (email.Text == "")
                    MessageBox.Show("Please insert your email");
                else if (country.Text == "")
                    MessageBox.Show("Please insert your Country");
                else if (city.Text == "")
                    MessageBox.Show("Please insert your City");
                else if (card.Text == "")
                    MessageBox.Show("Please insert your Credit Card number");
                else if (genderComboBox.Text == "")
                    MessageBox.Show("Please insert your gender");
                else if (toDate.SelectedDate == null && toBook == null)
                    MessageBox.Show("Please insert your To date");
                else
                {
                    obj.personName = name.Text;
                    obj.personSurname = surname.Text;
                    obj.passportID = pID.Text;
                    obj.personEmail = email.Text;
                    obj.personCountry = country.Text;
                    obj.personCity = city.Text;
                    obj.personCreditCardNumber = card.Text;
                    obj.personGender = genderComboBox.Text;
                    obj.from = fromBook;
                    obj.to = (toBook == null) ? toDate.SelectedDate : toBook;
                    obj.hotelName = infoForBooking.HotelName;
                    obj.cityName = infoForBooking.CityName;
                    obj.Money = infoForBooking.Money;
                    obj.BedQuantity = infoForBooking.BedQuantity;
                    HotelsRepository repo = new HotelsRepository();
                    repo.InsertBookInfo(obj);
                    MessageBox.Show("You have successfully booked.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void menu_Click(object sender, RoutedEventArgs e)
        {
            Menu wind = new Menu();
            wind.Show();
            this.Close();
        }
    }
}
