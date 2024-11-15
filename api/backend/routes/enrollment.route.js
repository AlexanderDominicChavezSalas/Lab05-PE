import express from 'express';
import enrollmentsController from '../controllers/enrollments.controller.js';
const router = express.Router();

router
    .get('/', enrollmentsController.get)
    .get('/:cui', enrollmentsController.getByCUI)
    .post('/', enrollmentsController.create)
    .delete('/:id', enrollmentsController._delete);

export default router;