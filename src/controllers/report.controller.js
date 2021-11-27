const ReportModel = require('../models/report.model');
const UserModel = require('../models/user.model');
const HttpException = require('../utils/HttpException.utils');
const { validationResult } = require('express-validator');

/******************************************************************************
 *                              Report Controller
 ******************************************************************************/
class ReportController {

    performance = async (req, res, next) => {
        const { password, ...userWithoutPassword } = req.currentUser;
        var student_id;
        if (userWithoutPassword.role == 'Teacher'){
            var { grade } = req.body;
            this.checkValidation(req);
        } else {
            const student = await UserModel.student({ user_id: userWithoutPassword.id });
            var grade = student.grade;
            student_id = student.id;
        }
        
        const rows = await ReportModel.getPerformance({ grade: grade, student_id: student_id });
        
        if (!rows.length) {
            throw new HttpException(404, 'Performances not found');
        }

        const container = {};
        Object.keys(rows).forEach(function(element, key, _array) {
            var row = rows[key];
            var student_id = row['id'];
            if(student_id in container == false){
                container[student_id] = {
                    'student_id': student_id,
                    'name': row['name'],
                    'grade': row['grade'],
                    'performances': []
                }; 
            }
            
            container[student_id]['performances'].push({
                'subject_id': row['subject_id'],
                'subject_name': row['subject_name'],
                'score': row['score'],
                'avg': row['avgScore']
            });

        });

        const orderedContainer = Object.keys(container).sort().reduce(
            (obj, key) => { 
                obj[(key-1)] = container[key]; 
                return obj;
            }, 
            {}
        );
        
          
        res.send(orderedContainer);
    };

    topStudent = async (req, res, next) => {
        const { grade, limit } = req.body;

        const { password, ...userWithoutPassword } = req.currentUser;
        this.checkValidation(req);

        if (userWithoutPassword.role == 'Student'){
            throw new HttpException(403, 'Forbidden');
        }

        const rows = await ReportModel.getTopStudent({ grade: grade, limit: limit });
        if (!rows.length) {
            throw new HttpException(404, 'Top Students not found');
        }

        const container = {};
        Object.keys(rows).forEach(function(element, key, _array) {
            var row = rows[key];
            var student_id = row['id'];
            container[key] = {
                'student_id': student_id,
                'name': row['name'],
                'grade': row['grade'],
                'point': row['point']
            }; 

        });

        res.send(container);
    };

    belowAverageStudent = async (req, res, next) => {
        const { grade } = req.body;

        const { password, ...userWithoutPassword } = req.currentUser;
        this.checkValidation(req);

        if (userWithoutPassword.role == 'Student'){
            throw new HttpException(403, 'Forbidden');
        }

        const rows = await ReportModel.getBelowAverageStudent({ grade: grade });
        if (!rows.length) {
            throw new HttpException(404, 'Below Average Students not found');
        }

        const container = {};
        Object.keys(rows).forEach(function(element, key, _array) {
            var row = rows[key];
            var student_id = row['student_id'];
            if(student_id in container == false){
                container[student_id] = {
                    'student_id': student_id,
                    'name': row['name'],
                    'grade': row['grade'],
                    'performances': []
                }; 
            }
            
            container[student_id]['performances'].push({
                'subject_id': row['subject_id'],
                'subject_name': row['subject_name'],
                'score': row['score'],
                'avg': row['avgScore']
            });
        });

        const orderedContainer = Object.keys(container).sort().reduce(
            (obj, key) => { 
                obj[(key-1)] = container[key]; 
                return obj;
            }, 
            {}
        );
        
          
        res.send(orderedContainer);
    };

    checkValidation = (req) => {
        const errors = validationResult(req)
        if (!errors.isEmpty()) {
            throw new HttpException(400, 'Validation failed', errors);
        }
    }
}



/******************************************************************************
 *                               Export
 ******************************************************************************/
module.exports = new ReportController;