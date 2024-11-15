import { Student, StudentSchema } from './students.model.js';
import { Shift, ShiftSchema } from './shifts.model.js';
import { Course, CourseSchema } from './courses.model.js';
import { Enrollment, EnrollmentSchema } from './enrollments.model.js';



function setupModels(sequelize) {
    Student.init(StudentSchema, Student.config(sequelize));
    Shift.init(ShiftSchema, Shift.config(sequelize));
    Course.init(CourseSchema, Course.config(sequelize));
    Enrollment.init(EnrollmentSchema, Enrollment.config(sequelize));   
    Enrollment.belongsTo(Course, { foreignKey: 'courseId', as: 'course' });
    Course.belongsTo(Shift, { foreignKey: 'shiftId', as: 'shift' });

    
}

export default setupModels;
