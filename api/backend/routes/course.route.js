import express from 'express';
import coursesController from '../controllers/courses.controller.js';
const router = express.Router();

router
    .get('/', coursesController.get)
    .get('/:id', coursesController.getById)
    .post('/', coursesController.create)
    .put('/:id', coursesController.update)
    .delete('/:id', coursesController._delete);

export default router;