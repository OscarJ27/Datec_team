const express = require('express');
const {model} = require('mongoose');

let ReporteController = require('../../controllers/celulares/reporte');

let router = express.Router();

router.get('/reportes/celularesReport', ReporteController.productosReport);

module.exports = router;
