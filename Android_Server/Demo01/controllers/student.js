const studentService = require('../services/student')



exports.get = function getAllStudents() {
    return studentService.get()
}