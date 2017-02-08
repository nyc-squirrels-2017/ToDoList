$(document).ready(function() {
  $('.checkbox-edit').hide()
  $('.checkbox').show()

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

     $.ajax({
       url: $(event.target).attr('action'),
       method: 'delete'
     }).success(function(response){
       $(event.target).parent().remove(); //removes the <li> element which contains everything for an individual task
     })
  })

  $('.task-list').on('click', "#add-task", function(event){
    event.preventDefault();
     $.ajax({
       url: $(event.target).attr('href'),
       method: 'get'
     }).success(function(response){
      //  console.log(response)
       $(event.target).after(response)
       $(event.target).hide()
     })
  })

  $('.task-list').on('submit', ".task-submit", function(event){
    event.preventDefault()
    $.ajax({
      url: $(event.target).attr('action'),
      method: $(event.target).attr('method'),
      data: $(event.target).serialize()
    }).success(function(response){
      $('#task-container').append(response)
      $('.task-submit').remove()
      $('#add-task').show()
      $('.checkbox').show()
    }).fail(function(error){
    $("#errors").remove() //remove previous errors
    $(event.target).after(error.responseText) //display errors below form
    })
  })

  $('.task-list').on('click', ".edit-task", function(event){
    event.preventDefault()
    // console.log(event.target)
    $.ajax({
      url: $(event.target).attr('href'),
      method: 'get'
    }).success(function(response){
      $(event.target).after(response) //adds an edit form
      $(event.target).hide()
      $('.checkbox-edit').hide()
    })
  })

  $('.task-list').on('submit', ".task-edit", function(event){
    event.preventDefault()
    $.ajax({
      url: $(event.target).attr('action'),
      method: 'put',
      data: $(event.target).serialize()
    }).success(function(response){
      $(event.target).parent().replaceWith(response)
      $('.checkbox').show()
    })
  })

  $('.task-list').on('click', ".checkbox", function(event){
    event.preventDefault()
  })
});
