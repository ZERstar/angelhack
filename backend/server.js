const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();


const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
const bodyParser = require('body-parser');
app.use(bodyParser.json());
const port = process.env.PORT;
const uri = process.env.MONGO_URI

mongoose.connect(uri, {});

mongoose.connection.once('open', () => {
    console.log("mongodb connected");
})
// const user = require('./routes/user');
// app.use('/user', user)

app.get('/', (req, res) => {
    res.send("Saadhan-Backend id Live ✨✨✨");
})
const user = require('./routes/user');
app.use('/api/user', user)

const loanApp = require('./routes/loanApplication');
app.use('/api/loanapp', loanApp);

const chatBot = require('./routes/chatbot');
app.use('/api/chatbot', chatBot);

const loanRepayment = require('./routes/loanRepayment');
app.use('/api/loanrepayment', loanRepayment);

app.listen(port, () => {
    console.log("server running on port :-" + port);
});