const { body } = require('express-validator');
const Role = require('../../utils/userRoles.utils');


exports.validateGrade = [
    body('grade')
        .exists()
        .withMessage('grade is required')
        .isNumeric()
        .withMessage('Must be a number')
];

exports.validateTopStudent = [
    body('grade')
        .exists()
        .withMessage('grade is required')
        .isNumeric()
        .withMessage('Must be a number'),
    body('limit')
        .optional()
        .isNumeric()
        .withMessage('Must be a number')
];
