const express = require('express');
const {model} = require('mongoose');

let ReporteController = require('../../controllers/computadoras/com_reporte');

let router = express.Router();

router.get('/reportes/computoReport', ReporteController.productosReport);

module.exports = router;

