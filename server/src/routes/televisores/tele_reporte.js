const express = require('express');
const {model} = require('mongoose');

let ReporteController = require('../../controllers/televisores/tele_reporte');

let router = express.Router();

router.get('/reportes/televisorReport', ReporteController.televisorReport);

module.exports = router;

