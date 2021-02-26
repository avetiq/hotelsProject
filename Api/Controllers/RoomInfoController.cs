using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;
using DataAccessLayer;
namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomsInfoController : ControllerBase
    {
        private IHotelsRepository repo { get; set; }
        private readonly IMapper mapper;

        public RoomsInfoController(IHotelsRepository repo, IMapper mapper)
        {
            this.repo = repo;
            this.mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<DifFreeRooms> Get([FromQuery]SearchObj query)
        {
            //here all we already have hotelName, and CityName, dateTo and bedQuantity can be skipted
            return mapper.Map<IEnumerable<DifFreeRooms>>(repo.getFreeRoomsWithDifferentPrices(mapper.Map<SearchObj>(query)));
        }


    }
}