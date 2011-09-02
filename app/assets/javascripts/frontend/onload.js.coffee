Cufon.replace('#top_menu a');
Cufon.replace('.big_button a');
$(document).ready ->
  $('.soon').click ->
    alert 'soon... we promise :)'
    return false
  if $('#twitter_feed').length>0
    getTwitters('twitter_feed', { 
      id: 'coworking_zoo', 
      count: 4, 
      enableLinks: true, 
      ignoreReplies: true, 
      clearContents: true,
      template: '<div class="entry"><div class="content">%text%</div><div class="added"><a href="http://twitter.com/%user_screen_name%/statuses/%id_str%/">%time%</a></div></div>'
    });
