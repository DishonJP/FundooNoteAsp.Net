<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FundooNote.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Fundoo</title>
    <link href="Content/home.css" rel="stylesheet" />
</head>
<body>
        <header>
        <h1>FundooNote</h1>
    </header>
    
    <section>
       <form id="form1" class="add-note" runat="server">
           <asp:TextBox CssClass="input-title" ID="txtTitle" runat="server" Text="Title"></asp:TextBox>
            <br />
           <asp:TextBox CssClass="input-description" ID="txtDescription" Rows="4" Columns="40" runat="server" Text="Description"></asp:TextBox>
            <asp:Button runat="server" ID="submit" CssClass="button-card" Text="Add" OnClick="submit_Click"/>
       </form>
    </section>
    
        <div>
        </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script>

    </script>
</body>
</html>
