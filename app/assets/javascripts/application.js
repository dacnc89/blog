// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directivesedy(function() {

//= require jquery
//= require bootstrap
//= require bootstrap-sprockets
//= require rails-ujs
//= require_tree .



$(document).ready(function() {
  
  // $article_form = document.getElementById('article-form');
  // $new_article_btn = document.getElementById('new-article-btn')
  // $('#article_form').on('click', function () {

  //   alert("pop");
  //   $.ajax({
  //     url:  'articles/new',
  //     type: 'GET',
  //     success:  function(htmlc){
  //       alert("success");
  //       $('#show-form').toggle()
  //       $('#article_form').append(htmlc)
  //     }
  //   });
  // });



  // Show comment form
  $('#comments-link').on('click', function(){
     alert("clicked!")
    $('#comments-section').toggle();
    $('#comment-body').focus();
  });



 
 
});






