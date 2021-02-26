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
    /// Interaction logic for InsertHotels.xaml
    /// </summary>
    public partial class InsertHotels : Window
    {
        public InsertHotel HotelInfo { get; set; }
        public InsertHotels()
        {
            HotelInfo = new InsertHotel();
            InitializeComponent();

            this.DataContext = HotelInfo;
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string errorStr = "";
                HotelsRepository obj = new HotelsRepository();
                if (HotelInfo.BedQuantity!=0 && HotelInfo.Money!=0 && HotelInfo.RoomNumber!=0)
                {
                    obj.InsertHotelWithProperties(HotelInfo);
                }
                if(HotelInfo.BedQuantity == 0)
                    errorStr += "hotel room bedQuantity can't be zero " + Environment.NewLine;
                if(HotelInfo.Money == 0)
                    errorStr += "hotel room money can't be zero " + Environment.NewLine;
                if(HotelInfo.RoomNumber == 0)
                    errorStr += "hotel room roomNumber can't be zero " + Environment.NewLine;


                if (errorStr == "")
                    MessageBox.Show("You have succesfully inserted new hotel");
                else
                    MessageBox.Show(errorStr);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Menu wind = new Menu();
            wind.Show();
            this.Close();
        }
    }
}
