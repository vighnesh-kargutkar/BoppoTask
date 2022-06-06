const express =require('express')
const app=express()
const ejs =require('ejs')
const { check, validationResult } = require("express-validator");

const user=require('./db/user')
const employee=require('./db/employee')
const connection=require('./db/connection');
// const user = require('./db/user');
require('dotenv').config()

const port=3000
app.use(express.json())
app.set("view engine", "ejs");
app.use( express.urlencoded({ extended: false }))
app.use(express.static("public"));

app.get('/',(req,res)=>{
    res.render('index')
})
app.get('/registration',async(req,res)=>{
    res.render('registration')
})
app.post("/registration",
check("fname").notEmpty().withMessage("First Name required.").isAlpha().withMessage("First Name must be alphabetic."),
check("lname").notEmpty().withMessage("last Name required.").isAlpha().withMessage("Last Name must be alphabetic."),
check("email").isEmail().normalizeEmail().withMessage("Email is not valid ").notEmpty().withMessage("Email required."),
check("password").isLength({ min: 5, max: 10 }).withMessage("Password should be greater than 5 and lessthen 10").notEmpty().withMessage("Password required"),
check("type").notEmpty().withMessage("type require"),
check("org").notEmpty().withMessage("organization  require"),
check("cnpassword")
.notEmpty()
.withMessage("confirmpassword required")
.custom((value, { req }) => {
  if (value !== req.body.password) {
    throw new Error("Password confirmation does not match password");
  }
  return true;
}),async(req,res)=>{
    const errors = validationResult(req);
      if (!errors.isEmpty()) {
        const alert = errors.array();
        // return res.status(422).jsonp(errors.array());
        return res.render("registration", { alert });
      }
    const type=req.body.type
    if(type=="User"){
        const find=await user.findOne({Email:req.body.email})
        console.log(find);
        if(find!=null ){
            return res.send("email already exit")
        }
        else{
            if(req.body.cnpassword==req.body.password){
                const reg= await user({
                    Firstname:req.body.fname,
                    Lastname:req.body.lname,
                    Email:req.body.email,
                    password:req.body.password,
                    Orgname:req.body.org,
                })
                const regs=await reg.save()
                res.render("login")
            }else{
                res.send('password did not match')
            }
        }
    }if(type=="Employee"){
        const find=await employee.findOne({Email:req.body.email})
        console.log(find);
        if(find!=null ){
            return res.send("email already exit")
        }
        else{
            if(req.body.cnpassword==req.body.password){
                const reg= await employee({
                    Firstname:req.body.fname,
                    Lastname:req.body.lname,
                    Email:req.body.email,
                    password:req.body.password,
                    Orgname:req.body.org,
                })
                const regs=await reg.save()
                res.render("login")
            }else{
                res.send('password did not match')
            }
        }
    } 
})

app.get('/login',async(req,res)=>{
    res.render('login')
})
app.post('/login',
check("email").isEmail().normalizeEmail().withMessage("Email is not valid ").notEmpty().withMessage("Email required."),
check("password").isLength({ min: 5, max: 10 }).withMessage("Password should be greater than 5 and lessthen 10").notEmpty().withMessage("Password required"),
check("type").notEmpty().withMessage("type require"),
async(req,res)=>{
    const errors = validationResult(req);
      if (!errors.isEmpty()) {
        const alert = errors.array();
        // return res.status(422).jsonp(errors.array());
        return res.render("login", { alert });
      }
    const type=req.body.type
    if(type=="User"){
        const find=await user.findOne({Email:req.body.email})
        if(find!=null){
            if(req.body.password==find.password){
                const fn =await user.find({}).sort({Firstname:1})
                const ln =await user.find({}).sort({Lastname:1})
                const em =await user.find({}).sort({Email:1})
                const org =await user.find({}).sort({password:1})
                const id =await user.find({}).sort({Orgname:1})
                res.render('user',{fn,ln,em,org,id})
            }else{
                res.send('wrong password')
            }
        }
        else{
            res.send('emailid not found please register')
        }
    }if(type=="Employee"){
        const find=await employee.findOne({Email:req.body.email})
        if(find!=null){
            if(req.body.password==find.password){
                const fn =await employee.find({}).sort({Firstname:1})
                const ln =await employee.find({}).sort({Lastname:1})
                const em =await employee.find({}).sort({Email:1})
                const org =await employee.find({}).sort({password:1})
                const id =await employee.find({}).sort({Orgname:1})
                res.render('employee',{fn,ln,em,org,id})
            }else{
                res.send('wrong password')
            }
        }
        else{
            res.send('emailid not found please register')
        }
    }
})
app.get('/user',async(req,res)=>{
    const fn =await user.find({}).sort({Firstname:1})
    const ln =await user.find({}).sort({Lastname:1})
    const em =await user.find({}).sort({Email:1})
    const org =await user.find({}).sort({password:1})
    const id =await user.find({}).sort({Orgname:1})
    res.render('user',{fn,ln,em,org,id})
})
app.get('/employee',async(req,res)=>{
    const fn =await employee.find({}).sort({Firstname:1})
                const ln =await employee.find({}).sort({Lastname:1})
                const em =await employee.find({}).sort({Email:1})
                const org =await employee.find({}).sort({password:1})
                const id =await employee.find({}).sort({Orgname:1})
                res.render('employee',{fn,ln,em,org,id})
})


const start =async()=>{
    try {
        await connection(process.env.MONGO_URL)
        app.listen(port,console.log(`server is listening on port ${3000}`))
    } catch (error) {
        console.log(error);
    }
}
start()