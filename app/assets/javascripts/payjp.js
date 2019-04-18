$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  var number = form.find('input[name="number"]');
  var cvc = form.find('input[name="cvc"]');
  var exp_month = form.find('select[name="exp_month"]');
  var exp_year = form.find('select[name="exp_year"]');

  form.on("click", "#token-save", function(e) {
    Payjp.setPublicKey(gon.key);
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
        var card = {
            number:     number.val(),
            cvc:        cvc.val(),
            exp_month:  exp_month.val(),
            exp_year:   exp_year.val()
        };

    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        form.find('submit').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        var token = response.id;

        form.append(`<input type="hidden" name="card_id" class="payjp-token" value=${token} />`)
        form.get(0).submit();
      }
    });
  });
});
