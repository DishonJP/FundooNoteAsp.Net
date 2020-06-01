<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FundooWebforms.WebForms.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fundoo</title>
    <link href="../Content/Custom/home.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/3bd0a62b3b.js" crossorigin="anonymous"></script>
</head>
<body>
    <link href="../Content/Custom/home.css" rel="stylesheet" />
    <header>
        <div class="menuAndIcons">
            <button id="menu-open">
                <i class="fas fa-bars"></i>
            </button>
            <div class="image-header">
                <img src="../Asserts/keep_icon.png" />
            <h1>FundooNote</h1>
                </div>
        </div>
        <div class="search">

            <i class="fas fa-search"></i>
            <input placeholder="Search" />
        </div>

        <div class="menuAndIcons">
            <button>
                <i class="fas fa-cog"></i>
            </button>
            <button>
                <i class="fas fa-th-large"></i>
            </button>
            <button>
                <i class="fas fa-list"></i>
            </button>
            <button>
                <i class="fas fa-user"></i>
            </button>
        </div>

    </header>
    <div id="drawer" class="drawer">
        <h1>Fundoo</h1>
        <a href="Home.aspx" >Home</a>
    </div>
    <section class="create-session">
        <form id="form1" class="add-note" runat="server">
            <div class="title-contain">
                <asp:TextBox CssClass="input-title" ID="txtTitle" runat="server" Text="Title"></asp:TextBox>
                <button><i class="fas fa-thumbtack"></i></button>
            </div>
            <br />
            <asp:TextBox
                CssClass="input-description"
                ID="txtDescription"
                Rows="4"
                Columns="40"
                runat="server"
                Text="Description"></asp:TextBox>
            <div class="bottom-contain">
                <div class="icon-button-div">
                    <button><i class="far fa-bell"></i></button>
                    <button><i class="fas fa-user-plus"></i></button>
                    <button><i class="fas fa-palette"></i></button>
                    <button><i class="fas fa-image"></i></button>
                    <button><i class="fas fa-archive"></i></button>
                    <button><i class="fas fa-ellipsis-v"></i></button>
                </div>
                <asp:Button
                runat="server"
                ID="submit"
                CssClass="button-card"
                Text="Add" />   
            </div>
        </form>
    </section>
    <section id="noteSession" class="note-session"></section>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#menu-open").click(function () {
                $("#drawer").toggleClass("drawer-open");
            })

            $.ajax({
                type: "Get",
                url: "https://localhost:44343/api/note"
            }).then(res => {
                const userId = JSON.parse(localStorage.getItem("userDetails")).UserId;
                userNotes = res.filter(el => el.UserId === userId);
                console.log(userNotes);
                userNotes.forEach(el => {
                    let note = "<div class='note-cards'>" +
                        "<div class='note-titles'>"+
                        "<p>" + el.Title + "</p>" +
                        "<button><i class='fas fa-thumbtack'></i></button>" +
                        "</div>"+
                        "<p>" + el.Description + "</p>" +
                        /*"<button class='button-edit button-card'>Edit</button>" +
                        "<button id='" + el.NoteId + "' class='button-delete button-card'>Delete</button>" +*/
                        "<div class='icon-button-div change'>"+
                           "<button> <i class='far fa-bell'></i></button>"+
                                "<button><i class='fas fa-user-plus'></i></button>"+
                                "<button><i class='fas fa-palette'></i></button>"+
                                "<button><i class='fas fa-image'></i></button>"+
                                "<button><i class='fas fa-archive'></i></button>"+
                                "<button><i class='fas fa-ellipsis-v'></i></button>"+
               " </div>"+
                        "</div>";
                    $(note).appendTo($("#noteSession"))
                    $("#" + el.NoteId).click(function (e) {
                        const url = "DeleteNote?title=" + encodeURIComponent(el.Title) + "&description=" + encodeURIComponent(el.Description) + "&id=" + encodeURIComponent(el.NoteId);
                        window.location.href = url;
                        /*$.ajax({
                            type: "Delete",
                            url: "https://localhost:44343/api/delete?id=" + e.target.id
                        }).then(res => console.log(res)).catch(err => console.log(err));*/
                    })
                })

            }).catch(err => alert("error"));



            $("#submit").click(function () {
                let count = 0;
                const title = $("#txtTitle").val();
                const description = $("#txtDescription").val();
                const userId = JSON.parse(localStorage.getItem("userDetails")).UserId;
                title.length !== 0 ? count++ : alert("Title is required");
                const note = {
                    Title: title,
                    Description: description,
                    UserId: userId
                }
                console.log(note);
                if (count === 1) {
                    $.ajax({
                        type: "Post",
                        url: "https://localhost:44343/api/note",
                        data: note
                    }).then(res => {
                        alert("added");
                    }).catch(err => alert("Network Error"));
                    return true;
                }
                return false;
            })
        });
    </script>
</body>
</html>
