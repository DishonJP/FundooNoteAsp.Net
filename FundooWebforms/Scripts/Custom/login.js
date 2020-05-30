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
                type: "GET",
                url: "https://localhost:44343/api/user"
            }).then(async res => {
                const result = res.find(user => user.Email === email && user.Password === password)
                result !== undefined ? (await localStorage.setItem("userDetails", await JSON.stringify(result)),
                    window.location.replace("https://localhost:44343/WebForms/Home")
                ) : alert("Login Failed");
            }).catch(err => alert("Network Error")), false
        ): false;
    })
});