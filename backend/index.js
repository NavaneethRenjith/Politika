const app = require('express')();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({
    extended: true
  }));
  require('dotenv/config');
  
  
  //connect to db
  mongoose.connect(process.env.DB_CONNECTION,{useNewUrlParser:true}, ()=> console.log('Connected to db'));
  
  const newsSchema={
      title:String,
      location:String,
      content:String,
    };
    
    const News=mongoose.model("News",newsSchema);
    
    app.get("/news",(req,res)=>{
      News.find((err,foundNews)=>{
        if(!err){
          res.send(foundNews);
        }else{
          res.send(err);
        }
      });
    });
    
    
    app.get("/news/:news_location",function(req, res){
    
      News.find({location: req.params.news_location}, function(err, found_news){
        if (found_news) {
          res.send(found_news);
        } else {
          res.send("No match found");
        }
      });
    });
  
  app.listen(3000);
  
  
  
  