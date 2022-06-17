const express = require('express'),
    CelularesController = require('../../controllers/celulares/celulares'),
    router = express.Router();

// Rutas para productos
router.get('/celulares', CelularesController.list);
router.get('/celulares/:id', CelularesController.find);
router.post('/celulares/save', CelularesController.save);

module.exports = router;