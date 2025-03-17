// src/controllers/userController.js

// A simple controller for user operations

// Get all users
const getUsers = (req, res) => {
    // In a real app, you would fetch users from a database
    res.json({ message: "Fetched all users", users: [] });
  };
  
  // Create a new user
  const createUser = (req, res) => {
    const { name, email } = req.body;
    // Here you would typically validate and save the user to a database
    res.status(201).json({ message: "User created", user: { name, email } });
  };
  
  module.exports = { getUsers, createUser };


  
  