import { Model, DataTypes } from 'sequelize';

const ENROLLMENT_TABLE = 'enrollment';

class Enrollment extends Model {
    static config(sequelize) {
        return {
            sequelize,
            tableName: ENROLLMENT_TABLE,
            modelName: 'Enrollment',
            timestamps: false
        };
    }
}

const EnrollmentSchema = {
    id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER
    },
    studentId: {
        allowNull: false,
        type: DataTypes.INTEGER,
        field: 'student_id',
        references: {
            model: 'student',
            key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL'
    },
    studentCUI: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'student_cui',
        references: {
            model: 'student',
            key: 'cui'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL'
    },
    courseId: {
        allowNull: false,
        type: DataTypes.INTEGER,
        field: 'course_id',
        references: {
            model: 'course',
            key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL'
    }
};

export { Enrollment, EnrollmentSchema };