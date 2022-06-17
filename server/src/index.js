const  mongoose = require('mongoose');
const app = require('./app');

// Puerto Servidor
const PORT = process.env.port || 3000;

mongoose.connect('mongodb+srv://Grupo07:grupo07@gc22-peg7.wsjye.mongodb.net/?retryWrites=true&w=majority',{
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(()=> {
    console.log('La conexion a la BD es correcta')
    // CREAR EL SERVIDOR
    app.listen(PORT, () => {
        console.log(`Server ruuning on port ${PORT}`);
    });
})
    .catch((err) => console.log(err));





