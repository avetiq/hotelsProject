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
    public class SearchController : ControllerBase
    {
        private IHotelsRepository repo { get; set; }


        public SearchController(IHotelsRepository repo)
        {
            this.repo = repo;
        }


        [HttpGet("HotelsNames")]
        public ActionResult<IEnumerable<string>> GetHotelNames()
        {
            return Ok(repo.HotelNames());
        }

        [HttpGet("CityNames")]
        public ActionResult<IEnumerable<string>> GetCityNames()
        {
            return Ok(repo.CityNames());
        }
    }
}