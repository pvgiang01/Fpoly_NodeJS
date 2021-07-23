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

exports.insert = (body) => {
  const uuid =  () => {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }
  let id = uuid()
  let {name, dob, mobile, address, classId} = body
  studentService.insert({id, name, dob, mobile, address, classId})
}


