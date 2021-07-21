
var clazz = [
    {id: 1, name: 'LT123'},
    {id: 2, name: 'LT122'},
    {id: 3, name: 'LT124'},
    {id: 4, name: 'LT125'},
    {id: 5, name: 'LT126'},
    {id: 6, name: 'LT127'}
]

// select * from clazz
exports.get = function () {
    return clazz;
};