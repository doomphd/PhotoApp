const express = require('express');
const router = express.Router();
const db = require('../conf/database');



router.get('/getAllUsers', (req, res, next) => {
    db.query('SELECT * from users;', (err, results, fields) => 
    {
        if(err) {
            next(err);
        }
        console.log(results);
        res.send(results);
    })
});

router.get('/getAllPosts', (req, res, next) => {
    db.query('SELECT * from posts;', (err, results, fields) => 
    {
        if(err){
            next(err);
        }
        console.log(results);
        res.send(results);
    })
});

router.get('/getAllPostsP', (req, res, next) => {
    db.query('SELECT * from posts;')
    .then(([results, fields]) => {
        console.log(results);
        res.send(results);
    })
    .catch((err) => {
        next(err);
    })
});


module.exports = router;
