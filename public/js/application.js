$(document).ready(function() {

  $('#lists').on('click', '#add-list', function(event){
    event.preventDefault(); //event = 'a'
    $.ajax({
      url: $(event.target).attr('href'),
      method: 'get'
    }).success(function(response){
      $(event.target).hide()
      $('#lists').append(response) //adds a submit form
    })
  });

  $('#lists').on('submit', '#new-list', function(event){
    event.preventDefault();
    $.ajax({
      url: $(event.target).attr('action'),
      method: $(event.target).attr('method'),
      data: $(event.target).serialize()
    }).success(function(response){
      $('#list-container').append(response) //add new list
      $('#new-list').remove() //remove the submit form
      $('#add-list').show() //show add button
    }).fail(function(error){
      $("#errors").remove() //remove previous errors
      $(event.target).after(error.responseText) //display errors below form
    })
  });

  $('#task-container').on('submit', ".delete-task", function(event){
    event.preventDefault();
     console.log(event.target)
     $.ajax({
       url: $(event.target).attr('action'),
       method: 'delete'
     }).success(function(response){
       $(event.target).parent().remove(); //removes the <li> element which contains everything for an individual task
     })
  })
});
