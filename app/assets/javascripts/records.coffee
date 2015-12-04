# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready', ->
  NProgress.start()
  $('.my-popover').popover({ 'placement': 'bottom', 'trigger': 'click' })
  $('.input-group.date').datepicker({ 'format': 'mm/dd/yyyy', 'orientation': "bottom left", 'todayHighlight': true, 'toggleActive': true })

$(document).ajaxStart ->
  NProgress.start()

$(document).ajaxComplete ->
  NProgress.done()