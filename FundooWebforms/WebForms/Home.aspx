<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FundooWebforms.WebForms.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fundoo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" media="screen and (max-width: 1000px)"  href="<%=VirtualPathUtility.ToAbsolute("~/Content/Custom/home.css")%>" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            <button id="grid">
                <i class="fas fa-th-large"></i>
            </button>
            <button id="list">
                <i class="fas fa-list"></i>
            </button>
            <button style="position: relative" id="user-open">
                <i class="fas fa-user"></i>
                <div id="user-class" class="user-menu">
                    <div class="user-pic">
                        <i class="fas fa-user"></i>
                        <p id="username"></p>
                        <p id="email"></p>
                    </div>
                    <div class="user-pro">
                        <i class="fas fa-user"></i>
                        <div>
                            <p id="usernames"></p>
                            <p id="emails"></p>
                        </div>
                    </div>
                    <div class="user-pro">
                        <i class="fas fa-user-plus"></i>
                        <p>add account</p>
                    </div>
                    <div class="user-out">
                        <div class="signout">Signout</div>
                    </div>
                </div>
            </button>
        </div>

    </header>
    <div id="drawer" class="drawer">
        <a href="Home.aspx">Home</a>
        <a href="Home.aspx">Reminder</a>
        <a href="Home.aspx">Archive</a>
        <a href="Home.aspx">Trash</a>
        <a href="Home.aspx">Labels</a>
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
                    Text="Add" />
            </div>
        </form>
    </section>
    <section id="noteSession" class="note-session"></section>
    <script type="text/javascript">
        $(document).ready(function () {
            const userName = JSON.parse(localStorage.getItem("userDetails")).FirstName;
            const email = JSON.parse(localStorage.getItem("userDetails")).Email;
            $("#username").append(userName);
            $("#email").append(email);
            $("#usernames").append(userName);
            $("#emails").append(email);
            const colors = [
                { id: "1", color: "#fff" },
                { id: "2", color: '#f28b82' },
                { id: "3", color: '#fbbc04' },
                { id: "4", color: '#fff475' },
                { id: "5", color: '#ccff90' },
                { id: "6", color: '#a7ffeb' },
                { id: "7", color: '#cbf0f8' },
                { id: "8", color: '#aecbfa' },
                { id: "9", color: '#d7aefb' },
                { id: "10", color: '#fdcfe8' },
                { id: "11", color: '#e6c9a8' },
                { id: "12", color: '#e8eaed' },
            ];
            colors.forEach(el => {
                let palette = "<div class='color-icons' style='background-color:" + el.color + "'></div>"
                $(palette).appendTo("#colors");
            })
            $("#color-open").click(function (e) {
                e.preventDefault();
                $("#colors").toggleClass("color-show");
            })

            $("#list").click(function (e) {
                $(".note-cards").removeClass("note-grid");
                $(".note-cards").addClass("note-list");
            })

            $("#grid").click(function (e) {
                $(".note-cards").removeClass("note-list");
                $(".note-cards").addClass("note-grid");
            })

            $("#menu-open").click(function () {
                $("#drawer").toggleClass("drawer-open");
            })

            $("#user-open").click(function () {
                $("#user-class").toggleClass("user-menu-open")
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
                        "<div class='note-titles'>" +
                        "<p class='" + el.NoteId + "'>" + el.Title + "</p>" +
                        "<button><i class='fas fa-thumbtack'></i></button>" +
                        "</div>" +
                        "<p class='" + el.NoteId + "'>" + el.Description + "</p>" +
                        /*"<button class='button-edit button-card'>Edit</button>" +
                        "<button id='" + el.NoteId + "' class='button-delete button-card'>Delete</button>" +*/
                        "<div class='icon-button-div change'>" +
                        "<button> <i class='far fa-bell'></i></button>" +
                        "<button><i class='fas fa-user-plus'></i></button>" +
                        "<button><i class='fas fa-palette'></i></button>" +
                        "<button><i class='fas fa-image'></i></button>" +
                        "<button><i class='fas fa-archive'></i></button>" +
                        "<button id='" + el.NoteId + "'><i class='fas fa-ellipsis-v'></i></button>" +
                        " </div>" +
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
                    $("." + el.NoteId).click(function (e) {
                        const url = "EditNote?title=" + encodeURIComponent(el.Title) + "&description=" + encodeURIComponent(el.Description) + "&id=" + encodeURIComponent(el.NoteId);
                        window.location.href = url;
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
