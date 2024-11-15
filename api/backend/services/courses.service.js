import { models } from '../libs/sequelize.js';

class CoursesService{
    constructor(){}
    async find() {
        const res = await models.Course.findAll({
            include: [
                {
                    model: models.Shift,
                    as: 'shift',
                    attributes: ['teacher','schedule','letter'] // Solo el nombre del docente
                }
            ]
        });
        return res;
    }

    async findOne(id){
        const res = await models.Course.findByPk(id, {
            include: [
                {
                    model: models.Shift,
                    as: 'shift',
                    attributes: ['schedule'] 
                }
            ]
        });        
        if (!res) {
            return null;
        }
        return res;
    }
    async create(data) {
        const res = await models.Course.create(data);
        return res;
    }
    async update(id, data) {
        const model = await models.Course.findByPk(id);
        if (!model) {
            return null;
        }
        const res = await model.update(data);
        return res;
        
    }
    async delete(id){
        const model = await models.Course.findByPk(id);
        await model.destroy();
        return { deleted: true };
    }
}

export default CoursesService;