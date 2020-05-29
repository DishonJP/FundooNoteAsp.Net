<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FundooWebforms.WebForms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fundoo</title>
    <link href="../Content/registration.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" class="container" runat="server">
        <h1 runat="server">Login Form</h1>
        <div class="stylediv">
            <asp:Label runat="server">Email</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email"/>
                <asp:Label ID="errEmail" Text="invalid email" runat="server" />
            </div>

        </div>
        <div class="stylediv">
            <asp:Label runat="server">Password</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
                <asp:Label ID="errPassword" Text="Fill the field" runat="server" />
            </div>
        </div>
        <asp:Button CssClass="submitButton" ID="submit" runat="server" Text="Login"  />
    </form>
    <script type="text/javascript" src="../Scripts/Custom/login.js"></script>
</body>
</html>
