$(document).ready(function() {
  $("#questions").on('submit', '.survey-form', function(event){
    debugger
    event.preventDefault();
    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $("#questions").append(response);
    }).fail(function(error){
      $("#questions").append(error);
    });
  });

  $("#questions").on('submit', '.question-form', function(event) {
    event.preventDefault();
    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $("#questions").append(response)
    }).fail(function(response){
      $("#questions").append(response)
    });
  });

  $("#questions").on('submit', ".choice-form", function(event){
    event.preventDefault();
    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $("#questions").append(response);
    }).fail(function(error){
      $("#questions").append(error);
    });
  });
});
