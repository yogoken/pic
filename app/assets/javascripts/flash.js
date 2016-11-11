$(function() {
  $(document).ready(function() {
    $("#logo").fadeIn(0.1, function() {
      $("#logo").animate({width: "48%", height: "60%", top: "20%", left: "34%", opacity: "0"}, 800, function() {
        $("#logo").fadeOut(0.1);
      });
    });
    $("#flash").fadeIn(1000, function() {
      setTimeout(function() {
        $("#flash").fadeOut(2000);
      }, 1000);
    });
  });
});

