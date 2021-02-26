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
    /// Interaction logic for Description.xaml
    /// </summary>
    public partial class Description : Window
    {
        public Description()
        {
            InitializeComponent();
            HotelsRepository repo = new HotelsRepository();
            Hotelgrid.ItemsSource = repo.AllHotels();
        }

        private void AddDescripton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string error = "";
                string shortText = ShortTextBox.Text;
                string longText = LongTextBox.Text;
                if (shortText == "")
                    error += "Please fill the Short text description" + Environment.NewLine;
                if(longText == "")
                    error += "Please fill the Long text description" + Environment.NewLine;
                Hotel x = Hotelgrid.SelectedItems[0] as Hotel;
                HotelsRepository repo = new HotelsRepository();
                string HotelName = x.Name;
                string CityName = x.City;

                if (error != "")
                    MessageBox.Show(error);
                else
                {
                    //Call the insert function from DataAccessLayer
                    repo.InsertDescription(HotelName, CityName, longText, shortText);
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

        private void back_Menu_Click(object sender, RoutedEventArgs e)
        {
            Menu wind = new Menu();
            wind.Show();
            this.Close();
        }
    }
}
