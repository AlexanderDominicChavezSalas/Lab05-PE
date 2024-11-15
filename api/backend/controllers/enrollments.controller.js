import EnrollmentsService from '../services/enrollments.service.js';
const service = new EnrollmentsService();

const create = async (req, res) => {
    try {
        const response = await service.create(req.body);
        res.json({ success: true, data: response });
    } catch (error) {
        res.status(500).send({ success: false, message: error.message });
    }
};
const get = async (req,res) => {
    try{
        const response = await service.find();
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
const getByCUI = async (req,res) => {
    try{
        const { cui }=req.params;
        const response = await service.findByCui(cui);
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}

const _delete = async (req,res) => {
    try{
        const { id }=req.params;
        const response = await service.delete(id);
        res.json(response);
    }catch(error){
        res.status(500).send({sucess: false, message: error.message});
    }
}
export default {
    create,get,getByCUI,_delete
};