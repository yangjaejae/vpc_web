let request = require('request');
require('dotenv').config()

function get(cb){

    request({
                url: `${process.env.API_URL}:${process.env.API_PORT}/board`,
                method: "GET"
            }
    , (err, res, body) => {
	console.log("err: ", err)
	console.log("res: ", res)
	console.log("body: ", body)
        let boardList = JSON.parse(body);
        //console.log(boardList)
        cb(boardList);
    });

}

function post(form, cb){

    request({
                url: `${process.env.API_URL}:${process.env.API_PORT}/board/add`,
                method: "POST",
                form: {
                    name: form.name,
                    email: form.email
                }
            }
    , (err, res, body) => {
        // console.log("res: ", res);
        // console.log("body: ", body);
        cb(err, body)
    });
    
}

module.exports = {
    get, 
    post
}
