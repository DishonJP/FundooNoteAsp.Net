<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditNote.aspx.cs" Inherits="FundooWebforms.WebForms.EditNote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fundoo</title>

    <link rel="stylesheet" type="text/css" href="<%=VirtualPathUtility.ToAbsolute("~/Content/Custom/home.css")%>" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/3bd0a62b3b.js" crossorigin="anonymous"></script>
</head>
<body>
        <section class="create-session">
        <form id="form1" class="add-note" runat="server">
            <div class="title-contain">
                <asp:TextBox CssClass="input-title" ID="txtTitle" runat="server"></asp:TextBox>
                <button><i class="fas fa-thumbtack"></i></button>
            </div>
            <br />
            <asp:TextBox
                CssClass="input-description"
                ID="txtDescription"
                Rows="4"
                Columns="40"
                runat="server"></asp:TextBox>
            <div class="bottom-contain">
                <div class="icon-button-div">
                    <button><i class="far fa-bell"></i></button>
                    <button><i class="fas fa-user-plus"></i></button>
                    <button style="position: relative" id="color-open">
                        <i class="fas fa-palette"></i>
                        <div class="color-contain" id="colors"></div>
                    </button>
                    <button><i class="fas fa-image"></i></button>
                    <button><i class="fas fa-archive"></i></button>
                    <button><i class="fas fa-ellipsis-v"></i></button>
                </div>
                <asp:Button
                    runat="server"
                    ID="submit"
                    CssClass="button-card"
                    Text="Edit" />
            </div>
        </form>
    </section>
    <div id="responce"></div>
    <script type="text/javascript">
        let queryString = [];
        $(document).ready(function () {
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
            if (queryString["title"] != null && queryString["description"] != null && queryString["id"] !== null) {
                $("#txtTitle").val(queryString["title"]);
                $("#txtDescription").val(queryString["description"]);
            }
            $("#submit").click(function (e) {
                e.preventDefault();
                const note = {
                    NoteId: queryString["id"],
                    Title: $("#txtTitle").val(),
                    Description: $("#txtDescription").val(),
                    UserId: JSON.parse(localStorage.getItem("userDetails")).UserId
                }
                $.ajax({
                    type: "Post",
                    url: "https://localhost:44343/api/note/update/" + queryString["id"],
                    data:note
                }).then(res => {
                    $("#responce").append("Note Updated");
                    setTimeout(
                        window.location.href="Home"
                    , 1000);  
                }).catch(err => console.log(err));
            })
        });
    </script>
</body>
</html>
