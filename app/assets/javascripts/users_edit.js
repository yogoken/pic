$(function() {
  $("#avatar_file").on("change", function() {

    var file = this.files[0];
    var fileReader = new FileReader();

    fileReader.onload = function() {
      $("#avatar_image").attr("src", fileReader.result);
    };

    fileReader.readAsDataURL(file);
  })
})

