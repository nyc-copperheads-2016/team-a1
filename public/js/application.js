$(document).ready(function() {
  //renders question form
  $("#survey-info").on('submit', '.survey-form', function(event){
    event.preventDefault();
    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $("#survey-info").html(response);
    }).fail(function(error){
      console.log("Error " + response)
    });
  });


  //renders partial choice form
  $("#survey-info").on('submit', '.question-form', function(event) {

    event.preventDefault();
    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $(".question-submit-button").hide();
      // debugger
      $('.choice').show();
      $(".choice").html(response);
      // $(".question-submit-button").hide();
    }).fail(function(response){
      console.log("Error " + response)
    });
  });
  //renders choice form
  $(".choice").on('submit', ".choice-form", function(event){
    event.preventDefault();
    $.ajax({
      method: event.target.method,
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $(".choice-submit-button").hide();
      $(".new-question").hide();
      $(".choice").append(response);
    }).fail(function(error){
      console.log("Error " + response)
    });
  });

  $('.choice').on('click','.new-question', function(event) {
    event.preventDefault();
    $.ajax({
      url: event.target.href,
    }).done(function(response){
      $(".choice").hide();
      $("#survey-info").append(response);
    }).fail(function(response){
      console.log("Error " + response);
    });
  });
});
