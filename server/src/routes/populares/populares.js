const express = require('express'),
    ProductoController = require('../../controllers/populares/populares'),
    router = express.Router();

// Rutas para productos
router.get('/Pproductos', ProductoController.list);
router.get('/Pproductos/:id', ProductoController.find);
router.post('/Pproductos/save', ProductoController.save);

module.exports = router;
