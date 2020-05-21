$(Document).ready(function () {
    $("#submit").click(function (e) {
        if ($("#noteTitle").val() == "")
            alert("Title cannot be empty");
        else if ($("#noteDescription").val() == "")
            alert("Description cannot be empty"); 
        else {
            $.ajax({
                type: "POST",
                url: "/Home/AddNote",
                contentType: "application/json; charset=utf-8",
                data: '{"Title":"' + $("#noteTitle").val() + '","Description":"' + $("#noteDescription").val() + '"}',
                dataType: "html",
                success: function (result, status, xhr) {
                    $("#dataDiv").html(result);
                },
                error: function (xhr, status, error) {
                    $("#dataDiv").html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText)
                }
            });
        }
    })
        
})