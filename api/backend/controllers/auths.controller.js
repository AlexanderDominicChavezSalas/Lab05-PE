import AuthService from '../services/auths.service.js';

const service = new AuthService();

const login = async (req, res) => {
    try {
        const response = await service.login(req.body);
        res.status(response.status).json(response);
    } catch (error) {
        res.status(500).send({ success: false, message: error.message });
    }
};


export default {
    login
};

