import { models } from '../libs/sequelize.js';

class AuthService {
    constructor() {}

    async login(data) {
        try {
            const { email, password } = data;
            const student = await models.Student.findOne({
                where: {
                    email: email, password: password 
                }
            });
            if (!student) {
                return {
                name: "credenciales incorrectas",
                email: "credenciales incorrectas",
                cui: "credenciales incorrectas",
                    success: false, status: 401, message: "credenciales incorrectas"
                };
            }
            
            return {
                id: student.id,
                name: student.name,
                email: student.email,
                cui: student.cui,
                success:true, status: 200, message: "Login successful"};
        } catch (error) {
            console.log("Error in login service: ", error.message);
            return { status: 500, error: "Error in login service: " + error.message };
        }
    }
}

export default AuthService;
