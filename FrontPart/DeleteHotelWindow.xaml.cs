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
    /// Interaction logic for DeleteHotelWindow.xaml
    /// </summary>
    public partial class DeleteHotelWindow : Window
    {
        public DeleteHotelWindow()
        {
            InitializeComponent();
            HotelsRepository repo = new HotelsRepository();
            Hotelgrid.ItemsSource = repo.AllHotels();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Hotel x = Hotelgrid.SelectedItems[0] as Hotel;
            HotelsRepository repo = new HotelsRepository();
            string m = x.Name;
            string g = x.City;
            repo.DeleteHotel(m, g);
            MessageBox.Show("Succesfully deleted");
            Hotelgrid.ItemsSource = repo.AllHotels();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Menu wind = new Menu();
            wind.Show();
            this.Close();
        }
    }
}
