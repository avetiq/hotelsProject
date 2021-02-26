using System;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public static class ConnectionManager
    {

        private static string Username { get; set; }
        private static string Password { get; set; }

        private static string ConnectionString { get; set; }

        public static SqlConnection CreateConnection()
        {
            if (String.IsNullOrEmpty(ConnectionString))
            {
                InitUserPassword();
                CheckConnection();
            }
            return new SqlConnection(ConnectionString);
        }
        
        public static void InitUserPassword(string username = "DB_A5A8F4_Hotels_admin", string password="qqwerty123")
        {
            Username = username;
            Password = password;
        }
        
        /*
        public static void InitUserPassword(string username = "avo", string password = "qwerty123")
        {
            Username = username;
            Password = password;
        }
        */

        public static void CheckConnection()
        {
            SqlConnectionStringBuilder bld = new SqlConnectionStringBuilder();
             bld.DataSource = @"sql5059.site4now.net";
             bld.InitialCatalog = "DB_A5A8F4_Hotels";
            //bld.DataSource = @"USER-PC\SQLEXPRESS";
            //bld.InitialCatalog = "HotelsDB";
            bld.IntegratedSecurity = false;
            bld.UserID = Username;
            bld.Password = Password;
            ConnectionString = bld.ConnectionString;
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConnectionString;
                conn.Open();

            }
        }






    }
}
