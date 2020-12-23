var express = require('express');
var router = express.Router();
var isLoggedin = require('../middleware/routesprotector').userIsLoggedIn;
const {getNRecentPosts, getPostById, getCommentsByPostId} = require('../middleware/postsmiddleware');
var db = require("../conf/database");

router.get('/', getNRecentPosts, function (req, res, next) {
  res.render('index', {title: "Truman's Page"});
});

router.get('/login', (req, res, next) => {
  res.render("login", {title: "Login"});
});

router.get('/registration', (req, res, next) => {
  res.render("registration", {title: "Registration"});
});

router.use('postImage', isLoggedin);
router.get('/postimage', (req, res, next) => {
  res.render("postimage", {title: "Post Image"});
});

//post/id
router.get('/post/:id(\\d+)', getPostById, getCommentsByPostId, (req, res, next) => {
  req.session.postId=req.params.id;
  res.render("imagepost", { title: `Post ${req.params.id}`, post:res.locals.currentPost});
});

module.exports = router;