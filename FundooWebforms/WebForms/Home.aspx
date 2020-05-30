<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FundooWebforms.WebForms.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fundoo</title>
    <link href="../Content/Custom/home.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <header>
        <h1>FundooNote</h1>
    </header>

    <section class="create-session">
       <form id="form1" class="add-note" runat="server">
           <asp:TextBox CssClass="input-title" ID="txtTitle" runat="server" Text="Title"></asp:TextBox>
            <br />
           <asp:TextBox 
               CssClass="input-description" 
               ID="txtDescription" 
               Rows="4" 
               Columns="40" 
               runat="server" 
               Text="Description"></asp:TextBox>
            <asp:Button 
                runat="server" 
                ID="submit" 
                CssClass="button-card" 
                Text="Add" />
       </form>
    </section>
    <section id="noteSession" class="note-session"></section>
    <script type="text/javascript" src="../Scripts/Custom/home.js"></script>
</body>
</html>
