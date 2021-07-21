const studentService = require("../services/student");

exports.get = () => {
  return studentService.get();
};

exports.getOne = (id) => {
  return studentService.getOne(id);
};

exports.delete = (id) => {
  studentService.delete(id);
};

exports.update = (params, body) => {
  let {id} = params
  let {name, dob, mobile, address, classId} = body
  studentService.update({id, name, dob, mobile, address, classId})
}
