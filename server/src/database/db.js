const  {MongoClient} = require("mongodb");
const  client = new  MongoClient('mongodb+srv://Grupo07:grupo07@gc22-peg7.wsjye.mongodb.net/?retryWrites=true&w=majority');

client.connect().then(
    (response) =>{
        console.log('La conexión a la BD es correcta - url:' + response.url);
    },
    (err) =>{
        console.log('Error: '+ err)
    }
)

module.exports = client;