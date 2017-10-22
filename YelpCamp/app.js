const express = require('express');
const bodyparser = require('body-parser');
const app = express();

app.use(bodyparser.urlencoded({extended: true}));
app.set('view engine', 'ejs');

let campgrounds = [
    {name: 'Arequia - Peru', image: 'https://media.holidayme.com/images/Arequipa-Peru/Arequipa-635637324544067260.jpg'},
    {name: 'Lima - Peru', image: 'https://www.airpano.com/files/Lima-Peru/images/image5.jpg'},
    {name: 'Arequia - Peru', image: 'https://media.holidayme.com/images/Arequipa-Peru/Arequipa-635637324544067260.jpg'},
    {name: 'Lima - Peru', image: 'https://www.airpano.com/files/Lima-Peru/images/image5.jpg'},
    {name: 'Arequia - Peru', image: 'https://media.holidayme.com/images/Arequipa-Peru/Arequipa-635637324544067260.jpg'},
    {name: 'Lima - Peru', image: 'https://www.airpano.com/files/Lima-Peru/images/image5.jpg'},
    {name: 'Huancayo - Peru', image: 'http://media1.trover.com/T/5346aae6d6bdd436d3001444/fixedw_large_4x.jpg'}
]

app.get('/', function(req, res) {
    res.render('landing');
})

app.get('/campgrounds', function(req, res) {
    res.render('campgrounds', {campgrounds: campgrounds});
})

app.post('/campgrounds', function (req, res) {
    let newName = req.body.name;
    let newImage = req.body.image;
    console.log(newName);
    let newCampground = {
        name: newName,
        image: newImage
    };

    console.log(newCampground);

    campgrounds.push(newCampground);
    res.redirect('/campgrounds');
})

app.get('/campgrounds/new', function (req, res) {
    res.render('new');
})

app.listen(3000, function() {
    console.log('The YelpCamp Server');
})