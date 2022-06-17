const express = require('express');
const {model} = require('mongoose');

let ReporteController = require('../../controllers/relojes/reporte');

let router = express.Router();

router.get('/reportes/relojesReport', ReporteController.productosReport);

module.exports = router;