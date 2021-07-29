const studentService = require("../services/student");

exports.get = async () => {
  return await studentService.get();
};

exports.getOne = (id) => {
  return studentService.getOne(id);
};

exports.delete = async (id) => {
  await studentService.delete(id);
};

exports.update = (params, body) => {
  let {id} = params
  let {name, dob, mobile, address, classId, avatar} = body
  studentService.update({id, name, dob, mobile, address, classId, avatar})
}

exports.insert = async (body) => {  
  let {name, dob, mobile, address, classId, avatar} = body
  await studentService.insert({name, dob, mobile, address, classId, avatar})
}


