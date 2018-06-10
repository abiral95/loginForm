<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="loginForm.View.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="Content/register.css"/>
        <script src="jquery/RegistrationValidation.js"></script>

</head>
<body style="background-color:lavender;height:100%;width:100%;">
    <div class="row" style="margin-top:80px;">
        <div class="col-lg-4 col-md-4  "></div>
    <form id="form1" class="col-lg-4 col-md-4 col-sm-12 col-xs-12" runat="server"  style="border:solid 1px;padding-bottom:10px; border-radius:10px;background-color:aliceblue; width:400px;margin-left:70px;">
    <div>
        <table class="style1" style="margin-left:40px;margin-top:20px;">
            <tr>
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">First Name</td>
                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TxtFNam" runat="server" placeholder="First name" field="name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">Last Name:</td>
                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TxtLName" runat="server" placeholder="Last name" field="surname"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">Username:</td>
                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TextUsername" runat="server" placeholder="Username" field="username"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="input-group" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:17px;">Password:</td>
                <td style="padding-left:20px;">
                    <asp:TextBox class="form-control" ID="TxtPassword" runat="server"
                                 TextMode="Password" placeholder="Password" fielld="password"></asp:TextBox>
                </td>
            </tr>
            
           
        </table>
    </div>
        <br />
    <asp:Button type="button" class="btn btn-primary btn-md" ID="Button1" OnClick="Button1_Click" runat="server" Text="Register" style="margin-left:38px;"/>
    </form>
        <div class="col-lg-4 col-md-4 "></div>
       
        </div>
</body>
<script>
   
        $('#Button1').click(function () {
            validateForm();
        });
    
</script>
</html>
