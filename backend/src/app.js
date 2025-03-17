// app.js
const express = require('express');
// const dotenv = require('dotenv');
const userRoutes = require('./routes/userRoutes');
// // Load environment variables from .env file
// dotenv.config();

const app = express();

// Built-in middleware for JSON and URL-encoded data
app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

app.use('/users', userRoutes);

// Define a simple route
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Export the app for use in server.js or testing
module.exports = app;
