using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using DataAccessLayer;

namespace Api
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<RoomInfoApi, RoomInfo>();
            CreateMap<RoomInfo, RoomInfoApi>();
            CreateMap<SearchResultWebObjApi, SearchResultWebObj>();
            CreateMap<SearchResultWebObj, SearchResultWebObjApi>();
            CreateMap<SearchObjApi, SearchObj>();
            CreateMap<SearchObj, SearchObjApi>();
            CreateMap<DifFreeRoomsApi, DifFreeRooms>();
            CreateMap<DifFreeRooms, DifFreeRoomsApi>();

        }
    }
}
