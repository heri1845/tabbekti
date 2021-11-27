const express = require('express');
const router = express.Router();
const reportController = require('../controllers/report.controller');
const auth = require('../middleware/auth.middleware');
const awaitHandlerFactory = require('../middleware/awaitHandlerFactory.middleware');


const { validateGrade, validateTopStudent } = require('../middleware/validators/reportValidator.middleware');

router.post('/performance', validateGrade, auth(), awaitHandlerFactory(reportController.performance)); // localhost:3000/api/v1/report/performance
router.post('/top-student', validateTopStudent, auth(), awaitHandlerFactory(reportController.topStudent)); // localhost:3000/api/v1/report/top-student
router.post('/below-average-student', validateGrade, auth(), awaitHandlerFactory(reportController.belowAverageStudent)); // localhost:3000/api/v1/report/below-average-student

module.exports = router;