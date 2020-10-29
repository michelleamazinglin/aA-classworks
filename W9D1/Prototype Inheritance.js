// Function.prototype.inherits = function (ParentClass) {
//     function Surrogate () {};
//     Surrogate.prototype = ParentClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };

Function.prototype.inherits = function(ParentClass) {
    this.prototype = Object.create(ParentClass.prototype);
    this.prototype.constructor = this;
}

function MovingObject() { };

function Ship(name) {
    this.name = name;
}
Ship.inherits(MovingObject);

function Asteroid(name) {
    this.name = name;
}
Asteroid.inherits(MovingObject);

// MovingObject.prototype.move = function () {
//     console.log('I am moving');
// }

MovingObject.prototype.move = function() {
    console.log(`${this.name} is moving`);
}

obj1 = new MovingObject();
// obj1.move();

Ship.prototype.takeOff = function() {
    console.log('Take off!');
}

ship1 = new Ship("ship1");
asteroid1 = new Asteroid("asteroid1");
ship1.move();
asteroid1.move();
ship1.takeOff();
// obj1.takeOff();