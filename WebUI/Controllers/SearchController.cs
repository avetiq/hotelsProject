using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class SearchController : Controller
    {
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            ForLoadingInfo model = new ForLoadingInfo();
            HttpClient client = new HttpClient();

            client.BaseAddress = new Uri("http://avetiqmanukyan-001-site1.dtempurl.com/");

            HttpRequestMessage requesForHotels = new HttpRequestMessage();
            requesForHotels.Method = HttpMethod.Get;
            requesForHotels.RequestUri = new Uri("api/Search/HotelsNames", UriKind.Relative);
            HttpResponseMessage responseHotels = await client.SendAsync(requesForHotels);
            if (responseHotels.IsSuccessStatusCode)
            {
                string responseBodyHotels = await responseHotels.Content.ReadAsStringAsync();
                model.Hotels = JsonConvert.DeserializeObject<List<string>>(responseBodyHotels);
            }

            HttpRequestMessage requesForCities = new HttpRequestMessage();
            requesForCities.Method = HttpMethod.Get;
            requesForCities.RequestUri = new Uri("api/Search/CityNames", UriKind.Relative);
            HttpResponseMessage responseCities = await client.SendAsync(requesForCities);
            if (responseCities.IsSuccessStatusCode)
            {
                string responseBodyCities = await responseCities.Content.ReadAsStringAsync();
                model.Cities = JsonConvert.DeserializeObject<List<string>>(responseBodyCities);
            }




            return View(model);
        }


        [HttpPost]
        public async Task<IActionResult> Index([FromForm]ForLoadingInfo searchObj)
        {
            SearchResult result = new SearchResult();
            result.Init(searchObj);

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("http://avetiqmanukyan-001-site1.dtempurl.com/");

            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            string uri = string.Format("/api/Hotels?SearchHotelName={0}&SearchCity={1}&SearchFromDate={2}&SearchToDate={3}&BedQuantity={4}", searchObj.SearchHotelName, searchObj.SearchCity, searchObj.SearchFromDate, searchObj.SearchToDate, searchObj.BedQuantity);

            HttpResponseMessage response = await client.GetAsync(uri);

            if (response.IsSuccessStatusCode)
            {
                string responseBody = await response.Content.ReadAsStringAsync();
                result.hotelListObj = JsonConvert.DeserializeObject<List<Hotel>>(responseBody);
            }


            return View("Hotels", result);
        }



        [HttpPost]
        public async Task<IActionResult> BookPost(Book obj)
        {
            HttpClient client = new HttpClient();

            client.BaseAddress = new Uri("http://avetiqmanukyan-001-site1.dtempurl.com");
            HttpContent requestBody = new StringContent(JsonConvert.SerializeObject(obj), System.Text.Encoding.UTF8, "application/json");
            HttpResponseMessage response = await client.PostAsync(new Uri("/api/Book", UriKind.Relative), requestBody);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            string s = await response.Content.ReadAsStringAsync();

            return View();
        }


        [HttpGet]
        public IActionResult Book(Book obj)
        {
            return View(obj);
        }







        public async Task<IActionResult> Room(RoomPassingObj obj)
        {

            Room result = new Room();
            result.cityName = obj.cityName;
            result.hotelName = obj.hotelName;
            result.dateFrom = obj.dateFrom;
            result.dateTo = obj.dateTo;
            result.descriptionHotelRoom = obj.descriptionHotelRoom;
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("http://avetiqmanukyan-001-site1.dtempurl.com/");

            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));




            string uriForPhotos = string.Format("/api/Hotels/{0}", obj.id);

            HttpResponseMessage response = await client.GetAsync(uriForPhotos);

            if (response.IsSuccessStatusCode)
            {
                string responseBody = await response.Content.ReadAsStringAsync();
                //responseBody = responseBody.Replace("[", "{").Replace("]", "}");
                result.picturesHotelsRoom = JsonConvert.DeserializeObject<List<string>>(responseBody);
            }


            string uri = string.Format("/api/RoomsInfo?SearchHotelName={0}&SearchCity={1}&SearchFromDate={2}", obj.hotelName, obj.cityName, obj.dateFrom);

            HttpResponseMessage responsePrices = await client.GetAsync(uri);

            if (responsePrices.IsSuccessStatusCode)
            {
                string responseBody = await responsePrices.Content.ReadAsStringAsync();

                result.freeRooms = JsonConvert.DeserializeObject<List<RoomPricesBedQuantity>>(responseBody);
            }


            result.Photos = result.picturesHotelsRoom.ToArray();
            return View("Room", result);
        }


    }
}