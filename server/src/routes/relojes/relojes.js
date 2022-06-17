const express = require('express'),
    RelojesController = require('../../controllers/relojes/relojes'),
    router = express.Router();

// Rutas para Relojess
router.get('/relojes', RelojesController.list);
router.get('/relojes/:id', RelojesController.find);
router.post('/relojes/save', RelojesController.save);

module.exports = router;