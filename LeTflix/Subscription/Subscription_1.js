// document.addEventListener("DOMContentLoaded", () => {
$(document).ready(() => {
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    })
})

function seePw(){
    var pw = document.getElementById("formPw");
    var pwC = document.getElementById("formPw_confirm");
    if (pw.type === "password" && pwC.type === "password"){
        pw.type = "text";
        pwC.type = "text";
    } else {
        pw.type = "password";
        pwC.type = "password";
    }
}

var emailVal = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
var pwVal = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
var emailTrue = 0;
var pwTrue = 0;
var pwCTrue = 0;
var genderTrue = 1;
var msgPw = document.getElementById("input-error-message_pw");
var msgEmail = document.getElementById("input-error-message_email");
var email = document.querySelector('#formEmail');
var pw = document.querySelector('#formPw');
var pwC = document.querySelector('#formPw_confirm');
var gender = document.getElementsByName("btn-gender");
var tnc = document.querySelector("input[type='checkbox']:checked");

email.addEventListener('keyup', function() {
    var utimes = document.querySelector('.u_times');
    var ucheck = document.querySelector('.u_check');
    if (email.value.match(emailVal)){
        email.style.border = '2px solid green';
        utimes.style.display = 'none';
        ucheck.style.display = 'block';
        msgEmail.style.display = 'none';
        emailTrue = 1;
    } else {
        email.style.border = '2px solid red';
        utimes.style.display = 'block';
        ucheck.style.display = 'none';
        msgEmail.style.display = 'block';
        emailTrue = 0;
    }
});

pw.addEventListener('keyup', function() {
    var ptimes = document.querySelector('.p_times');
    var pcheck = document.querySelector('.p_check');
    if (pw.value.match(pwVal)){
        pw.style.border = '2px solid green';
        ptimes.style.display = 'none';
        pcheck.style.display = 'block';
        msgPw.style.display = 'none';
        pwTrue = 1;
    } else {
        pw.style.border = '2px solid red';
        ptimes.style.display = 'block';
        pcheck.style.display = 'none';
        msgPw.style.display = 'block';
        pwTrue = 0; 
    }
});

pwC.addEventListener('keyup', function() {
    var pCtimes = document.querySelector('.pc_times');
    var pCcheck = document.querySelector('.pc_check');
    if (pwC.value != pw.value){
        pwC.style.border = '2px solid red';
        pCtimes.style.display = 'block';
        pCcheck.style.display = 'none';
        pwCTrue = 0; 
    } else {
        pwC.style.border = '2px solid green';
        pCtimes.style.display = 'none';
        pCcheck.style.display = 'block';
        pwCTrue = 1;
    }
});

document.querySelector("#step1-btn").addEventListener("click", e =>{
    if(!$("#checkbox_tnc").is(":checked")){
        alert("You need to agree the Terms and Conditions!");
    } if (emailTrue == 0 || pwTrue == 0 || pwCTrue == 0){
        alert("Invalid email/password!");

    } if (gender[0].checked != true && gender[1].checked != true){
        alert("Please choose your gender!");
    }
    if (emailTrue == 1 && pwTrue == 1 && pwCTrue == 1 && $("#checkbox_tnc").is(":checked") && (gender[0].checked == true || gender[1].checked == true)){
        e.preventDefault();
        location.href="Subscription_2.html";
    }
    
});
// });