$(document).ready(function () {
    $("#errEmail").hide();
    $("#errPassword").hide();
    $("#errRePassword").hide();
    $("#errFName").hide();
    $("#errLName").hide();
    $("#submit").click(function () {
        let count = 0;
        const mailCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        const firstName = $("#txtFName").val();
        const lastName = $("#txtLName").val();
        const email = $("#txtEmail").val();
        const password = $("#txtPassword").val();
        const rePassword = $("#txtRePassword").val();
        mailCheck.test(email) ? (count++, $("#errEmail").hide()) : $("#errEmail").show();
        password.length !== 0 ? (count++, $("#errPassword").hide()) : $("#errPassword").show();
        password === rePassword ? (count++, $("#errRePassword").hide()) : $("#errRePassword").show();
        firstName.length !== 0 ? (count++, $("#errFName").hide()) : $("#errFName").show();
        lastName.length !== 0 ? (count++, $("#errLName").hide()) : $("#errLName").show();
        const userDetails = {
            FirstName: firstName,
            LastName: lastName,
            Email: email,
            Password: password
        }
        console.log(userDetails)
        count === 5 ? (
            $.ajax({
                type: "POST",
                url: "https://localhost:44343/api/user",
                data: JSON.stringify(userDetails),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                processData: true,
            }).then(res => {
                alert("Registration Successful");
                window.location.replace("https://localhost:44343/WebForms/Login");
            }).catch(err => {
                alert("Registration UnSuccessful");
                console.log(err)
            })
        ) : null;
        return false;
    })
});