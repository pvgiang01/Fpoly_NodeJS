// module

var students = [
  {
    id: 1,
    name: "Nguyễn Văn A",
    mobile: "090888888",
    classId: 1,
    dob: "2000-06-20",
    avatar: "https://cdn.tuoitre.vn/zoom/504_315/2021/7/22/2189101775282359019378123875991481275171759n-16269222968301934423727-crop-1626922383928522459632.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 2,
    name: "Nguyễn Văn B",
    mobile: "090888887",
    classId: 2,
    dob: "2000-06-21",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 3,
    name: "Nguyễn Văn C",
    mobile: "090888886",
    classId: 3,
    dob: "2000-06-22",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 4,
    name: "Nguyễn Văn D",
    mobile: "090888885",
    classId: 4,
    dob: "2000-06-23",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 5,
    name: "Nguyễn Văn E",
    mobile: "090888884",
    classId: 1,
    dob: "2000-06-24",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 6,
    name: "Nguyễn Văn F",
    mobile: "090888883",
    classId: 1,
    dob: "2000-06-25",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 7,
    name: "Nguyễn Văn G",
    mobile: "090888882",
    classId: 1,
    dob: "2000-06-26",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 8,
    name: "Nguyễn Văn H",
    mobile: "090888881",
    classId: 1,
    dob: "2000-06-27",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 9,
    name: "Nguyễn Văn P",
    mobile: "090888880",
    classId: 1,
    dob: "2000-06-28",
    avatar: "https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg",
    address: "quận 12, Hồ Chí Minh"
  },
];

const studentModel = require('../models/studentModel')

// select * from students
exports.get = async function getAllStudents() {
  return await studentModel.find();
};

// select * from students where id = ?
exports.getOne = function getOneStudent(id) {
  const student = students.filter((st) => st.id == id)[0] || null;
  return student;
};

// delete students where id = ?
exports.delete = async (id) => {
  await studentModel.remove({_id: id})
};

exports.update = (st) => {
  console.log(st);
  students = students.map(item => item.id == st.id ? 
    {...item, name: st.name, dob: st.dob, mobile: st.mobile, 
      address: st.address, classId: st.classId, 
      avatar: st.avatar ? st.avatar : item.avatar} : 
    item)
}


exports.insert = async (st) => {
  const stu = new studentModel(st)
  await stu.save()
}
