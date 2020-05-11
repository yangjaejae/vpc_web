// routes/home.js

let express = require('express');
let router = express.Router();
let controller = require('../controller/controller')

// health
router.get('/', function(req, res){
    res.send({health: 'good'});
});