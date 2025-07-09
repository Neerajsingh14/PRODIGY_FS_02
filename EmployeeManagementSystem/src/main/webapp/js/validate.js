function validateForm() {
    const name = document.forms["empForm"]["name"].value;
    const email = document.forms["empForm"]["email"].value;
    const department = document.forms["empForm"]["department"].value;
    const salary = document.forms["empForm"]["salary"].value;

    if (name === "" || email === "" || department === "" || salary === "") {
        alert("All fields are required.");
        return false;
    }

    if (isNaN(salary) || salary <= 0) {
        alert("Please enter a valid salary.");
        return false;
    }

    return true;
}
