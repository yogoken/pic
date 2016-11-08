$(function() {
  var userMenuOpenTrigger = $('#user-header-image');
  var userBack = $('#user-back');
  var userCloseTrigger = $('#user-back-close');
  var user_info = $('#user-menu-container');

  userMenuOpenTrigger.on('click', function() {
    userBack.css('visibility', 'visible');
    user_info.css('display', 'block');
  });

  userCloseTrigger.on("click", function() {
    userBack.css("visibility", "hidden");
    user_info.css("display", "none");
  });
});
