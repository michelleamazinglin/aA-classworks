const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', function() {
    const canvasElement = document.getElementById("game-canvas");
    canvasElement.width = Game.DIM_X;
    canvasElement.height = Game.DIM_Y;

    const ctx = canvasElement.getContext("2d");
});