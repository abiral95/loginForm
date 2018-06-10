<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="loginForm.FirstWebPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
          <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        

</head>

<body style="background-color:lavender;height:100%;width:100%;">
    <div class="row" style="margin-top:80px;">
        <div class="col-lg-4 col-md-4  "></div>
        
    <form class="col-lg-4 col-md-4 col-sm-12 col-xs-12  " id="form1" runat="server"  style="border:solid 1px; border-radius:10px;background-color:aliceblue; width:300px;margin-left:70px;">
    <div>
        <table class="style1" style="margin-left:25px;margin-top:20px">
            <tr>
                <td class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox class="form-control" ID="TextUsername" placeholder="Username" runat="server"></asp:TextBox>
                    
                </td>
            </tr>
            
            <tr>
                
                <td class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <asp:TextBox class="form-control" ID="TxtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                </td>
            </tr>
            
           
        </table>
    </div>
        <br />
    <asp:Button type="button" class="btn btn-primary btn-md" ID="Button1" runat="server" Text="LogIn" OnClick="Button2_Click"  style="margin-left:20px;"/>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/View/Register.aspx" style="margin-left:20px;color:black;">Dont have an account? Register here!</asp:HyperLink>
        <p>
            &nbsp;</p>
        <p>
           
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </p>
    </form>
        <div class="col-lg-4 col-md-4 "></div>
       
        </div>
</body>
</html>
