# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("#feed_list").delegate 'a.fetch', 'click', (event) ->
  alert '/feeds/' + $(event.target).data('feed-id') + '/articles'
