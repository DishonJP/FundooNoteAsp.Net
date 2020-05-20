const validation = () => {
    const firstName = document.getElementById("txtFName").value;
    const lastName = document.getElementById("txtLName").value;
    const email = document.getElementById("txtEmail").value;
    const password = document.getElementById("txtPassword").value;
    const rePassword = document.getElementById("txtRePassword").value;
    const mailCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    let count = 0;

    firstName.length > 0 ? (count++, document.getElementById("errFName").append(""))
        : (document.getElementById("errFName").append(""),
            document.getElementById("errFName").append("fill the field"));

    lastName.length > 0 ? (count++, document.getElementById("errLName").append(""))
        : (document.getElementById("errLName").append(""),
            document.getElementById("errLName").append("fill the field"))


    mailCheck.test(email) ? (count++, document.getElementById("errEmail").append(""))
        : (document.getElementById("errEmail").append(""),
            document.getElementById("errEmail").append("invalid email"))

    if (password.length < 6) {
        document.getElementById("errPassword").append("");
        document.getElementById("errPassword").append("password min length 6");
    }
    else {
        count++;
        document.getElementById("errPassword").append("");
    }

    password === rePassword ? (count++, document.getElementById("errRePassword").append(""))
        : (document.getElementById("errRePassword").append(""),
            document.getElementById("errRePassword").append("password did not match"))
    return count === 5 ? true : false

}