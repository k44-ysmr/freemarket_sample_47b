$(document).on('turbolinks:load', function() {
  $fileField = $('#editImage')

  $($fileField).on('change', $fileField, function(e) {

      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#imgfile");

      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            height:"162px",
            class: "preview-image",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
  });
});
