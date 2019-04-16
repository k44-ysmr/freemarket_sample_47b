$(document).on('turbolinks:load', function() {
  $fileField = $('#file')

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

// price
  $(function () {
    $(document).on('keyup', '#new-price', function () {
      calcProfit();
    });
  });

  $(document).on('turbolinks:load', function () {
    calcProfit();
  });

  function calcProfit() {
    let input = $("#new-price").val() / 1;

    if (input < 300 || input > 9999999) {
      $("#fee").text("-");
      $("#sales-profit").text("-");
      return false;
    }

    let charge = parseInt(input / 10);
    if (charge) {
      $("#fee").text("¥" + charge.toLocaleString());

      let profit = input - charge;
      $("#sales-profit").text("¥" + profit.toLocaleString());
    }
  }
});

// 下記の複数枚表示参考のため残す

// $(function(){
//   $('#file').change(function(){
//     if ( !this.files.length ) {
//       return;
//     }
//     $('#imgfile').text('');

//     var $files = $(this).prop('files');
//     var len = $files.length;
//     for ( var i = 0; i < len; i++ ) {
//       var file = $files[i];
//       var fr = new FileReader();

//       fr.onload = function(e) {
//         var src = e.target.result;
//         var img = '<img src="'+ src +'">';
//         $('#imgfile').append(img);
//       }

//       fr.readAsDataURL(file);
//     }

//     $('#imgfile').css('display','block');
//   });
// });
