const app = require('express')();
const mongoose = require('mongoose');
require('dotenv/config');

app.get('/kochi', (req, res) => {
res.status(200).send({
 location: 'kochi',
 news: 'Narcotic jihad row: Congress condemns it, BJP says serious issue'
})

});

//connect to db
mongoose.connect(process.env.DB_CONNECTION, ()=> console.log('Connected to db'));


app.listen(3000);