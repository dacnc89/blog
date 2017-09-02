###
$(document).on 'page:change', ->
  $('#comments-link').on 'click', ->
    alert("clicked!")
    $('#comments-section').toggle()
    $('#comment-body').focus()
    $('#comment-body').val("")
###