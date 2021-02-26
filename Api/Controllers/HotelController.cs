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
    public class HotelsController : ControllerBase
    {
        private IHotelsRepository repo { get; set; }
        private readonly IMapper mapper;

        public HotelsController(IHotelsRepository repo, IMapper mapper)
        {
            this.repo = repo;
            this.mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<SearchResultWebObjApi> Get([FromQuery]SearchObjApi query)
        {
            if (query.SearchHotelName == null)
                query.SearchHotelName = "";
            if (query.SearchCity == null)
                query.SearchCity = "";

            return mapper.Map<IEnumerable<SearchResultWebObjApi>>(repo.SearchWeb(mapper.Map<SearchObj>(query)));
        }



        [HttpGet("{id:int}")]
        public List<string> Get(int id)
        {
            return (repo.getRoomInformationPicturesAndDescription(id));

        }

    }
}