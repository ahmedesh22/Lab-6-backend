const mongoose = require('mongoose')

const connectToMongodb = async () => {
    mongoose.connect(process.env.MONGODB_URL)
    .then(() => console.log('connected succesfuly to mongodb'))
    .catch((err) => console.log("couldn't connect to mongodb " + err))
}

module.exports = {connectToMongodb}