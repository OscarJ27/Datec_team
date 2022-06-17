const express = require('express'),
    ProductoController = require('../../controllers/computadoras/computadoras'),
    router = express.Router();

// Rutas para productos
router.get('/computo', ProductoController.list);
router.get('/computo/:id', ProductoController.find);
router.post('/computo/save', ProductoController.save);

module.exports = router;

