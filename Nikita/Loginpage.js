const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});


function validateUserEmail()
{

    var email = document.getElementById('Email').value;
    var result = email.match('[a-z]+.cs[0-9][0-9]@bmsce.ac.in');
    if(result==email)
    {
        return true;
    }
    else
    {
        return false;
    }

}


function validateUserDetails()
{
    if(validateUserEmail() == true && document.getElementById('pwd').value != '')
    {
        location.replace("#");
        return true;
    }
    else{
        alert('Email Format is invalid or password field is empty');
        location.replace("#")
    }

}


function check_name() {
    var x= document.getElementById("Name").value;
    var nameError = document.getElementById('name-field1');
    if(x==""||!(isNaN(x))) {
        nameError.style.display = 'block';
        return false;                     
    }  
    else {
        nameError.style.display = 'none';
        return true;                      
    }
}


function check_email() {

    var email1 = document.getElementById('Email').value;
    var result = email1.match('[a-z]+.cs[0-9][0-9]@bmsce.ac.in');
    var emailError = document.getElementById('email-field1');
    if (result == email1) {
        emailError.style.display = 'none';
        return true;
    }
    else {
        emailError.style.display = 'block';
        return false;
    }

}


function check_email1() {

    var email1 = document.getElementById('Email1').value;
    var result = email1.match('[a-z]+.cs[0-9][0-9]@bmsce.ac.in');
    var emailError = document.getElementById('email-field2');
    if (result == email1) {
        emailError.style.display = 'none';
        return true;
    }
    else {
        emailError.style.display = 'block';
        return false;
    }

}



