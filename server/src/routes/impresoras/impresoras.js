const express = require('express'),
    ProductoController = require('../../controllers/impresoras/impresoras'),
    router = express.Router();

// Rutas para productos
router.get('/impresoras', ProductoController.list);
router.get('/impresoras/:id', ProductoController.find);
router.post('/impresoras/save', ProductoController.save);

module.exports = router;