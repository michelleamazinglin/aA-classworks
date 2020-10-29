const AllPos = {
  0: { pos: [0, 0] },
  1: { pos: [0, 1] },
  2: { pos: [0, 2] },
  3: { pos: [1, 0] },
  4: { pos: [1, 1] },
  5: { pos: [1, 2] },
  6: { pos: [2, 0] },
  7: { pos: [2, 1] },
  8: { pos: [2, 2] }
} // $newLi.data({allPos[0]})


class View {
  //$el is the jquery object
  constructor(game, $el) {
    this.game = game;
    // debugger;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  
  }
//lost context when jump to new method, callback
  bindEvents() {
    let boundPlayMove = this.game.playMove.bind(this.game);
                              //or event =>
    $('ul').on("click", 'li', function (event) {
      let $currentItem = $(event.target);
      console.log(`${$currentItem.data("pos")}`);
      // debugger;
      // this.game.playMove($currentItem.data("pos"));
      boundPlayMove($currentItem.data("pos"));
    })//or .bind(this);

  }
  //"pos" here is a key we set in line 62. it has to match
  //data(); will show what i set as objects. data will show all the data in an object(ugly)

  makeMove($square) {

  }


  setupBoard() {
    let $ulmain = $("<ul></ul>");
    ($ulmain).css("display","flex"); //setting the flex
    ($ulmain).css("width", "600");
    ($ulmain).css("height", "600");
    ($ulmain).css("flex-wrap", "wrap");
    ($ulmain).css('border', '10px solid pink');
    ($ulmain).css("padding-inline-start", 0);
    //move this to css later

    

    //document.getElementById("myBtn").addEventListener("click", displayDate);
    //$(selector).hover(handlerIn, handlerOut)
    
    for (let i = 0; i < 9; i++) {
      let $newli = $("<li></li>");
      ($newli).css("box-sizing", "border-box");
      ($newli).css("border","3px solid pink");
      ($newli).css("background-color","turquoise");
      ($newli).css("width","200");
      ($newli).css("height", "200");
      ($newli).css("display","block");
      // let iTOS = i.toString();
      ($newli).data("pos", AllPos[i].pos);

      
      $newli.text("text")
      // $("div.demo-container").text("<p>This is a test.</p>");
      $ulmain.append($newli);
    }
    this.$el.append($ulmain);



    $('ul').on("mouseover", 'li', function (event){
        let $currentItem = $(event.target);
        if ($currentItem.is('li')) {
          $currentItem.css("background-color", "yellow");
        }
    });

    $('ul').on("mouseout", 'li', function (event){
      let $currentItem = $(event.target);
      if ($currentItem.is('li')) {
        $currentItem.css("background-color", "turquoise");
      }
    })



  }
}

module.exports = View;
