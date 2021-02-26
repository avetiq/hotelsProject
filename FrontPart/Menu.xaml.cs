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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FrontPart
{
    /// <summary>
    /// Interaction logic for Menu.xaml
    /// </summary>
    public partial class Menu : Window
    {
        public Menu()
        {
            InitializeComponent();
            HotelsRepository repo = new HotelsRepository();
            reservedRooms.ItemsSource = repo.ReseverHotelsList();
        }

        private void Search_Click(object sender, RoutedEventArgs e)
        {
            Search SearchWindow = new Search();
            SearchWindow.Show();
            this.Close();

        }
        private void Insert_Click(object sender, RoutedEventArgs e)
        {
            InsertHotels winInsert = new InsertHotels();
            winInsert.Show();
            this.Close();
        }

        private void DeleteHotel_Click(object sender, RoutedEventArgs e)
        {
            DeleteHotelWindow window = new DeleteHotelWindow();
            window.Show();
            this.Close();
        }

        private void Description_Click(object sender, RoutedEventArgs e)
        {
            Description window = new Description();
            window.Show();
            this.Close();
        }

        private void Pictures_Click(object sender, RoutedEventArgs e)
        {
            Pictures window = new Pictures();
            window.Show();
            this.Close();
        }
    }
}
