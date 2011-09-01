$(document).ready ->
  if $('#content').hasClass('welcome')
    $(".scrollable").scrollable().navigator()
    $('#slider_pagination.navi a').click ->
      $(this).parent().find('a').removeClass('current')
      $(this).addClass 'current'

