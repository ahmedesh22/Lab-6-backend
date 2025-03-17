const Item = require('../models/itemModel');

// Get all items
exports.getAllItems = async (req, res) => {
    try {
        const items = await Item.find();
        res.status(200).json({Items : items});
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};



