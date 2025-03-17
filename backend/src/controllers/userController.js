const User = require('../models/userModel')
const mongoose = require('mongoose')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

function generateAuthToken(_id , res) {
  const token = jwt.sign({_id} , process.env.JWT_SECRET , {expiresIn : '3d'})

  return token
}


const signup = async (req , res) => {
  try {
      const {email , password} = req.body
      const generatedId = new mongoose.Types.ObjectId();
      
      const newUser = new User({
          _id : generatedId,
          email,
          password,
      })

      await newUser.save()

      const token = generateAuthToken(generatedId , res)

      res.status(201).send({User : newUser ,accessToken : token})
  } catch (error) {
      console.log('error: ' + error)
      res.status(500).json({error : "internal server error"})

  }
}


const login = async (req , res) => {
  try {
      const {email , password} = req.body;
      if(!email || !password){
          return res.status(400).json({error : "email and password both must be provided"})
      }
      
      const user = await User.findOne({email})
      
      if(!user){
          return res.status(404).json({error : "email or password or both is incorrect"})
      }
      
      const isPasswordMatching = await bcrypt.compare(password , user.password)
      if(!isPasswordMatching){
          return res.status(404).json({error : "email or password or both is incorrect"})
      }
      const token = generateAuthToken(user._id , res)
      
      res.send({User : user , accessToken : token})
      
  } catch (error) {
      console.log(error)
      // res.status(400).json({error : error})
      res.status(500).json({error : "internal server error"})

  }
}

module.exports = {login , signup}