<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="loginForm.View.Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Display Page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"  type="text/javascript"></script> 
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>

</head>
<body>
   
   <form runat="server">
     <div>
         <a id="Butt">Load</a>
         <%--<asp:button ID="Butt" runat="server"  Text="Load"/>--%>
    </div>
    <div>

        <asp:GridView ID="CustomerGrid" runat="server" ShowHeaderWhenEmpty="true">
         
        </asp:GridView>
    </div>


   </form> 




</body>

<script>
    $('#Butt').click(function () {
        BindGridView();
     });

    function BindGridView(){
        $.ajax({
            type: "POST",
            url: 'Display.aspx/GetCustomers',
          data:{},
            async: true,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.d.length; i++) {
                    $("#CustomerGrid").append("<tr><td>" + data.d[i].FirstName +
                                                "</td><td>" + data.d[i].LastName+
                                                "</td><td>" + data.d[i].Username +
                                                "</td><td>" + data.d[i].Password)+"</td></tr>";
                }
                
            },
            error: function () {
                console.log("An error has occurred during processing your request.");
            }

        });
    }


</script>
</html>
