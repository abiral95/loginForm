<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="loginForm.View.PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  
      <form id="form1" runat="server">
  
      <ul style="list-style:none; margin-left: 600px;">
           <li><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter your Username:</p>
              <ul style="list-style:none;">
                  <li style="margin-left: 40px">
                      <asp:TextBox class="form-control" ID="TextUsername" placeholder="Username" runat="server"></asp:TextBox>
                  </li>
                  <li style="margin-left: 40px">
                      <asp:Label ID="Label1" runat="server"></asp:Label>
                  </li>
          <li><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter your email address:</p>
              <ul style="list-style:none;">
                  <li>
                      <asp:TextBox class="form-control" ID="TextEmail" placeholder="Email" runat="server"></asp:TextBox>
                  </li>
              </ul>
          </li>
          <li> </li>
          <li> 
              <asp:Button type="button" class="btn btn-primary btn-md" ID="ButtonForEmail" runat="server" Text="Send me new password" OnClick="Button_Click"  style="margin-left:20px;"/>
          </li>
                  <li></li>

      </ul>



          <div style="margin-left: 640px">
          </div>
          </ul>
          <p style="margin-left: 600px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="SendingFailed" runat="server"></asp:Label>
          </p>
      </form>



      <p style="margin-left: 600px">
&nbsp;</p>



</body>
</html>
