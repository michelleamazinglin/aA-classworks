const ELES = [1,2,3]
Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
   
}

ELES.myEach ((ele) => {
    console.log(`${ele}`);
});
// Array.prototype.each = function(callback){
//     array = [];
//     for (let i = 0; i < this.length; i++){
//         ele = callback(this[i]);
//         array.this.push(ele);
//     }
//     return array;
// }


Array.prototype.myMap = function(callback) {
    let mapped = [];
    this.myEach(ele => {
        mapped.push(callback(ele));
    });
    return mapped;
};
console.log(ELES.myMap( ele => ele ));






Array.prototype.myReduce = function (acc) {

    let res = acc(this[0]);

    for (let i = 1; i < this.length; i++){
        this[i].myEach(ele => res = callback(res, ele));
    }

    return res;
};


// // without initialValue
// [1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
//   } ); // => 6
  
// // with initialValue
// [1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
//   }, 25); // => 31