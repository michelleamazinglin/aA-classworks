const View = require("./ttt-view.js");
const Game = require("./game.js");

  $(() => {
    // Your code here
    //we can create a new Game with new Game().
    let game = new Game();
    
    //Let's create our View and Game objects in the entry point (src/index.js).
     //class ttt <= in HTML
     let $el = $('.ttt');
    //  debugger;
     let view = new View(game, $el);
  });
