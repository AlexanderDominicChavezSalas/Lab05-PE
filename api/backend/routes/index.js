import express from 'express';

import studentsRouter from './student.route.js';
import coursesRouter from './course.route.js';
import enrollmentsRouter from './enrollment.route.js';
import shiftsRouter from './shift.route.js';
import authsRouter from './auth.route.js';


function routerApi (app){
    const router = express.Router();
    app.use('/api/v1',router); //ruta general de backend
    router.use('/students', studentsRouter); //ruta para los estudientes
    router.use('/courses', coursesRouter); //ruta para los cursos
    router.use('/enrollments', enrollmentsRouter); //ruta para los cursos
    router.use('/shifts', shiftsRouter); //ruta para los turnos
    router.use('/', authsRouter); //ruta para el login/logout
}

export default routerApi;