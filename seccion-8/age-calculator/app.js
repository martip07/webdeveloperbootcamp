//alert("It worked");

var userAge = prompt('What is your age');
var message = document.getElementById('message');

function calculateAge(age) {
    var result = age * 365;
    console.log(result);
    message.innerHTML = 'You have been alive for ' + result + ' days';
}

calculateAge(userAge);