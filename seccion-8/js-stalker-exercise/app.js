//alert("It worked");

var firstName = prompt('What is your first name?');
var lastName = prompt('What is your last name?');
var userAge = prompt('What is your age?');

var message = document.getElementById('message');

//alert('Your name is ' + firstName + ' ' + lastName + ' and your age is ' + userAge);
console.log('Your name is ' + firstName + ' ' + lastName + ' and your age is ' + userAge);

message.innerHTML = 'Your name is ' + firstName + ' ' + lastName + ' and your age is ' + userAge;
