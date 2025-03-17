const express = require('express');
const router = express.Router();
const itemController = require('../controllers/itemController');
const {auth} = require('../middlewares/auth');

// Get all items
router.get('/', auth ,itemController.getAllItems);


module.exports = router;
