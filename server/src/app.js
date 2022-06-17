// Requires
const  express = require('express');

// Usando express
const app = express();

// Carga de archivos de rutas
let producto_routes = require('./routes/computadoras/computadoras');
let metodo_route = require('./routes/payment/metodos')
let reporte_routes = require('./routes/computadoras/com_reporte');
let producto_popular_routes = require('./routes/populares/populares');
let impresoras_routes = require('./routes/impresoras/impresoras');
let impresorasReport = require('./routes/impresoras/reporte');
let relojes_routes = require('./routes/relojes/relojes');
let relojesReport= require('./routes/relojes/reporte');
let celulares_routes = require('./routes/celulares/celulares');
let celularesReport =require('./routes/celulares/reporte');
let televisor_routes = require('./routes/televisores/televisor');
let reporte_tele_routes = require('./routes/televisores/tele_reporte');

// Middlewares
app.use(express.urlencoded({extended: true}));
app.use(express.json());

// Configuración de cabezas y cors
app.use((req,res, next)=>{
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    req.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow, GET, POST, OPTIONS, PUT, DELETE');
    next();
});

// Reescribir Rutas
app.use('/api', producto_routes);
app.use('/api', metodo_route);
app.use('/api', reporte_routes);
app.use('/api', producto_popular_routes)
app.use('/api', impresoras_routes);
app.use('/api', impresorasReport);
app.use('/api', relojes_routes);
app.use('/api', relojesReport);
app.use('/api', celulares_routes);
app.use('/api', celularesReport);
app.use('/api', televisor_routes);
app.use('/api', reporte_tele_routes);

// Exportar Modulo
module.exports = app;
