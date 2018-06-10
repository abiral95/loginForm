using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
namespace loginForm.View
{
    
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string pass = getMd5Hash(TxtPassword.Text);
                string ins = "insert into Customers(FirstName, LastName, Username, Password) values('" + TxtFNam.Text + "','" + TxtLName.Text + "','" + TextUsername.Text + "','" + pass + "') ";
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.ExecuteNonQuery();
            }
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
        static string getMd5Hash(string input)
        { // Create a new instance of the MD5CryptoServiceProvider object.
            MD5 md5Hasher = MD5.Create(); // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            // Create a new Stringbuilder to collect the bytes // and create a string.
            StringBuilder sBuilder = new StringBuilder(); // Loop through each byte of the hashed data // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            // Return the hexadecimal string.
            return sBuilder.ToString();
        }


    }
}