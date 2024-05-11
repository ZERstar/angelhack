const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
const port = process.env.PORT;
const uri = process.env.MONGO_URI;

mongoose.connect(uri, { useNewUrlParser: true });

mongoose.connection.once("open", () => {
  console.log("mongodb connected");
});
// const user = require('./routes/user');
// app.use('/user', user)

app.listen(port, () => {
  console.log("server running on port :-" + port);
});
