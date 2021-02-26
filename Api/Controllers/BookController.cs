using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using DataAccessLayer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private IHotelsRepository repo { get; set; }
        private readonly IMapper mapper;


        public BookController(IHotelsRepository repo, IMapper mapper)
        {
            this.repo = repo;
            this.mapper = mapper;
        }

        [HttpPost]
        public ActionResult<string> Post([FromBody]Book query)
        {
            repo.InsertBookInfo(query);
            return Created("","the info has successfully created");
        }

    }
}