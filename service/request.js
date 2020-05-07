let request = require('request');

function get(cb){

    request({
                uri: `http://${process.env.API}/board/`,
                method: "GET"
            }
    , (err, res, body) => {
        let boardList = JSON.parse(body);
        // console.log(boardList)
        cb(boardList);
    });

}

function post(form, cb){

    request({
                uri: `http://${process.env.API}/board/add`,
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