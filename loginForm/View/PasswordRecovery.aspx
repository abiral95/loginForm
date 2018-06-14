<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="loginForm.View.PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recover Password</title>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            <link rel="stylesheet" type="text/css" href="~/Content/passwordRecovery.css"/>

</head>
<body>
<div class="panel panel-default">
    <div class="panel-body">
        <form id="form2" runat="server">
        
         <div class="form-group-sm">
            <p> Enter your Username:</p>
            <asp:TextBox class="form-control" ID="TextBox1" placeholder="Username" runat="server"></asp:TextBox>
             <asp:Label ID="Label2" runat="server"></asp:Label>
         </div>

         <div class="form-group-sm">
             <p>Enter your email address:</p>
             <asp:TextBox class="form-control" ID="TextBox2" placeholder="Email" runat="server"></asp:TextBox>
         </div>   
            
                 
          <br />
          <asp:Button type="button" class="btn btn-primary btn-md" ID="Button1" runat="server" Text="Send me a new password" OnClick="Button_Click"  style="margin-left:20px;"/>
          <br />
          <asp:Label ID="Label3" runat="server"></asp:Label>
   
         
      </form>
  </div>
</div>
    
</body>
</html>
