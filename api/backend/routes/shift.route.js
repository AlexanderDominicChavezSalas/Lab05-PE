import express from 'express';
import shiftsController from '../controllers/shifts.controller.js';
const router = express.Router();

router
    .get('/', shiftsController.get)
    .get('/:id', shiftsController.getById)
    .post('/', shiftsController.create)
    .put('/:id', shiftsController.update)
    .delete('/:id', shiftsController._delete);

export default router;