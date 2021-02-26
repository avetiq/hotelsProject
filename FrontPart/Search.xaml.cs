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
    /// Interaction logic for Search.xaml
    /// </summary>
    public partial class Search : Window
    {
        SearchObj infoToSearch = new SearchObj();
        public Search()
        {
            InitializeComponent();
            HotelsRepository repo = new HotelsRepository();
            cityComboBox.ItemsSource = repo.GetListCity();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                
                infoToSearch.SearchHotelName = txtHotelName.Text;
                infoToSearch.SearchCity = cityComboBox.Text;// == "" ? null : cityComboBox.Text;
                infoToSearch.BedQuantity = String.IsNullOrEmpty(BedQuantity.Text) ? 0 : Int32.Parse(BedQuantity.Text);
                infoToSearch.SearchFromDate = (dFrom.SelectedDate == null) ? (DateTime?)null : Convert.ToDateTime(dFrom.SelectedDate);
                infoToSearch.SearchToDate = (dTo.SelectedDate == null) ? (DateTime?)null : Convert.ToDateTime(dTo.SelectedDate);

                HotelsRepository repo = new HotelsRepository();
                infoDataGrid.ItemsSource = repo.Search(infoToSearch);
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("You can only miss the To date time info.All components need to be filled.");
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Menu wind = new Menu();
            wind.Show();
            this.Close();
        }

        private void Book_Click(object sender, RoutedEventArgs e)
        {
            AfterSearchObj selectedHotel = infoDataGrid.SelectedItems[0] as AfterSearchObj;
            BookWindow window = new BookWindow(selectedHotel, infoToSearch.SearchFromDate, infoToSearch.SearchToDate);
            window.Show();
            this.Close();
        }
    }
}
