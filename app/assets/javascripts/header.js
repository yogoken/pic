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

  var storageMenuOpenTrigger = $("#user-storages");
  var storageBack = $("#storage-back")
  var storageCloseTrigger = $("#storage-back-close");
  var letters = $("#storage-letters");

  storageMenuOpenTrigger.on("click", function() {
    storageBack.css("visibility", "visible");
    letters.css("display", "block");
  });

  storageCloseTrigger.on("click", function() {
    storageBack.css("visibility", "hidden");
    letters.css("display", "none");
  });

  var booksMenuOpenTrigger = $("#books");
  var booksBack = $("#books-back")
  var booksCloseTrigger = $("#books-back-close");
  var books_menu = $("#books-menu");

  booksMenuOpenTrigger.on("click", function() {
    booksBack.css("visibility", "visible");
    books_menu.css("display", "block");
  });

  booksCloseTrigger.on("click", function() {
    booksBack.css("visibility", "hidden");
    books_menu.css("display", "none");
  });
});
