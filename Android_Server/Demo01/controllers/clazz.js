const clazzService = require("../services/clazz");

exports.get = async () => {
  return await clazzService.get();
};