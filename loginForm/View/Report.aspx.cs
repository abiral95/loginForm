using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginForm.View
{
    
    public partial class Report : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                
                SqlConnection con = new SqlConnection("Server=DESKTOP-AVFV7P5;Integrated Security=SSPI;Database=AdventureWorks2014;");
                string sql = "SELECT  Person.Person.FirstName,Person.Person.LastName,Person.PersonPhone.PhoneNumber FROM Person.Person INNER JOIN Person.PersonPhone ON Person.Person.BusinessEntityID = Person.PersonPhone.BusinessEntityID";

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();


                var path = Server.MapPath("~/View/jpt.rdl");


                
                var report = ReportViewer1.LocalReport;
            
                report.ReportPath = path;
            //report parameter
                ReportParameter rp1 = new ReportParameter("textParam", "Hello!");
                ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rp1 });

                report.DataSources.Clear();
                da.Fill(dt);
                var ds1 = new ReportDataSource("DataSet1", dt);
               
                report.DataSources.Add(ds1);

                
                report.Refresh();
            

        }
    }
}