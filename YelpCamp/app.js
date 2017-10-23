const express = require('express');
const bodyparser = require('body-parser');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://localhost/yelp_camp');
app.use(bodyparser.urlencoded({extended: true}));
app.set('view engine', 'ejs');

var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error'));

let campgroundSchema = new mongoose.Schema({
    name: String,
    image: String,
    description: String
});

var Campground = mongoose.model('Campground', campgroundSchema);
//const demoCampground = {
//    name: "EL Tambito",
//    image: "random-string"
//}
//Campground.create(demoCampground);

/*let campgrounds = [
    {name: 'Arequia - Peru', image: 'https://media.holidayme.com/images/Arequipa-Peru/Arequipa-635637324544067260.jpg'},
    {name: 'Lima - Peru', image: 'https://www.airpano.com/files/Lima-Peru/images/image5.jpg'},
    {name: 'Arequia - Peru', image: 'https://media.holidayme.com/images/Arequipa-Peru/Arequipa-635637324544067260.jpg'},
    {name: 'Lima - Peru', image: 'https://www.airpano.com/files/Lima-Peru/images/image5.jpg'},
    {name: 'Arequia - Peru', image: 'https://media.holidayme.com/images/Arequipa-Peru/Arequipa-635637324544067260.jpg'},
    {name: 'Lima - Peru', image: 'https://www.airpano.com/files/Lima-Peru/images/image5.jpg'},
    {name: 'Huancayo - Peru', image: 'http://media1.trover.com/T/5346aae6d6bdd436d3001444/fixedw_large_4x.jpg'}
]*/

app.get('/', function(req, res) {
    res.render('landing');
})

app.get('/campgrounds', function(req, res) {

    Campground.find({}, function (err, campgroundsList) {
        if (err) {
            console.log(err);
        } else {
            res.render('campgrounds', {campgrounds: campgroundsList});
        }
    });
    
});

app.post('/campgrounds', function (req, res) {
    let newName = req.body.name;
    let newImage = req.body.image;
    let newDescription = req.body.description;
    console.log(newName);
    let newCampground = {
        name: newName,
        image: newImage,
        description: newDescription
    };

    console.log(newCampground);

    Campground.create(newCampground, function (err, newlyCreated) {
        if (err) {
            console.log(err);
        } else {
            res.redirect('/campgrounds');
        }
    });

})

app.get('/campgrounds/new', function (req, res) {
    res.render('new');
})

app.get('/campgrounds/:id', function (req, res) {
    let idCampground = req.params.id;

    Campground.findById(idCampground, function (err, singleCamground) {
        if (err) {
            console.log(err);
        } else {
            res.render('description', {campground: singleCamground});
        }
    })
});

app.listen(3000, function() {
    console.log('The YelpCamp Server');
})