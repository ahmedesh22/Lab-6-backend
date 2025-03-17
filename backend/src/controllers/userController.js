const User = require('../models/userModel')
const mongoose = require('mongoose')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

function generateAuthToken(_id , res) {
  const token = jwt.sign({_id} , process.env.JWT_SECRET , {expiresIn : '3d'})

  return token
}


const signup = async (req, res) => {
  try {
    const { email, password } = req.body;
    const generatedId = new mongoose.Types.ObjectId();

    const newUser = new User({
      _id: generatedId,
      email,
      password,
    });

    await newUser.save();

    const token = generateAuthToken(generatedId, res);

    const userToSend = {
      email : newUser.email,
      _id : newUser._id,
      createdAt : newUser.createdAt,
      updatedAt : newUser.updatedAt
  }

    res.status(201).send({ User: userToSend, accessToken: token });
  } catch (error) {
    console.error('Signup error:', error);

    if (error.name === 'ValidationError') {
      const messages = Object.values(error.errors)
        .map(err => err.message)
        .join(', ');
      return res.status(400).json({ error: messages });
    }

    if (error.code && error.code === 11000) {
      return res.status(400).json({ error: 'Email already exists' });
    }
    res.status(500).json({ error: 'Internal server error' });
  }
};


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
      const userToSend = {
          email : user.email,
          _id : user._id,
          createdAt : user.createdAt,
          updatedAt : user.updatedAt
      }
      res.send({User : userToSend , accessToken : token})
      
  } catch (error) {
      console.log(error)
      // res.status(400).json({error : error})
      res.status(500).json({error : "internal server error"})

  }
}

module.exports = {login , signup}
