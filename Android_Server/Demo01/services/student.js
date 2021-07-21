// module

var students = [
  {
    id: 1,
    name: "Nguyễn Văn A",
    mobile: "090888888",
    classId: 1,
    dob: "2000-06-20",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 2,
    name: "Nguyễn Văn B",
    mobile: "090888887",
    classId: 2,
    dob: "2000-06-21",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 3,
    name: "Nguyễn Văn C",
    mobile: "090888886",
    classId: 3,
    dob: "2000-06-22",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 4,
    name: "Nguyễn Văn D",
    mobile: "090888885",
    classId: 4,
    dob: "2000-06-23",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 5,
    name: "Nguyễn Văn E",
    mobile: "090888884",
    classId: 1,
    dob: "2000-06-24",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 6,
    name: "Nguyễn Văn F",
    mobile: "090888883",
    classId: 1,
    dob: "2000-06-25",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 7,
    name: "Nguyễn Văn G",
    mobile: "090888882",
    classId: 1,
    dob: "2000-06-26",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 8,
    name: "Nguyễn Văn H",
    mobile: "090888881",
    classId: 1,
    dob: "2000-06-27",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
  {
    id: 9,
    name: "Nguyễn Văn P",
    mobile: "090888880",
    classId: 1,
    dob: "2000-06-28",
    avatar: "",
    address: "quận 12, Hồ Chí Minh"
  },
];

// select * from students
exports.get = function getAllStudents() {
  return students;
};

// select * from students where id = ?
exports.getOne = function getOneStudent(id) {
  const student = students.filter((st) => st.id == id)[0] || null;
  return student;
};

// delete students where id = ?
exports.delete = (id) => {
  students = students.filter((st) => st.id != id);
};

exports.update = (st) => {
  students = students.map(item => item.id == st.id ? 
    {...item, name: st.name, dob: st.dob, mobile: st.mobile, 
      address: st.address, classId: st.classId} : 
    item)
}

