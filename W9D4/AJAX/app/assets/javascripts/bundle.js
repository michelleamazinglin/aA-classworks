/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/*! CommonJS bailout: module.exports is used directly at 36:0-14 */
/***/ ((module) => {

class FollowToggle {
    //option hash
  constructor(el, options) {   //we pass in a regular DOM HTML element
    this.$el = $(el); //JQUERY
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
    //we bind handleClick so when we click this refers to FollerToggle instence not the button itself.
    //info out of user id
    //info out of initial follow state
  }

  render(){
      if (this.followState === "unfollowed") {
          this.$el.text("Follow!")
      } else {
        this.$el.text("Unfollow!")
      }
  }

  
  handleClick(event){
    event.preventDefault();
    if (this.followState === 'unfollowed') {
        this.followState = "follow";
        this.render();
    } else {
        this.followState = "unfollow";
        this.render();
    }
  }

}

module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$( function () {
  $("button.follow-toggle").each(function (index, el) {
    new FollowToggle(el);
  });

})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map