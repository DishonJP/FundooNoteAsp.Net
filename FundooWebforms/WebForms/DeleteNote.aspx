<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteNote.aspx.cs" Inherits="FundooWebforms.WebForms.DeleteNote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fundoo</title>
    <link href="../Content/Custom/home.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="responce"></div>
        <a href="Home.aspx">Back to home page</a>
    </form>
    <script type="text/javascript">
        let queryString = [];
        $(function () {
            if (queryString.length == 0) {
                if (window.location.search.split('?').length > 1) {
                    let params = window.location.search.split('?')[1].split('&');
                    for (let i = 0; i < params.length; i++) {
                        let key = params[i].split('=')[0];
                        let value = decodeURIComponent(params[i].split('=')[1]);
                        queryString[key] = value;
                    }
                }
            }
            if (queryString["title"] != null && queryString["description"] != null && queryString["id"]!==null) {
            $.ajax({
                        type: "Post",
                url: "https://localhost:44343/api/note/delete/" + queryString["id"]
            }).then(res => $("#responce").append("Note Deleted")).catch(err => console.log(err));
            }
        });
    </script>
</body>
</html>
