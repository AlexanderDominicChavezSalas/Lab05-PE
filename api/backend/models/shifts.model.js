import { Model, DataTypes } from 'sequelize';

const SHIFT_TABLE = 'shift';

class Shift extends Model {
    static config(sequelize) {
        return {
            sequelize,
            tableName: SHIFT_TABLE,
            modelName: 'Shift',
            timestamps: false
        };
    }
}

const ShiftSchema = {
    id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER
    },
    teacher: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'teacher'
    },
    schedule: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'schedule'
    },
    letter: {
        allowNull: false,
        type: DataTypes.STRING,
        field: 'letter'
    }
};

export { Shift, ShiftSchema };