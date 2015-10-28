# Created by Leiyang Guo
# With minimal assistance/advice from James Maher and Maxwell Barvian
ready = ->
  # Add click action for remove_field link'
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).closest('.field').remove()
    event.preventDefault()

  # Add click action for add_field button
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    # console.log 'clicked'  
$(document).ready(ready)
$(document).on('page:load', ready)



