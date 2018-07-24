using loginForm.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginForm.View
{
    public partial class ajaxCrud : System.Web.UI.Page
    {
        [WebMethod]
        public static Students[] Page_Load()
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
            string Q = "select * from Students";
            SqlCommand com = new SqlCommand(Q, con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(com);

            List<Students> list = new List<Students>();

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            foreach (DataRow row in dt.Rows)
            {
                Students _students = new Students();
                _students.studentId = Convert.ToInt32(row["studentId"]);
                _students.firstName = row["firstName"].ToString();
                _students.lastName = row["lastName"].ToString();
                _students.isActive = Convert.ToBoolean(row["isActive"]);
                _students.dateOfBirth = Convert.ToDateTime(row["dateOfBirth"]);
                _students.District = row["District"].ToString();
                _students.Municipality = row["Municipality"].ToString();
                _students.Address = row["Address"].ToString();
                _students.Gender = row["Gender"].ToString();
                _students.Photo = row["Photo"].ToString();



                list.Add(_students);
            }
            return list.ToArray();

        }

        [WebMethod]

        public static string Save_data(object Fname, object Lname, object Active, object Date, object District, object Municipality, object Photo, object Address, object Gender)
        {
            string msg = "";
            
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
            string query = "insert into Students(firstName, lastName, isActive, dateOfBirth, District, Municipality, Address, Gender, Photo) values('" + Fname.ToString() + "','" + Lname.ToString()+ "','" + Convert.ToBoolean(Active)+ "','" + Convert.ToDateTime(Date)+ "','" + District.ToString() + "','" + Municipality.ToString()+ "','" + Address.ToString()+ "','" + Gender.ToString()+ "','" + Photo.ToString()+ "') ";

            SqlCommand com = new SqlCommand(query, con);
            try
            {
                con.Open();
                com.ExecuteNonQuery();
                msg = "stored sucessfully";
            }

            
            catch (Exception e)
            {
            }
            finally{
                con.Close();
            }
            return msg;

            
        }

        [WebMethod]
        public static Students[] showInTable()

        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
            string Q = "SELECT TOP 1 * FROM Students ORDER BY studentId DESC";
            SqlCommand com = new SqlCommand(Q, con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(com);

            List<Students> list = new List<Students>();

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            foreach (DataRow row in dt.Rows)
            {
                Students _students = new Students();
                _students.studentId = Convert.ToInt32(row["studentId"]);
                _students.firstName = row["firstName"].ToString();
                _students.lastName = row["lastName"].ToString();
                _students.isActive = Convert.ToBoolean(row["isActive"]);
                _students.dateOfBirth = Convert.ToDateTime(row["dateOfBirth"]);
                _students.District = row["District"].ToString();
                _students.Municipality = row["Municipality"].ToString();
                _students.Address = row["Address"].ToString();
                _students.Gender = row["Gender"].ToString();
                _students.Photo = row["Photo"].ToString();



                list.Add(_students);
            }
            return list.ToArray();
        }

        [WebMethod]

        public static string delete(object delId)
        { string msg = "";
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
            string query = "DELETE FROM Students WHERE studentId='" +delId + "'";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            try
            {
                com.ExecuteNonQuery();
                msg = "Deleted";
            }
            catch (Exception e) { }
            finally {
                con.Close();

            }



            return msg;
               
        }

        [WebMethod]

        public static Students[] Edit(object Eid, object Fname, object Lname, object Active, object Date, object District, object Municipality, object Photo, object Address, object Gender)
        {
            
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");

            string up = "update Students set firstName = '" + Fname.ToString() + "', lastName = '" + Lname.ToString() + "', isActive = '" + Convert.ToBoolean(Active) + "', dateOfBirth = '" + Convert.ToDateTime(Date) + "', District = '" + District.ToString() + "', Municipality = '" + Municipality.ToString() + "', Address = '" + Address.ToString() + "', Photo = '" + Photo.ToString() + "', Gender = '" + Gender.ToString() + "'  where studentId = '" + Eid + "'";
            SqlCommand com = new SqlCommand(up, con);
            con.Open();
            
                com.ExecuteNonQuery();

            string load = "SELECT * FROM Students WHERE studentId='" + Eid + "'";
            SqlCommand comd = new SqlCommand(load, con);

            SqlDataAdapter da = new SqlDataAdapter(comd);

            List<Students> list = new List<Students>();

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            foreach (DataRow row in dt.Rows)
            {
                Students _students = new Students();
                _students.studentId = Convert.ToInt32(row["studentId"]);
                _students.firstName = row["firstName"].ToString();
                _students.lastName = row["lastName"].ToString();
                _students.isActive = Convert.ToBoolean(row["isActive"]);
                _students.dateOfBirth = Convert.ToDateTime(row["dateOfBirth"]);
                _students.District = row["District"].ToString();
                _students.Municipality = row["Municipality"].ToString();
                _students.Address = row["Address"].ToString();
                _students.Gender = row["Gender"].ToString();
                _students.Photo = row["Photo"].ToString();



                list.Add(_students);
            }
            return list.ToArray();

            
            



            
        }

        }
    }
