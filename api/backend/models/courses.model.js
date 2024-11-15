import { Model, DataTypes } from 'sequelize';

const COURSE_TABLE = 'course';

class Course extends Model {
    static config(sequelize) {
        return {
            sequelize,
            tableName: COURSE_TABLE,
            modelName: 'Course',
            timestamps: false
        };
    }
}

const CourseSchema = {
    id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER
    },
    code: {
        allowNull: false,
        type: DataTypes.STRING,
        unique: true,
        field: 'code'
    },
    name: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'name'
    },
    shiftId: {
        allowNull: false,
        type: DataTypes.INTEGER,
        field: 'shift_id',
        references: {
            model: 'shift',
            key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL'
    },
    description: {
        allowNull: true,
        type: DataTypes.TEXT,
        field: 'description'
    },
    vacancies: {
        allowNull: false,
        type: DataTypes.INTEGER,
        field: 'cavancies'
    }
};

export { Course, CourseSchema };