const mongoose =require('mongoose')
const user =new mongoose.Schema({
    Firstname:{
        type:String,
        required:[true,'must provide First name'],
        trim:true,
    },
    Lastname:{
        type:String,
        required:[true,'must provide Last name'],
        trim:true,
    },
    Email:{
        type:String,
        unique:true,
        required:[true,'must provide Email'],
        trim:true,
    },
    password:{
        type:String,
        require:[true,'must provide Password'],
    },
    Orgname:{
        type:String,
        required:[true,'must provide Organization name'],
    }
})
module.exports=mongoose.model('user',user )