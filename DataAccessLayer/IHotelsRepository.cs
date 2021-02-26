using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer
{
    public interface IHotelsRepository
    {
        List<string> HotelNames();
        List<string> CityNames();
        List<ReservedInfo> ReseverHotelsList();
        List<Hotel> AllHotels();
        void DeleteHotel(string hotelName, string cityName);
        List<string> getRoomInformationPicturesAndDescription(int id);
        List<DifFreeRooms> getFreeRoomsWithDifferentPrices(SearchObj ToSearch);
        void InsertDescription(string HName, string CName, string longDesc, string shortDesc);
        void InsertBookInfo(Book obj);
        void InsertPicture(string HName, string CName, string PictureURL);
        void InsertHotelWithProperties(InsertHotel obj);
        List<AfterSearchObj> Search(SearchObj ToSearch);
        List<SearchResultWebObj> SearchWeb(SearchObj ToSearch);
        List<string> GetListCity();

    }
}
