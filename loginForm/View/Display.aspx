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
   

     <div>
         <a id="Butt">Load</a>
         <%--<asp:button ID="Butt" runat="server"  Text="Load"/>--%>
    </div>
    <form runat="server">
    <div>

        <table id="CustomerGrid">
         
        </table>

    </div>
</form>
           

       

   
    <a id="Store">Store entire data</a>


</body>

<script>
    $('#Butt').click(function () {
        BindGridView();
     });

    function BindGridView() {

    
        $.ajax({
            type: "POST",
            url: 'Display.aspx/GetCustomers',
          data:{},
            async: true,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#CustomerGrid").append("<tr><th>First Name</th><th>Last Name</th><th>User Name</th><th>Password</th></tr>")
                for (var i = 0; i < data.d.length; i++) {
                    $("#CustomerGrid").append("<tr><td><label class='lblfirstname'>" + data.d[i].FirstName +
                                                "</label></td><td><label class='lbllastname'>" + data.d[i].LastName +
                                                "</label></td><td><input class='txtUsername' value='" + data.d[i].Username + "'/></td><td><label class='lblpassword'>" + data.d[i].Password) + "</label></td></tr>";
      
                }
               
            },
            error: function () {
                console.log("An error has occurred during processing your request.");
            }
            
        });
        

    }

    $('#Store').click(function () {
        storeEntireData();
    });
  
    function storeEntireData() {
        var firstColumn=[];
        var secondColumn=[];
        var thirdColumn=[];
        var fourthColumn = [];
        $('#CustomerGrid tr:not(:lt(1))').each(function () {
            var tr = $(this);
            firstColumn.push($(tr).find('.lblfirstname').text());
            secondColumn.push($(tr).find('.lbllastname').text());
            thirdColumn.push($(tr).find('.txtUsername').val());
            fourthColumn.push($(tr).find('.lblpassword').text());
        });

        <%--var count = document.getElementById('<%=CustomerGrid.ClientID%>').rows[0].cells.length;
        for (i = 0; i < count; i++)
        {
            firstColumn.push(document.getElementById('<%=CustomerGrid.ClientID%>').rows[i].cells[0]);
            secondColumn.push(document.getElementById('<%=CustomerGrid.ClientID%>').rows[i].cells[1]);
            thirdColumn.push(document.getElementById('<%=CustomerGrid.ClientID%>').rows[i].cells[2]);
            fourthColumn.push(document.getElementById('<%=CustomerGrid.ClientID%>').rows[i].cells[3]);

        }--%>


        console.log(firstColumn);
        console.log(secondColumn);
        console.log(thirdColumn);
        console.log(fourthColumn);
      
        $.ajax({
            type: "POST",
            url: 'Display.aspx/Insert_data',
            data: JSON.stringify({ al1: firstColumn, al2: secondColumn, al3: thirdColumn, al4: fourthColumn }),
            async: true,
            contentType: "application/json; charset=utf-8",
            dataType: "json",                                   
            success: function (data) {
                alert(data.d);

                   },
            error: function () {
                console.log("An error has occurred during processing your request.");
            }

        });
    }



</script>
</html>
