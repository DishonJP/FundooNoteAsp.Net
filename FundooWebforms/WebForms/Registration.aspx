<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FundooWebforms.WebForms.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/registration.css" type="text/css" rel="stylesheet" />
    <title>Fundoo</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
     <form id="form1" class="container" runat="server">
        <h1 runat="server">Registration Form</h1>
        <div class="stylediv">
            <asp:Label runat="server">FirstName</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtFName"/>
                <asp:Label ID="errFName" Text="fill the field" runat="server" />
            </div>
        </div>
        <div class="stylediv">
            <asp:Label runat="server">LastName</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtLName"  />
                <asp:Label ID="errLName" Text="fill the field" runat="server" />
            </div>
        </div>
        <div class="stylediv">
            <asp:Label runat="server">Email</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" />
                <asp:Label ID="errEmail" Text="invalid email" runat="server" />
            </div>
        </div>
        <div class="stylediv">
            <asp:Label runat="server">Password</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
                <asp:Label ID="errPassword" Text="min length of 6" runat="server" />
            </div>
        </div>
        <div class="stylediv">
            <asp:Label runat="server">Re-Password</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtRePassword" TextMode="Password"/>
                <asp:Label ID="errRePassword" Text="incorrect password" runat="server"/>
            </div>
        </div>
        <asp:Button CssClass="submitButton" ID="submit" runat="server" Text="Submit"/>
    </form>
    <script type="text/javascript" src="../Scripts/Custom/registration.js"></script>
</body>
</html>
