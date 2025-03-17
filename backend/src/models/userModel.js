const mongoose = require('mongoose')
const validator = require('validator')
const bcrypt = require('bcryptjs')

const userSchema = new mongoose.Schema({
    email : {
        type : String,
        required : true,
        trim : true,
        unique : true,
        lowercase : true,
        validate(value) {
            if(!validator.isEmail(value)){
                throw new Error("email must be an email");
            }
        }
    },
    password :{ 
        type : String,
        trim : true,
        required : true,
        minlength : [6 , 'your password must have more than 6 chars'],
        validate(value) {
            if(validator.contains(value.toLowerCase() , 'password') ){
                throw new Error('your passwrod can not contain the word password')
            }
        }
    }
} , {timestamps : true})

userSchema.pre('save' , async function (next) {
    const user = this;
    if(user.isModified('password')){
        user.password = await bcrypt.hash(user.password , 8)
    }
    next();
})

const User = mongoose.model('User' , userSchema)
module.exports = User

