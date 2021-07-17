// module

const students = [
  {
    id: 1,
    name: "Nguyễn Văn A",
    mobile: "090888888",
    classId: 1,
    dob: "2000-06-20",
    avatar: "",
  },
  {
    id: 2,
    name: "Nguyễn Văn B",
    mobile: "090888887",
    classId: 1,
    dob: "2000-06-21",
    avatar: "",
  },
  {
    id: 3,
    name: "Nguyễn Văn C",
    mobile: "090888886",
    classId: 1,
    dob: "2000-06-22",
    avatar: "",
  },
  {
    id: 4,
    name: "Nguyễn Văn D",
    mobile: "090888885",
    classId: 1,
    dob: "2000-06-23",
    avatar: "",
  },
  {
    id: 5,
    name: "Nguyễn Văn E",
    mobile: "090888884",
    classId: 1,
    dob: "2000-06-24",
    avatar: "",
  },
  {
    id: 6,
    name: "Nguyễn Văn F",
    mobile: "090888883",
    classId: 1,
    dob: "2000-06-25",
    avatar: "",
  },
  {
    id: 7,
    name: "Nguyễn Văn G",
    mobile: "090888882",
    classId: 1,
    dob: "2000-06-26",
    avatar: "",
  },
  {
    id: 8,
    name: "Nguyễn Văn H",
    mobile: "090888881",
    classId: 1,
    dob: "2000-06-27",
    avatar: "",
  },
  {
    id: 9,
    name: "Nguyễn Văn P",
    mobile: "090888880",
    classId: 1,
    dob: "2000-06-28",
    avatar: "",
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
