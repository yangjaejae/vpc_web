// routes/home.js

let express = require('express');
let router = express.Router();
let controller = require('../controller/controller')

// Home

router.get('/health', function(req, res){
  console.log('health');
})

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
    
    controller.add(form, function(res){
        console.log("res: ", res);
    })
    
    res.redirect('/board');
});

module.exports = router;
