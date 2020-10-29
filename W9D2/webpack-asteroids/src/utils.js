const Util = {

    inherits(ChildClass, ParentClass) {
        ChildClass.prototype = Object.create(ParentClass.prototype);
        ChildClass.prototype.constructor = ChildClass;
    }
};
// ^^ ES6
const Util = {
    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    // Scale the length of a vector by the given amount.
    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
};

// Function.prototype.inherits = function (ParentClass) { 
    
//         function Surrogate() {}
//         Surrogate.prototype = ParentClass.prototype;
//         this.prototype = new Surrogate();
//         this.prototype.constructor = this; 
    
//  };
 // ^^ ES5


module.exports = Util;