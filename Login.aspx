<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FundooNote.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Content/Default.css" type="text/css" rel="stylesheet" />
    <title>Fundoo</title>
    <script type="text/javascript" src="Scripts/login.js"></script>
</head>
<body>
    <form id="form1" class="container" runat="server">
        <h1 runat="server">Login Form</h1>
        <div class="stylediv">
            <asp:Label runat="server">Email</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email"/>
                <asp:Label ID="errEmail" Text="" runat="server" />
            </div>

        </div>
        <div class="stylediv">
            <asp:Label runat="server">Password</asp:Label>
            <div class="insideDiv">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
                <asp:Label ID="errPassword" Text="" runat="server" />
            </div>
        </div>
        <asp:Button OnClientClick="return validation();" CssClass="submitButton" ID="submit" runat="server" Text="Login" OnClick="submit_Click" />

    </form>
</body>
</html>
