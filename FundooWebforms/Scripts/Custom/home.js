$(document).ready(function () {
    $.ajax({
        type: "Get",
        url: "https://localhost:44343/api/note"
    }).then(res => {
        const userId = JSON.parse(localStorage.getItem("userDetails")).UserId;
        userNotes = res.filter(el => el.UserId === userId);
        console.log(userNotes);
        userNotes.forEach(el => {
            let note = "<div class='note-cards'>" +
                "<p>" + el.Title + "</p>" +
                "<p>" + el.Description + "</p>" +
                "<div class='button-layout'>" +
                "<button class='button-edit button-card'>Edit</button>" +
                "<button id='" + el.NoteId + "' class='button-delete button-card'>Delete</button>" +
                "</div>" +
                "</div>";
            $(note).appendTo($("#noteSession"))
            $("#"+el.NoteId).click(function (e) {
                $.ajax({
                    type: "Delete",
                    url: "https://localhost:44343/api/note?id=" + e.target.id
                }).then(res => console.log(res)).catch(err => console.log(err));
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
        if (count === 1)
        {
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