// menggunakan Mongoose
const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/fruitsDB'); //fruitDB = database

const fruitSchema = new mongoose.Schema({
        name: {
        type: String,
        required: [true, "Please check your data entry, no name specified!"] //menambahkan NOT NULL
    },
    rating:{
        type: Number,
        min: 1,
        max: 10
    },
    review: String
});

const Fruit = mongoose.model("Fruit", fruitSchema); // Fruit collections

const fruit = new Fruit({
    rating: 10,
    review: "peaches so yummy"
});
// fruit.save();

//didalam fruitDB kita menambahkan person
const personSchema = new mongoose.Schema({
    name: String,
    age: Number,
    favouriteFruit: fruitSchema
})

const Person = mongoose.model("Person", personSchema); 

//relation
const mango = new Fruit({
    name: "Mango",
    score: 6,
    review:"Decent fruit"
});
mango.save();

Person.updateOne({ name: "John" }, { favouriteFruit: mango }, function (err) {// menambah favorit food ke John
    if(err){
        console.log(err);
    }else{
        console.log("succesfully update the document");
    }
}); 

// const person = new Person({ //sudah ditambahkan dengan buah favorti pineapple
//     name: "Amy",
//     age: 12,
//     favouriteFruit: pineapple
    
// });
// person.save();

//menambahkan data fruit baru
// const kiwi = new Fruit({
//     name:"Kiwi",
//     score: 10,
//     review: "The best fruit"
// });

// const orange = new Fruit({
//     name: "Orange",
//     score: 4,
//     review: "Too sour for me"
// });

// const banana = new Fruit({
//     name: "Banana",
//     score: 3,
//     review: "Weird texture"
// });

// Fruit.insertMany([kiwi, orange, banana], function (err) { 
//     if (err){
//         console.log(err);
//     }else{
//         console.log("succesfully saved all the fruit to fruitDB")
//     }
// });

// Fruit.find(function(err, fruits){ //menampilkan semua data
//     if(err){
//         console.log(err);
//     }else{

        //  mongoose.connection.close();// keluar sendiri pada console tanpa menekan ctrl+c
        
//         fruits.forEach(function(fruit){
//             console.log(fruit.name); //menampilkan nama buah saja pada console
//         })
//     }
// });

// Fruit.updateOne({ _id: "627f1b698576d24539a53e3c"}, {name: "Peach"}, function(err){ //menambah data menggunakan id
//     if(err){
//         console.log(err);
//     }else{
//         console.log("succesfully udpate the document");
//         mongoose.connection.close();// keluar sendiri pada console tanpa menekan ctrl+c
//     }
// });

// Fruit.deleteOne({ _id: "627dbaab692c18590c016c34"}, function(err){
//     if(err){
//         console.log(err);
//     }else{
//         console.log("succesfully delete the document");
//         mongoose.connection.close();// keluar sendiri pada console tanpa menekan ctrl+c
//     }
// });

// Person.deleteMany({name:"John"}, function(err){ //mengahpus semua yang bernama John
//     if(err){
//         console.log(err);
//     }else{
//         console.log("succesfully selete all the document");
//     }
// });