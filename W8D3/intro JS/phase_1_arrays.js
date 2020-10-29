Array.prototype.uniq = function(){
    let res = [];
    for (let i = 0; i < this.length; i++){
        if (!res.includes(this[i])) {
            res.push(this[i]);
        }
    }
    return res;
};


Array.prototype.twoSum = function(){
   
    let res = [];
    for (let i = 0; i < this.length - 1; i++){
        for (let j = (i + 1); j < this.length; j++){
            if (this[i] + this[j] === 0) {
                res.push([i, j]);
            }
        }
    }
    return res;
};

Array.prototype.transpose = function(){
    let row = this.length;
    let col = this[0].length;
    let transpose = new Array(col);
   // [[1,2],
   //  [3,4],
   //  [5,6]]
   // [[1,3,5],
   //  [2,4,6]]
    for (let i = 0; i < col; i++){
        transpose[i] = new Array(row);
    }

    for (let i = 0; i < row; i++){
        for (let j = 0; j < col; j++){
            transpose[j][i] = this[i][j];
        }
    }
    return transpose;
};


