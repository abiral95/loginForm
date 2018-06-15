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
                // Response.Redirect("Login.aspx");

                //this is done to show alert message after the user is registered 
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertScript", "alert('You have been registered successfully')", true);


            }

            catch (SqlException seq)
            {
                if (seq.Number == 2601)
                {
                    uniqueUsername.Text = "This username is already used.";
                    uniqueUsername.ForeColor = System.Drawing.Color.Red;

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


        [WebMethod]

        public static string GetData(object cusFirstname, object cusLastname, object cusUsername, object cusPassword)
        {
            String message = "";
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
            try
            {
                string pass = getMd5Hash(cusPassword.ToString());
                string ins = "insert into Customers(FirstName, LastName, Username, Password) values('" + cusFirstname.ToString() + "','" + cusLastname.ToString() + "','" + cusUsername.ToString() + "','" + pass + "') ";
                SqlCommand com = new SqlCommand(ins, con);
                con.Open();
                com.ExecuteNonQuery();
                // Response.Redirect("Login.aspx");

                //this is done to show alert message after the user is registered 

                message = "Registered Successfully!";
            }
            catch (SqlException seq)
            {
                if (seq.Number == 2601)
                {
                    message = "The username is already used!";
                }
            }
            catch (Exception ex)
            {
                message = "Error! Enter valid data";

            }
           
           
            finally
            {
                con.Close();
            }

            return message;
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