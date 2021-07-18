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
      var sql1='SELECT * FROM MOVIES_SHOWS ORDER BY rating DESC';
      var sql2='SELECT * FROM user_feedback';
      var sql3='SELECT * FROM users';
      var sql4='SELECT * FROM user_review';
      var sql5='SELECT * FROM contact_info';
      var sql6='select movie_show_name from movies_shows order by rating desc , year_release desc limit 5';
      var sql7='SELECT COUNT(username) as total_users FROM users';
      var sql8='SELECT COUNT(message) as total_messages FROM contact_info';
      var sql9='SELECT COUNT(username) as total_feedbacks FROM user_feedback';
      var sql10='SELECT COUNT(username) as total_reviews FROM user_review';


       db.query(sql1, function (err, data1, fields) {
         db.query(sql2, function (err, data2, fields) {
           db.query(sql3, function (err, data3, fields) {
             db.query(sql4, function (err, data4, fields) {
               db.query(sql5, function (err,data5, fields){
                 db.query(sql6, function (err,data6, fields){
                   db.query(sql7, function (err,data7, fields){
                     db.query(sql8, function (err,data8, fields){
                       db.query(sql9, function (err,data9, fields){
                         db.query(sql10, function (err,data10, fields){


           if (err) throw err;
    if(req.session.login){
    (req.session.user == "master")?res.render('user-master',{name :'master',film : 'joker',title:'User-List',movieData:data1,feedbackData:data2,userData:data3,reviewData:data4,contactData:data5,total_user:data7,total_message:data8,total_feedback:data9,total_review:data10}):res.render('user-common',{name :req.session.user, film : 'joker',trendingData:data6});
    return;
  }
  res.redirect('/login');
            });
          });
        });
      });
    });
  });
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
        req.session.user = (req.body.username == "Admin")?'master':result;
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

  // insert form data into user_review table
  var sql1= 'INSERT INTO user_review SET ?';
  var sql2='update movies_shows,user_review set movies_shows.rating = movies_shows.rating+user_review.star where movies_shows.movie_show_name = user_review.movie_name';
  db.query(sql1, userDetails,function (err, data) {
    db.query(sql2,function(err,result,fields){
      if (err) throw err;
        console.log("User review data is inserted successfully ");
        console.log(result);
      });
  });
 res.redirect('/users');  // redirect to create room page after inserting the data
});
// review form ends

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
 res.redirect('/about');  // redirect to create room page after inserting the data
});
//feedback ends
/*router.get('/', function(req, res, next) {
    var sql='SELECT * FROM user_review';
    db.query(sql, function (err, data, fields) {
    if (err) throw err;
      res.render('index', { title: 'Reviews', userData: data});
  });
});*/

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
