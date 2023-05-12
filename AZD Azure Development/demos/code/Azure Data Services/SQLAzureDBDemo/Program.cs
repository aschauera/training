using Microsoft.Data.SqlClient;

namespace sqltest
{
    class Program
    {
        static void Main(string[] args)
        {
            try 
            { 
                // var connectionString = "Server=tcp:server844646075.database.windows.net,1433;Initial Catalog=sampledb;Persist Security Info=False;User ID=impishOil6;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

                builder.DataSource = "bkstrainingsqlserver01.database.windows.net,1433"; 
                builder.UserID = "sqladmin ";            
                builder.Password = "";     
                builder.InitialCatalog = "";
                

                using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {
                    Console.WriteLine("\nQuery data example:");
                    Console.WriteLine("=========================================\n");
                    
                    connection.Open();       

                    String sql = "SELECT * FROM dbo.Customers";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine("{0} {1}", reader.GetString(1), reader.GetString(2));
                            }
                        }
                    }                    
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }
            Console.WriteLine("\nDone. Press enter.");
            Console.ReadLine(); 
        }
    }
}