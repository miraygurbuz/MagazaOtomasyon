using System.Security.Cryptography;
using System.Text;

namespace MagazaOtomasyon.Classes
{
    // Aşağıdaki kod https://www.c-sharpcorner.com/article/compute-sha256-hash-in-c-sharp/ sayfasından alınmıştır.
    public class SHA256Converter
    {
        public static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256hash = SHA256.Create())
            {
                byte[] bytes = sha256hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}