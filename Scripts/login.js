const validation = () => {
    const email = document.getElementById("txtEmail").value;
    const password = document.getElementById("txtPassword").value;
    const mailCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    let count = 0;

    mailCheck.test(email) ? (count++, document.getElementById("errEmail").append(""))
        : (document.getElementById("errEmail").append(""),
            document.getElementById("errEmail").append("invalid email"))

    if (password.length < 1) {
        document.getElementById("errPassword").append("");
        document.getElementById("errPassword").append("required");
    }
    else {
        count++;
        document.getElementById("errPassword").append("");
    }

    return count === 2 ? true : false

}