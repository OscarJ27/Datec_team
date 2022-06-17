let express = require('express');
const { model } = require('mongoose');

let MetodoController = require('../../controllers/payment/metodos');

let router = express.Router();

//RUTAS PARA PRODUCTOS
router.get('/metodos', MetodoController.list);
router.get('/metodos/:id', MetodoController.find);
router.post('/metodos/save', MetodoController.save);

//EXPORTAR RUTA
module.exports = router;