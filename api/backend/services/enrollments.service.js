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
        const res = await models.Enrollment.create(data);
        return res;
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
        await model.destroy();
        return { deleted: true };
    }
}

export default EnrollmentsService;