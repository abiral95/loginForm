﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginForm.View
{
    public partial class PasswordRecovery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            string check = "select 1 from Customers where Username = '" + TextUsername.Text + "'";
            SqlCommand cmd = new SqlCommand(check, con);
            con.Open();
            object value = cmd.ExecuteScalar();
            if (value != null)
            {
                int temp = Convert.ToInt32(value.ToString());

                if (temp == 1)
                {// for mail 
                    MailMessage mail = new MailMessage();
                    string newPassword = "terobaukotauko";
                    string pass = getMd5Hash(newPassword);

                    mail.To.Add(TextEmail.Text);
                    mail.From = new MailAddress("abiral.p95@gmail.com");
                    mail.Subject = " New Password ";
                    mail.Body = "Your password is : " + newPassword;
                    mail.IsBodyHtml = true;
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("abiral.p95@gmail.com", "abiraldai44");
                    //Or your Smtp Email ID and Password
                    smtp.EnableSsl = true;
                    try
                    {
                        smtp.Send(mail);

                        string insert = "update Customers set Password = '" + pass + "' where Username = '" + TextUsername.Text + "'";
                        SqlCommand command = new SqlCommand(insert, con);
                       
                        command.ExecuteNonQuery();
                        



                        Response.Redirect("Login.aspx");

                      

                    }
                    catch (Exception)
                    {
                        SendingFailed.Text = "Email not sent, enter valid email address again";
                        SendingFailed.ForeColor = System.Drawing.Color.Red;

                    }
                    finally
                    {

                        con.Close();

                    }

                }
                else
                {
                    Label1.Text = "Your Username is Invalid";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Label1.Text = "Your Username is Invalid";
                Label1.ForeColor = System.Drawing.Color.Red;
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