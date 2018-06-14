<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="loginForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="~/Content/logincss.css" />
</head>

<body>
    <div class="panel panel-default">
        <div class="panel-body">
            <form id="form1" runat="server">

                <div class="form-group-sm">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <asp:TextBox class="form-control" ID="TextUsername" placeholder="Username" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group-sm">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <asp:TextBox class="form-control" ID="TxtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                    </div>
                </div>

                <br />
                <asp:Button type="button" class="btn btn-primary btn-md" ID="Button1" runat="server" Text="Log In" OnClick="Button2_Click" Style="margin-left: 20px;" />
                <br />
                <br />

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/View/Register.aspx" Style="margin-left: 20px; color: black;">Dont have an account? Register here!</asp:HyperLink>
                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/View/PasswordRecovery.aspx" Style="margin-left: 20px; color: black;">Forgot Password?</asp:HyperLink>

            </form>

        </div>
    </div>


</body>

</html>
