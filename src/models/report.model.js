const query = require('../db/db-connection');
const { multipleColumnSet } = require('../utils/common.utils');
const Role = require('../utils/userRoles.utils');

class ReportModel {
    tableReportName = 'report';
    tableStudentName = 'students';
    tableSubjectName = 'subjects';
    tableChapterName = 'chapters';

    getPerformance = async (params) => {
        let sql = `SELECT 
            ${this.tableStudentName}.id, 
            ${this.tableStudentName}.name, 
            ${this.tableStudentName}.grade, 
            ${this.tableReportName}.subject_id, 
            ${this.tableSubjectName}.subject_name, 
            AVG(${this.tableReportName}.score) as score, 
            (SELECT AVG(rpt.score) as avgscore FROM report rpt WHERE rpt.grade = students.grade AND rpt.subject_id = report.subject_id group by rpt.subject_id ) as avgScore
            FROM ${this.tableStudentName} 
            LEFT JOIN ${this.tableReportName} ON ${this.tableReportName}.student_id = ${this.tableStudentName}.id 
            LEFT JOIN ${this.tableSubjectName} ON ${this.tableSubjectName}.id = ${this.tableReportName}.subject_id 
            WHERE ${this.tableStudentName}.grade = ${params.grade} `;
        
        if (params.student_id !== undefined){
            sql += `AND ${this.tableReportName}.student_id = ${params.student_id} `;
        }
        sql += `GROUP BY ${this.tableStudentName}.id, ${this.tableReportName}.subject_id`;

        const result = await query(sql);
        
        return result;
    }

    getTopStudent = async (params) => {
        const sql = `SELECT t.student_id, ${this.tableStudentName}.name, t.grade,  
            SUM(case when t.score >= t.avgScore then 1 else -1 end) as point
            FROM 
                (SELECT student_id, grade, subject_id, 
                    AVG(${this.tableReportName}.score) as score, 
                    (SELECT AVG(rpt.score) FROM ${this.tableReportName} rpt WHERE rpt.grade = ${this.tableReportName}.grade AND rpt.subject_id = ${this.tableReportName}.subject_id group by rpt.subject_id ) as avgScore
                    FROM ${this.tableReportName} 
                    WHERE grade = ${params.grade} 
                    GROUP BY student_id, subject_id
                ) t
            LEFT JOIN ${this.tableStudentName} ON ${this.tableStudentName}.id = t.student_id
            GROUP BY t.student_id 
            ORDER BY point DESC 
            LIMIT ${params.limit}`;

        const result = await query(sql);

        return result;
    }

    getBelowAverageStudent = async (params) => {
        const sql = `SELECT t.student_id, ${this.tableStudentName}.name, t.grade, t.subject_id, ${this.tableSubjectName}.subject_name, t.score, t.avgScore
            FROM 
                (SELECT student_id, grade, subject_id, 
                    AVG(${this.tableReportName}.score) as score, 
                    (SELECT AVG(rpt.score) FROM ${this.tableReportName} rpt WHERE rpt.grade = ${this.tableReportName}.grade AND rpt.subject_id = ${this.tableReportName}.subject_id group by rpt.subject_id ) as avgScore
                    FROM ${this.tableReportName} 
                    where grade = ${params.grade} 
                    group by student_id, subject_id
                ) t
            LEFT JOIN ${this.tableStudentName} ON ${this.tableStudentName}.id = t.student_id 
            LEFT JOIN ${this.tableSubjectName} ON ${this.tableSubjectName}.id = t.subject_id 
            WHERE t.score < t.avgScore
            group by t.student_id, t.subject_id
            order by t.student_id ASC`;

        const result = await query(sql);

        return result;
    }

}

module.exports = new ReportModel;