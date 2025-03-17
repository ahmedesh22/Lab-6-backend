const express = require('express')
const router = new express.Router()
const {login , signup} = require('../controllers/userController')

router.post('/signup' , signup)

router.post('/login' , login)

module.exports = router