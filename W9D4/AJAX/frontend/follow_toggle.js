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