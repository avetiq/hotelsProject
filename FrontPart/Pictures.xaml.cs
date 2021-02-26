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
    /// Interaction logic for Pictures.xaml
    /// </summary>
    public partial class Pictures : Window
    {
        public Pictures()
        {
            InitializeComponent();
            HotelsRepository repo = new HotelsRepository();
            Hotelgrid.ItemsSource = repo.AllHotels();
        }

        private void INsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string pictureUrl = pictureURL.Text;
                Hotel x = Hotelgrid.SelectedItems[0] as Hotel;
                HotelsRepository repo = new HotelsRepository();
                string HotelName = x.Name;
                string CityName = x.City;

                if (pictureUrl == "")
                    MessageBox.Show("Please enter the URL of the picture");
                else
                {
                    //Call the insert function from DataAccessLayer
                    repo.InsertPicture(HotelName, CityName, pictureUrl);
                    MessageBox.Show("You have sucessfully inserted");
                }
            }
            catch (ArgumentOutOfRangeException ex)
            {
                MessageBox.Show("piti Hotel yntreq Table-i mijic.");
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
