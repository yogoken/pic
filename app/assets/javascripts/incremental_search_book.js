$(function() {
  var timer;
  var preInput;
  var path = $("#book_search").data("toggle");

  ajaxSearch = function(input) {
    $.ajax({
      url: path,
      type: "GET",
      dataType: 'script',
      data: ("utf8=✓&keyword=" + input + "&commit=検索")
    });
  };

  triggerAjax = function(input) {
    if(preInput !== input) {
      clearTimeout(timer);
      timer = setTimeout(ajaxSearch, 500, input);
    };
  };

  $('#book_search').on('keyup', function() {
    input = $('#book_search').val();
    triggerAjax(input);
    preInput = input;
  })
})

