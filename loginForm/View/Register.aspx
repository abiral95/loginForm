[<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="loginForm.View.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"  type="text/javascript"></script> 
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
    <script src="Scripts/jquery-1.10.2.min.js"></script>  
    <script src="Scripts/jquery.validate.min.js"></script>    

        <script type="text/javascript" src="script/jquery.validate.js"></script>
         <link rel="stylesheet" type="text/css" href="~/Content/registercss.css"/>
        <script src="~/jquery/RegistrationValidation.js"></script>

</head>
<body style="height:100%;width:100%;">
    <div class="row" style="margin-top:80px;">
        <div class="col-lg-4 col-md-4  "></div>
    <form id="form1" class="col-lg-4 col-md-4 col-sm-12 col-xs-12" runat="server"  style="border:solid 1px;padding-bottom:10px; border-radius:10px;background-color:aliceblue; width:500px;margin-left:70px;">
    <div>
        <table class="style1" style="margin-left:40px;margin-top:20px;">
            <tr class="row">
                

                 
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">First Name</td>

                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TxtFNam" runat="server" placeholder="First name" field="name"></asp:TextBox>

                </td>
              
            </tr>
            <tr  class="row">
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">Last Name:</td>
                <td style="padding-left:20px;"">
                    <asp:TextBox class="form-control" ID="TxtLName" runat="server" placeholder="Last name" field="surname"></asp:TextBox>

                </td>
               
            </tr>
            <tr  class="row">
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">Username:</td>
                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TextUsername" runat="server" placeholder="Username" field="username"></asp:TextBox>
                    <asp:Label ID="uniqueUsername" runat="server"></asp:Label>
                </td>
            </tr>
            <tr  class="row">  
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">Password:</td>
                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TxtPassword" runat="server" TextMode="Password" placeholder="Password" field="password"></asp:TextBox>
                </td>
                    
             
            </tr>
            
           
        </table>
    </div>
        <br />
    <asp:Button type="button" class="btn btn-primary btn-md" ID="Button1" runat="server" Text="Register" style="margin-left:38px;"/>
    <asp:Label ID="registrationSuccess" runat="server"></asp:Label>

    </form>
        <div class="col-lg-4 col-md-4 "></div>
       
        </div>
</body>


    <script>
   
        $('#<%=Button1.ClientID%>').click(function () {
            $.validator.addMethod("regex", function(value, element, regexp)
            {
                var re = new RegExp(regexp);
                return this.optional(element) || re.test(value);
            },"Please check your name."
        );

            $('#form1').validate({
            
                rules: 
                {
                    <%=TxtFNam.UniqueID %>: {
                        required:true,
                        rangelength:[3,20],
                        regex:"^[a-zA-z]" 
                        
                    },
                    <%=TxtLName.UniqueID %>: {

                        required: true,
                        
                        rangelength:[3,20],
                        regex:"^[a-zA-z]"
           
                    },
                    <%=TextUsername.UniqueID %>: {
                        required: true
                    },               
                    <%=TxtPassword.UniqueID %>: {
                        required: true
                    },
                },
                messages: 
                 {
                     <%=TxtFNam.UniqueID %>:{
                         required: "Please enter your first name."
              
                     },
                     <%=TxtLName.UniqueID %>:{
                         required: "Please enter your last name."
                
                     },
                     <%=TextUsername.UniqueID %>:{ 
                         required: "Please enter username."
                     },
                     <%=TxtPassword.UniqueID %>:{ 
                         required: "Please enter password."
                         
                     }, 
                 },
                submitHandler: function(form) {

                        var firstname = $("#TxtFNam").val();
                        var lastname = $("#TxtLName").val(); 
                        var username =$("#TextUsername").val();
                        var password=$("#TxtPassword").val();
        
                        $.ajax({
                            type: "POST",
                            url: 'Register.aspx/Getdata',
                            data: JSON.stringify({ cusFirstname: firstname, cusLastname: lastname , cusUsername: username , cusPassword: password }),
                            async: true,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                console.log(result);
                                alert(result.d);
                            },
                            error: function () {
                                console.log("An error has occurred during processing your request.");
                            }
                        });

                 
                        return false;
                    
                    
                }

            });
        });
        
</script>
 
</html>
