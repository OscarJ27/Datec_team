const express = require('express');
const {model} = require('mongoose');

let ReporteController = require('../../controllers/impresoras/reporte');

let router = express.Router();

router.get('/reportes/impresorasReport', ReporteController.productosReport);

module.exports = router;
