# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#feed_list").delegate 'a.fetch', 'click', ->
    url = '/feeds/' + $(this).data('feed-id') + '/articles'
    $.ajax
      url: url,
      success: (result) ->
        $("#feed_display").html(result)
      
