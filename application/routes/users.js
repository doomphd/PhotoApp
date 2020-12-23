
var express = require('express');
const { successPrint, errorPrint } = require('../helpers/debug/debugprinters');
var router = express.Router();
var db = require('../conf/database');
const UserModel = require('../models/Users')
const UserError = require('../helpers/error/UserError');
var app = express();
var bcrypt = require('bcrypt');
const { body, validationResult } = require('express-validator');


router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});


router.post('/register', [body('username').isLength({ min: 3 }).matches(/^[a-zA-Z]/), body('password').isLength({ min: 8 }).matches(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/)], (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    req.flash('error', 'User account has not been made. One or more requirements were not met.');
    res.redirect('/registration');
    return res.status(400).json({ errors: errors.array() });
  }

  let username = req.body.username;
  let email = req.body.email;
  let password = req.body.password;
  let cpassword = req.body.cpassword;

  UserModel.usernameExists(username)
    .then((usernameDoesExist) => {
      if (usernameDoesExist) {
        throw new UserError
          (
            "Registration Failed: Username already exists",
            "/registration",
            200
          );

      } else {
        UserModel.emailExists(email);
      }
    })
    .then((emailDoesExist) => {
      if (emailDoesExist) {
        throw new UserError
          (
            "Registration Failed: Email already exists",
            "/registration",
            200
          );

      } else {
        return UserModel.create(username, password, email);
      }
    })
    .then((createdUserId) => {
      if (createdUserId < 0) {
        throw new UserError("Server Error, user could not be created",
          "/registration",
          500
        );
      } else {
        successPrint("User.js, user was created!!");
        req.flash('success', 'User account has been made!');
        res.redirect('/login');
      }
    })
    .catch((err) => {
      errorPrint("User could not be made", err);
      if (err instanceof UserError) {
        errorPrint(err.getMessage());
        req.flash('error', err.getMessage());
        res.status(err.getStatus());
        res.redirect(err.getRedirectURL());
      }
      else {
        next(err);
      }
    });
})

router.post('/login', [body('username').isLength({ min: 3 }).matches(/^[a-zA-Z]/), body('password').isLength({ min: 8 }).matches(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/)], (req, res, next) => {
  let username = req.body.username;
  let password = req.body.password;

  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    req.flash('error', 'Could not log in');
    res.redirect('/login');
    return res.status(400).json({ errors: errors.array() });
  }

  UserModel.aunthenticate(username, password)
    .then((loggedUserId) => {
      if (loggedUserId > 0) {
        successPrint(`User ${username} is logged in`);
        req.session.username = username;
        req.session.userId = loggedUserId;
        res.locals.logged = true;
        req.flash('success', 'You have successfully logged in!');
        res.redirect('/');
      }
      else {
        throw new UserError("Invalid username and/or password!", "/login", 200);
      }
    })
    .catch((err) => {
      errorPrint("user login failed", err);
      if (err instanceof UserError) {
        errorPrint(err.getMessage());
        req.flash('error', err.getMessage());
        res.status(err.getStatus());
        res.redirect('/login');
      }
      else {
        next(err);
      }
    });
});

router.post('/logout', (req, res, next) => {
  req.session.destroy((err) => {
    if (err) {
      errorPrint('session could not be destroyed.');
      next(err);
    } else {
      successPrint('Session was destroyed');
      res.clearCookie('csid');
      res.json({ status: "OK", message: "user is logged out" });
      res.redirect('/');
    }
  })
})

module.exports = router;


