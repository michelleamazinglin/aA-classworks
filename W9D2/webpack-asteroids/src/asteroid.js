const MovingObject = require("./moving_object");
const Util = require("./utils")

const DEFAULTS = {
    COLOR: "red"
    RADIUS: 25,
    SPEED: 1
}

function Asteroid(options){
    options = options || {};
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;
    options.pos = options.pos;
    options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);

    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject); 


module.exports = Asteroid; 