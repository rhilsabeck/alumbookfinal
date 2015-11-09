# Author: Maxwell Barvian
#
#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery-ui/autocomplete
#= require autocomplete-rails
#= require cocoon
#= require turbolinks
#= require foundation
#= require_tree .

ready = ->
  # Initialize all foundation components
  $(document).foundation()

  # Non-link links
  $('[data-clickable]').click (event) ->
    return if $(event.target).is('a') || $(event.target).closest('a').length # User probably clicked an action, abort
    event.preventDefault()

    # Go to URL
    document.location = $(this).data('clickable')

  # Dismiss auto-close alerts
  $('[data-timeout]').each ->
    $timeout = $(this)
    setTimeout ->
      if $timeout.is('.alert-box') then $timeout.find("a.close").trigger("click.fndtn.alert") else $timeout.fadeOut()
    , $timeout.data('timeout') * 1000


  $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'})

  # Expandables
  $expandables = $('[data-expandable]')
  $expandables.click (event) ->
    return if $(event.target).is('a') || $(event.target).closest('a').length # User probably clicked an action, abort
    event.preventDefault()

    clicked = this # Save reference to clicked expandable
    $expandables.each ->
      $expandable = $(this)
      $expand = $expandable.find('.expand')

      shouldExpand = this is clicked && !$expandable.hasClass('expanded')
      $expandable.toggleClass('expanded', shouldExpand)
      if shouldExpand then $expand.slideDown(200) else $expand.slideUp(200)

$(document).ready ready # DOM ready
$(document).on 'page:load', ready # Turbolinks ready
