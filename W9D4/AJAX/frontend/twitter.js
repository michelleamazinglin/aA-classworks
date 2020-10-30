const FollowToggle = require('./follow_toggle');

$( function () {
  $("button.follow-toggle").each(function (index, el) {
    new FollowToggle(el);
  });

})