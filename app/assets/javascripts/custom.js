$( document ).on('turbolinks:load', function() {

  //slide flash message up
  setTimeout(function(){
  $('.flash-msg').slideUp(800);
  }, 3000);

})
