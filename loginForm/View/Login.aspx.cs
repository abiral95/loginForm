using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.Services;

namespace loginForm
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
         

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string pass = getMd5Hash(TxtPassword.Text);
                string check = "select 1 from Customers where Username = '" + TextUsername.Text + "' and Password = '" + pass + "'";
                SqlCommand com = new SqlCommand(check, con);
                con.Open();
                object value = com.ExecuteScalar();
                if (value != null)
                {
                    int temp = Convert.ToInt32(value.ToString());

                    if (temp == 1)
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Label1.Text = "Your Username or Password is Invalid";
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Label1.Text = "Your Username or Password is Invalid";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
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