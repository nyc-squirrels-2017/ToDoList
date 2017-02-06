$(document).ready(function() {
  $('#sign-up-link').on("click", function(e){
    e.preventDefault();
    var url = $(this).attr("href")
    var method = $(this).attr("method")
    debugger;
$.ajax({
  url: url,
  method: method
}).success(function(response){
console.log(response)

})
})

});
