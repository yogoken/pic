$(function() {
  var openTrigger = $("#letter-new");
  var modal = $("#letter-new-modal");
  var closeTrigger = $(".modal__back");
  var form = $("#letter-form");

  openTrigger.on("click", function() {
    modal.css("visibility", "visible");
    form.focus();
  });

  closeTrigger.on("click", function() {
    modal.css("visibility", "hidden");
  });
});
