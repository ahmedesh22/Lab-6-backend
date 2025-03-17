// src/routes/userRoutes.js

const express = require('express');
const router = express.Router();

const { getUsers, createUser } = require('../controllers/userController');
// const authMiddleware = require('../middlewares/authMiddleware');


// Apply authMiddleware to all routes in this router
// router.use(authMiddleware);

// GET /users - fetch all users
router.get('/', getUsers);

// POST /users - create a new user
router.post('/', createUser);

module.exports = router;
