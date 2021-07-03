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
      var sql1='SELECT * FROM MOVIES_SHOWS';
      var sql2='SELECT * FROM feedback';
      var sql3='SELECT * FROM users';
      var sql4='SELECT * FROM user_review';
       db.query(sql1, function (err, data1, fields) {
         db.query(sql2, function (err, data2, fields) {
           db.query(sql3, function (err, data3, fields) {
             db.query(sql4, function (err, data4, fields) {

           if (err) throw err;
    if(req.session.login){
    (req.session.user == "master")?res.render('user-master',{name :'master',film : 'joker',title:'User-List',movieData:data1,feedbackData:data1,userData:data3,reviewData:data4}):res.render('user-common',{name :req.session.user, film : 'joker'});
    return;
  }
  res.redirect('/login');
            });
          });
        });
      });
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

  // insert form data into user_review table
  var sql1= 'INSERT INTO user_review SET ?';
  var sql2='update movies_shows,user_review set movies_shows.rating = movies_shows.rating+user_review.star where movies_shows.movie_show_name = user_review.movie_name';
  db.query(sql1, userDetails,function (err, data) {
    db.query(sql2,function(err,result,fields){
      if (err) throw err;
        console.log("User review dat is inserted successfully ");
        console.log(result);
      });
  });
 res.redirect('/users');  // redirect to create room page after inserting the data
});
// review form ends

// for admin page start
//
// router.get('/users', function(req, res, next) {
//     var sql='SELECT * FROM users';
//     db.query(sql, function (err, data, fields) {
//         if (err) throw err;
//     res.render('user-master', { title: 'User List', userData: data});
// });
// });
// admin page ends
module.exports = router;
