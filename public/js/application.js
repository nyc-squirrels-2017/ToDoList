$(document).ready(function() {
  $(".card").each(function(e) {
    var card = $(this);
    setTimeout(function() {
      card.addClass("margin");
    }, 500*e);
  });
});
