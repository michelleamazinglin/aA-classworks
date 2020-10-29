function MovingObject(options){
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}

MovingObect.prototype.draw = function draw(ctx) {
    ctx.fillStyle = this.color;

    ctx.beginPath();
    ctx.arc( this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
    ctx.fill();
};

MovingObject.prototype.move = function(pos){


}



module.exports = MovingObject;