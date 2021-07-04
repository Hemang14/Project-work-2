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
  var sql='SELECT * FROM user_review';
  db.query(sql, function (err, data, fields) {
  if (err) throw err;
  res.render('index', { title: 'Express', userData: data });
  });
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
       res.sendFile(__dirname+"/failure.html");
  });
});

router.get('/logout', (req,res,next)=>{
  if(req.session.user) {
      req.session.destroy(function() {
          res.redirect('/');
      });
  }
});
router.get('/contact', function(req, res){
  res.render("contact");
});
router.get('/about', function(req, res){
  res.render("about");
});
router.get('/feedback', function(req, res){
  res.render("feedback");
});

router.post("/failure",function(req,res){
  res.redirect("/login");
});
// for review form
router.get('/review', function(req, res, next) {
    //res.render("review",{username:req.body.username, movieName:req.body.movie_name, reviewGiven:req.body.review});
res.render('/user');
});
router.post('/review', function(req, res, next) {

  // store all the user input data
  const userDetails=req.body;

  // insert user data into users table
  var sql = 'INSERT INTO user_review SET ?';
  db.query(sql, userDetails,function (err, data) {
      if (err) throw err;
         console.log("User review data is inserted successfully ");
  });
 res.redirect('/users');  // redirect to create room page after inserting the data
});
// for contact us
/*router.get('/contact', function(req, res, next) {
res.render('/user');
});*/
router.post('/contact', function(req, res, next) {

  // store all the user input data
  const userContactDetails=req.body;

  // insert user data into users table
  var sql = 'INSERT INTO contact_info SET ?';
  db.query(sql, userContactDetails,function (err, data) {
      if (err) throw err;
         console.log("User contact data is inserted successfully ");
  });
 res.redirect('/contact');  // redirect to create room page after inserting the data
});
// contact us ends
// for feedback form
/*router.get('/feedback', function(req, res, next) {
    //res.render("review",{username:req.body.username, movieName:req.body.movie_name, reviewGiven:req.body.review});
res.render('/user');
});*/
router.post('/feedback', function(req, res, next) {

  // store all the user input data
  const userDetails=req.body;

  // insert user data into users table
  var sql = 'INSERT INTO user_feedback SET ?';
  db.query(sql, userDetails,function (err, data) {
      if (err) throw err;
         console.log("User feedback data is inserted successfully ");
  });
 res.redirect('/feedback');  // redirect to create room page after inserting the data
});
//feedback ends
/*router.get('/', function(req, res, next) {
    var sql='SELECT * FROM user_review';
    db.query(sql, function (err, data, fields) {
    if (err) throw err;
      res.render('index', { title: 'Reviews', userData: data});
  });
});*/

module.exports = router;
