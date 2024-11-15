import { models } from '../libs/sequelize.js';

class EnrollmentsService{
    constructor(){}
    async find(){
        const res = await models.Enrollment.findAll();
        return res;
    }
    async findByCui(cui) {
        const res = await models.Enrollment.findAll({
            where: { studentCUI: cui },
            include: [
                {
                    model: models.Course,
                    as: 'course',
                    attributes: ['id','name','code','description','vacancies'], // Atributo del nombre del curso
                    include: [
                        {
                            model: models.Shift,
                            as: 'shift',
                            attributes: ['id','teacher','schedule','letter'], // Atributo del nombre del docente
                        }
                    ]
                }
            ]
        });

        if (!res) {
            return null;
        }
        return res;
    }


    async create(data) {
        try {
            // Crea la matrícula (enrollment)
            const enrollment = await models.Enrollment.create(data);

            // Disminuye las vacantes del curso en 1
            const course = await models.Course.findByPk(data.courseId);
            if (!course) {
                throw new Error('Curso no encontrado');
            }
            if (course.vacancies <= 0) {
                throw new Error('No hay vacantes disponibles');
            }

            // Actualiza las vacantes directamente
            await course.update({ vacancies: course.vacancies - 1 });

            return enrollment;
        } catch (error) {
            console.error('Error al crear la matrícula:', error.message);
            throw error;
        }
    }

    async update(id, data) {
        const model = await models.Enrollment.findByPk(id);
        if (!model) {
            return null;
        }
        const res = await model.update(data);
        return res;
        
    }
    async delete(id){
        const model = await models.Enrollment.findByPk(id);
        // AUmenta las vacantes del curso en 1
        const course = await models.Course.findByPk(model.courseId);
        if (!course) {
            throw new Error('Curso no encontrado');
        }
        if (course.vacancies <= 0) {
            throw new Error('No hay vacantes disponibles');
        }
        // Actualiza las vacantes directamente
        await course.update({ vacancies: course.vacancies + 1 });
        await model.destroy();
        return { deleted: true };
    }
}

export default EnrollmentsService;