import { Model, DataTypes } from 'sequelize';

const STUDENT_TABLE = 'student';

class Student extends Model {
    static config(sequelize) {
        return {
            sequelize,
            tableName: STUDENT_TABLE,
            modelName: 'Student',
            timestamps: false
        };
    }
}

const StudentSchema = {
    id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER
    },
    name: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'name'
    },
    cui: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'cui',
        unique: true
    },
    email: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'email',
        unique: true
    },
    password: {
        allowNull: true,
        type: DataTypes.STRING,
        field: 'password'
    }
};

export { Student, StudentSchema };
