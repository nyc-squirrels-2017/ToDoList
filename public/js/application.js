$(document).ready(function() {
  $(".lists-container").on("click", ".new-link", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr("href"),
      method: "get"
    }).done(function(msg){
      $(e.target).hide()
      $(e.target).after(msg);
    })
  })

  $(".lists-container").on("submit", "#new-form", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr("action"),
      method: $(this).attr("method"),
      data: $(this).serialize()
    }).done(function(msg){
      $(".new-link").show();
      $(".lists-cards").append(msg)
      $(e.target).remove();
    })
  })

  $(".lists-container").on("submit", "#new-list-form", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr("action"),
      method: $(this).attr("method"),
      data: $(this).serialize()
    }).done(function(msg){
      $(".new-link").show();
      $(".lists-cards").append(msg)
      $(e.target).remove();
    })
  })

  $(".lists-cards").on("click", "#delete-list-form", function(e) {
      e.preventDefault();

      $.ajax({
        url: $(this).attr("action"),
        method: "delete"
      }).done(function(msg){
        $("#lists_" + msg.id).remove();
      })
  })

  $(".lists-cards").on("click", "#delete-list-form", function(e) {
      e.preventDefault();

      $.ajax({
        url: $(this).attr("action"),
        method: "delete"
      }).done(function(msg){
        $("#lists_" + msg.id).remove();
      })
  });

  $(".lists-cards").on("click", "#edit-list-form", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr("href"),
      method: "get"
    }).done(function(msg){
      $(e.target).parent().siblings().children().hide();
      $(e.target).parent().siblings().append(msg);
    })
  });
});
