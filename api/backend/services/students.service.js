import { models } from '../libs/sequelize.js';

class StudentsService{
    constructor(){}
    async find(){
        const res = await models.Student.findAll();
        return res;
    }
    async findOne(id){
        const res = await models.Student.findByPk(id);
        if (!res) {
            return null;
        }
        return res;
    }
    async create(data) {
        const res = await models.Student.create(data);
        return res;
    }
    async update(id, data) {
        const model = await models.Student.findByPk(id);
        if (!model) {
            return null;
        }
        const res = await model.update(data);
        return res;
        
    }
    async delete(id){
        const model = await models.Student.findByPk(id);
        await model.destroy();
        return { deleted: true };
    }
}

export default StudentsService;