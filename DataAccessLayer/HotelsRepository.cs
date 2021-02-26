using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DataAccessLayer
{
    public class HotelsRepository:IHotelsRepository
    {

        public List<string> HotelNames()
        {
            List<string> res = new List<string>();

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;

                    cmd.CommandText = "select distinct [Name] from Hotels";
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                string curr;
                                curr = reader.GetString(0);
                                res.Add(curr);
                            }
                        }
                    }
                }
            }
                return res;
        }


        public List<string> CityNames()
        {
            List<string> res = new List<string>();

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;

                    cmd.CommandText = "select distinct [City] from Hotels";
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                string curr;
                                curr = reader.GetString(0);
                                res.Add(curr);
                            }
                        }
                    }
                }
            }
            return res;
        }





        public List<ReservedInfo> ReseverHotelsList()
        {
            List<ReservedInfo> resu = new List<ReservedInfo>();
            using (SqlConnection con = ConnectionManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    con.Open();
                    cmd.Connection = con;

                    cmd.CommandText = "ReservedRoom";
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            int moneyIndex = reader.GetOrdinal("Money");
                            int hotelName = reader.GetOrdinal("HotelName");
                            int hotelCity = reader.GetOrdinal("City");
                            int bedindex = reader.GetOrdinal("BedQuantity");
                            while (reader.Read())
                            {
                                ReservedInfo curr = new ReservedInfo();
                                curr.hotelName = reader.GetString(hotelName);
                                curr.cityName = reader.GetString(hotelCity);
                                curr.bedquantity = reader.GetByte(bedindex);
                                curr.money = reader.GetDecimal(moneyIndex);
                                resu.Add(curr);
                            }
                        }
                    }
                }
            }




                return resu;        
        }
        public List<Hotel> AllHotels()
        {
            List<Hotel> result = new List<Hotel>();
            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;

                    cmd.CommandText = "select * from Hotels";
                    cmd.CommandType = CommandType.Text;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            int hID = reader.GetOrdinal("ID");
                            int hName = reader.GetOrdinal("Name");
                            int hCity = reader.GetOrdinal("City");
                            while (reader.Read())
                            {
                                Hotel curr = new Hotel();
                                curr.City = reader.GetString(hCity);
                                curr.Name = reader.GetString(hName);
                                //curr.ID = reader.GetInt32(hID);
                                result.Add(curr);
                            }
                        }
                    }
                }
            }


                return result;
        }


        public void DeleteHotel(string hotelName, string cityName)
        {
            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "DeleteHotel";

                    cmd.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = hotelName;
                    cmd.Parameters.Add("@CityName", SqlDbType.VarChar).Value = cityName;

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void InsertDescription(string HName, string CName, string longDesc, string shortDesc)
        {
            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "InsertDescription";

                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = HName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = CName;
                    command.Parameters.Add("@ShortDescription", SqlDbType.NVarChar).Value = shortDesc;
                    command.Parameters.Add("@LongDescription", SqlDbType.NVarChar).Value = longDesc;

                    command.ExecuteNonQuery();

                }
            }
        }

        public void InsertBookInfo(Book obj)
        {
            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {

                    try
                    {
                        conn.Open();
                        command.Connection = conn;

                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.CommandText = "Book";

                        command.Parameters.Add("@passportId", SqlDbType.NVarChar).Value = obj.passportID;
                        command.Parameters.Add("@name", SqlDbType.NVarChar).Value = obj.personName;
                        command.Parameters.Add("@surname", SqlDbType.NVarChar).Value = obj.personSurname;
                        command.Parameters.Add("@gender", SqlDbType.NChar).Value = obj.personGender;
                        command.Parameters.Add("@email", SqlDbType.NVarChar).Value = obj.personEmail;
                        command.Parameters.Add("@city", SqlDbType.NVarChar).Value = obj.personCity;
                        command.Parameters.Add("@country", SqlDbType.NVarChar).Value = obj.personCountry;
                        command.Parameters.Add("@creditCardNumber", SqlDbType.NVarChar).Value = obj.personCreditCardNumber;
                        command.Parameters.Add("@from", SqlDbType.DateTime).Value = obj.from;
                        command.Parameters.Add("@to", SqlDbType.DateTime).Value = obj.to;
                        command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = obj.hotelName;
                        command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = obj.cityName;
                        command.Parameters.Add("@BedQuantity", SqlDbType.TinyInt).Value = obj.BedQuantity;
                        command.Parameters.Add("@Money", SqlDbType.Money).Value = obj.Money;



                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        string x = ex.Message;
                    }

                }
            }
        }

        public void InsertPicture(string HName, string CName, string PictureURL)
        {
            
            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "InsertPicture";

                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = HName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = CName;
                    command.Parameters.Add("@PicUrl", SqlDbType.NVarChar).Value = PictureURL;

                    command.ExecuteNonQuery();

                }
            }

        }



        /*
        public int ExistsSuchHotel(InsertHotel obj)
        {
            int res = -1;
            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "ExistsSuchHotelRoom";

                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = obj.InsertHotelName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = obj.InsertCity;
                    command.Parameters.Add("@RoomNumber", SqlDbType.SmallInt).Value = obj.RoomNumber;

                    res = (Int32)command.ExecuteScalar();

                }
            }

            return res;
        }
        */

        public void InsertHotelWithProperties(InsertHotel obj) 
        {


            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "InsertFromWindow";

                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = obj.InsertHotelName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = obj.InsertCity;
                    command.Parameters.Add("@RoomNumber", SqlDbType.SmallInt).Value = obj.RoomNumber;
                    command.Parameters.Add("@Money", SqlDbType.Decimal).Value = obj.Money;
                    command.Parameters.Add("@BedQuantity", SqlDbType.TinyInt).Value = obj.BedQuantity;


                    command.ExecuteNonQuery();
                    
                }
            }
        }


        public List<SearchResultWebObj> SearchWeb(SearchObj ToSearch)
        {
            List<SearchResultWebObj> result = new List<SearchResultWebObj>();

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "SearchResultForWeb";


                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = ToSearch.SearchHotelName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = ToSearch.SearchCity;
                    command.Parameters.Add("@From", SqlDbType.DateTime).Value = ToSearch.SearchFromDate;
                    command.Parameters.Add("@To", SqlDbType.DateTime).Value = ToSearch.SearchToDate;
                    command.Parameters.Add("@BedQuantity", SqlDbType.Int).Value = ToSearch.BedQuantity;



                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            int IHotelID = reader.GetOrdinal("HOTELID");
                            int Iname = reader.GetOrdinal("Name");
                            int Icity = reader.GetOrdinal("City");
                            int Isource = reader.GetOrdinal("Source");
                            int Ishort = reader.GetOrdinal("Short");
                            int Ilong = reader.GetOrdinal("Long");
                            while (reader.Read())
                            {
                                SearchResultWebObj curr = new SearchResultWebObj();
                                curr.HotelID = reader.GetInt32(IHotelID);
                                curr.CityName = reader.GetString(Icity);
                                curr.HotelName = reader.GetString(Iname);
                                curr.LongDescription = reader.GetString(Ilong);
                                curr.ShortDescription = reader.GetString(Ishort);
                                curr.MainPhoto = reader.GetString(Isource);
                                result.Add(curr);
                            }
                        }
                    }
                }
            }



            return result;
        }



        public List<string> getRoomInformationPicturesAndDescription(int id)
        {
            List<string> result = new List<string>();

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "getRoomInfoPicture";


                    command.Parameters.Add("@id", SqlDbType.Int).Value = id;


                    int forOneTimeReadinLongRescriptionColoumn = 0;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            //int Iname = reader.GetOrdinal("HotelName");
                            int ISourcePic = reader.GetOrdinal("Nkar");
                            //int IDescription = reader.GetOrdinal("Long");
                            while (reader.Read())
                            {
                                if (forOneTimeReadinLongRescriptionColoumn == 0)
                                {
                                    //result.descriptionHotelRoom = reader.GetString(IDescription);
                                    //result.hotelName = reader.GetString(Iname);
                                    forOneTimeReadinLongRescriptionColoumn++;
                                }
                                
                                result.Add(reader.GetString(ISourcePic));
                                
                                
                            }
                        }
                    }
                }
            }




            return result;
        }


        public List<DifFreeRooms> getFreeRoomsWithDifferentPrices(SearchObj ToSearch)
        {
            List<DifFreeRooms> res = new List<DifFreeRooms>();

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "FreeRoomsCertainHotel";


                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = ToSearch.SearchHotelName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = ToSearch.SearchCity;
                    command.Parameters.Add("@From", SqlDbType.DateTime).Value = ToSearch.SearchFromDate;
                    command.Parameters.Add("@To", SqlDbType.DateTime).Value = ToSearch.SearchToDate;
                    command.Parameters.Add("@BedQuantity", SqlDbType.Int).Value = ToSearch.BedQuantity;



                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            int Indexbed = reader.GetOrdinal("Bed");
                            int IndexMoney = reader.GetOrdinal("Money");
                            while (reader.Read())
                            {
                                DifFreeRooms curr = new DifFreeRooms();
                                curr.Bed = reader.GetByte(Indexbed);
                                curr.money = reader.GetDecimal(IndexMoney);
                                res.Add(curr);
                            }
                        }
                    }
                }
            }




            return res;
        }

        public List<AfterSearchObj> Search(SearchObj ToSearch)
        {
            List<AfterSearchObj> result = new List<AfterSearchObj>();

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.CommandText = "SearchST";


                    command.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = ToSearch.SearchHotelName;
                    command.Parameters.Add("@CityName", SqlDbType.VarChar).Value = ToSearch.SearchCity;
                    command.Parameters.Add("@From", SqlDbType.DateTime).Value = ToSearch.SearchFromDate;
                    command.Parameters.Add("@To", SqlDbType.DateTime).Value = ToSearch.SearchToDate;
                    command.Parameters.Add("@BedQuantity", SqlDbType.Int).Value = ToSearch.BedQuantity;



                    using (SqlDataReader reader = command.ExecuteReader()) 
                    {
                        if (reader.HasRows)
                        {
                            int getHotelIndex = reader.GetOrdinal("HotelName");
                            int getCityIndex = reader.GetOrdinal("CityName");
                            int getHotelMoneyIndex = reader.GetOrdinal("Money");
                            int getBedIndex = reader.GetOrdinal("Bed");
                            int getRoomindex = reader.GetOrdinal("RoomNumber");
                            while (reader.Read())
                            {
                                AfterSearchObj curr = new AfterSearchObj();
                                curr.HotelName = reader.GetString(getHotelIndex);
                                curr.CityName = reader.GetString(getCityIndex);
                                curr.Money = reader.GetDecimal(getHotelMoneyIndex);
                                curr.BedQuantity = reader.GetByte(getBedIndex);
                                curr.RoomNumber = reader.GetInt16(getRoomindex);
                                result.Add(curr);
                            }
                        }
                    }
                }
            }

                return result;
        }


        public List<string> GetListCity()
        {
            List<string> DistinctCities = new List<string>();
            //connectiony piti tanq, ConnectionManager.CreateConnection()-sa return  e anum henc mer uzac tipi obyekt

            using (SqlConnection conn = ConnectionManager.CreateConnection())
            {
                using (SqlCommand command = new SqlCommand())
                {
                    conn.Open();
                    command.Connection = conn;
                    command.CommandText = "Select distinct City from Hotels";

                    command.CommandType = System.Data.CommandType.Text;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {

                            int getCityIndex = reader.GetOrdinal("City");

                            while (reader.Read())
                            {
                                string city = reader.GetString(0);
                                DistinctCities.Add(city);
                            }
                        }
                    }



                }
            }

                return DistinctCities;
        }
    }
}
