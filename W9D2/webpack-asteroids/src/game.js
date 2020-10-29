const Asteroid = require("./asteroid");
const Bullet = require("./bullet");
const Ship = require("./ship");
const Util = require("./util");

function Game() {
    this.asteroids = [];
    this.bullets = [];
    this.ships = [];

    this.addAsteroids();
}

Game.BG_COLOR = "blue";
Game.DIM_X = 1000;
Game.DIM_Y = 1000;
Game.NUM_ASTEROIDS = 5;

Game.prototype.addAsteroids = function addAsteroids() {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++ ) {
        this.addAsteroids(new Asteroid({game: this}));
    }
};