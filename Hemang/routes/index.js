var express = require('express');
const user = require('./../core/user');
const db = require('./../db');
var router = express.Router();
var fs = require('fs');
/* GET home page. */
router.get('/', function(req, res, next) {
  if(req.session.login){
    res.redirect('/users');
    return;
  }
  res.render('index', { title: 'Express' });
});

router.get('/login',function(req,res,next){
  if(req.session.login){
    res.redirect('/users');
    return;
  }
  let success = req.params['success'];
  res.render('login', {title : 'Login',success : success});
});

router.get('/register',function(req,res,next){
  if(req.session.login){
    res.redirect('/users');
    return;
  }
  res.render('register', {title : 'Register'});
});

router.get('/users', function(req, res, next) {
  if(req.session.login){
    (req.session.user == "master")?res.render('user-master',{name :'master',film : 'joker'}):res.render('user-common',{name :req.session.user, film : 'joker'});
    return;
  }
  res.redirect('/login');
});

router.post('/register',(req,res,next)=>{
  let userInput = {
    username: req.body.username,
    password: req.body.password
  };
  user.create(userInput, function(latsId){
    if(latsId)res.redirect('/login?success=1');
    else console.log("Error creating new user...");
  });
});

router.post('/login',(req,res,next)=>{
  user.login(req.body.username, req.body.password, function (result) {
      if(result){
        req.session.user = (req.body.username == "kingMidas")?'master':result;
        req.session.login = true;
        res.redirect('/users');
      }
      else res.send("Username/Password incorrect");
  });
});

router.get('/logout', (req,res,next)=>{
  if(req.session.user) {
      req.session.destroy(function() {
          res.redirect('/');
      });
  }
});

// for review form

router.get('/review', function(req, res, next) {
res.render('/user');
});
router.post('/review', function(req, res, next) {

  // store all the user input data
  const userDetails=req.body;

  // insert user data into users table
  var sql = 'INSERT INTO user_review SET ?';
  db.query(sql, userDetails,function (err, data) {
      if (err) throw err;
         console.log("User review dat is inserted successfully ");
  });
 res.redirect('/users');  // redirect to create room page after inserting the data
});
// review form ends

module.exports = router;
