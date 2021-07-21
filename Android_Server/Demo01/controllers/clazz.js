const clazzService = require("../services/clazz");

exports.get = () => {
  return clazzService.get();
};