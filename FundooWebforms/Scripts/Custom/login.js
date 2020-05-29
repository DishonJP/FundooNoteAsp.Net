$(document).ready(function () {
    $("#errEmail").hide();
    $("#errPassword").hide();
    $("#submit").click(function () {
        let count = 0;
        const mailCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        const email = $("#txtEmail").val();
        const password = $("#txtPassword").val();
        mailCheck.test(email) ? (count++, $("#errEmail").hide()) : $("#errEmail").show();
        password.length !== 0 ? (count++, $("#errPassword").hide()) : $("#errPassword").show();
        return count === 2 ? (
            $.ajax({
                type: "DELETE",
                url: "https://localhost:44343/api/user/00000000-0000-0000-0000-000000000000"
            }).then(res => {
                res[0].Email === email ? window.location.replace("https://localhost:44343/WebForms/Registration"): alert("Login Failed");
            }).catch(err => alert("Network Error")), false
        ): false;
    })
});