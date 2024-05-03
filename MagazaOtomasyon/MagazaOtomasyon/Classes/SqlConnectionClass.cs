using System.Data.SqlClient;

namespace MagazaOtomasyon.Classes
{
    public class SqlConnectionClass
    {
        public static SqlConnection connection = new SqlConnection("Data Source=BILGISAYAR\\SQLEXPRESS;Initial Catalog=MagazaOtomasyon;Integrated Security=True;");

        public static void CheckConnection()
        {
            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            else { }
        }

       public static void CloseConnection()
        {
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
            else { }
        }
    }
}