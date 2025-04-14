const express = require('express');
const router = express.Router();
const itemController = require('../controllers/itemController');
const {auth} = require('../middlewares/auth');

// Get all items
router.get('/', auth ,itemController.getAllItems);
router.post('/create-payment-intent', auth, itemController.createPaymentIntent);


module.exports = router;
