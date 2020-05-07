// routes/home.js

let express = require('express');
let router = express.Router();
let controller = require('../controller/controller')

// Home
// router.get('/', controller.list);
router.get('/', function(req, res){
    
    controller.list(function(boardList){
        res.render('index',
            {
                board: boardList
            }
        );

    });


});

router.post('/add', function(req, res){

    let form = {
        name: req.body.name,
        email: req.body.email
    }
    
    controller.add(form, function(err, res){
        if(!err){
            res.redirect('/');
        }
    })

});

module.exports = router;