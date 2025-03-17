const jwt = require('jsonwebtoken')
const User = require('../models/user')

const auth = async (req , res , next) => {
    try {
        const token = req.body.token
        if(!token){
            return res.status(401).json({error :  'unAuthorized'})
        }
        const _id = jwt.verify(token , process.env.JWT_SECRET)
        const user = await User.findById(_id)
        if(!user){
            res.status(401).json({error : "unauthorized"})
        }

        // res.status(200).send(user)
        req.user = user
        next()

        // res.send({})
    } catch (error) {
        console.log('error in the auth' + error)
        res.status(500).json({error : 'internal server error'})
    }
}

module.exports = {auth}