import express from 'express';
import studentsController from '../controllers/students.controller.js';
const router = express.Router();

router
    .get('/', studentsController.get)
    .get('/:id', studentsController.getById)
    .post('/', studentsController.create)
    .put('/:id', studentsController.update)
    .delete('/:id', studentsController._delete);

export default router;