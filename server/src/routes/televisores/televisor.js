const express = require('express'),
    TelevisorController = require('../../controllers/televisores/televisor'),
    router = express.Router();

// Rutas para televisor
router.get('/televisor', TelevisorController.list);
router.get('/televisor/:id', TelevisorController.find);
router.post('/televisor/save', TelevisorController.save);

module.exports = router;

