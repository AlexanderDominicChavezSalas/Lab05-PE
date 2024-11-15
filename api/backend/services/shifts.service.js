import { models } from '../libs/sequelize.js';

class ShiftsService{
    constructor(){}
    async find(){
        const res = await models.Shift.findAll();
        return res;
    }
    async findOne(id){
        const res = await models.Shift.findByPk(id);
        if (!res) {
            return null;
        }
        return res;
    }
    async create(data) {
        const res = await models.Shift.create(data);
        return res;
    }
    async update(id, data) {
        const model = await models.Shift.findByPk(id);
        if (!model) {
            return null;
        }
        const res = await model.update(data);
        return res;
        
    }
    async delete(id){
        const model = await models.Shift.findByPk(id);
        await model.destroy();
        return { deleted: true };
    }
}

export default ShiftsService;