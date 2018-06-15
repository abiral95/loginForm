﻿using loginForm.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginForm.View
{

    public partial class Display : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[] { new DataColumn("FirstName"), new DataColumn("LastName"), new DataColumn("Username"), new DataColumn("Password") });
                CustomerGrid.DataSource = dt;
                CustomerGrid.DataBind();
            }
        }

        [WebMethod]
        public static Customers[] GetCustomers()

        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-loginForm-20180607011203.mdf;Initial Catalog=aspnet-loginForm-20180607011203;Integrated Security=True");
            string Q = "select * from customers";
            SqlCommand com= new SqlCommand(Q, con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(com);

            List<Customers> list = new List<Customers>();

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            foreach (DataRow row in dt.Rows)
            {
                Customers _customers = new Customers();
                _customers.FirstName = row["FirstName"].ToString();
                _customers.LastName = row["LastName"].ToString();
                _customers.Username = row["Username"].ToString();
                _customers.Password = row["Password"].ToString();

                list.Add(_customers);
            }
            return list.ToArray();
        }

    }
}