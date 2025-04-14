const Item = require('../models/itemModel');
const axios = require('axios');
// Get all items
exports.getAllItems = async (req, res) => {
    try {
        const items = await Item.find();
        res.status(200).json({Items : items});
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

exports.createPaymentIntent = async (req, res) => {
    try {
        const { amount, currency = "usd" } = req.body;
        
        if (!amount || !currency) {
            return res.status(400).json({ 
                error: 'Amount and currency are required' 
            });
        }

        const data = {
            amount: Math.round(amount * 100), // Convert to cents
            currency: currency
        };

        const response = await axios.post(
            'https://api.stripe.com/v1/payment_intents',
            new URLSearchParams(data).toString(),
            {
                headers: {
                    'Authorization': `Bearer ${process.env.stripeSecretKey}`,
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }
        );

        res.status(200).json(response.data);
    } catch (error) {
        console.error('Payment Intent Error:', error);
        res.status(500).json({ 
            error: 'Failed to create payment intent' 
        });
    }
};

