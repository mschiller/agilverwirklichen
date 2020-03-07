import Globals from '../javascripts/globals'

show_message = (msg, type) ->
  Globals.flash_message.style.height = '40px'
  setTimeout (->
    Globals.flash_message.style.height = '0'
    return
  ), 12000
  return
  return

$(document).ready ->
  if document.getElementsByClassName("flash_message").length > 0
    setTimeout (->
      show_message()
    ), 600

show_ajax_message = (msg, type) ->
  $('#flash').html '<div class="' + type + ' flash_message" id="flash_' + type + '">' + decodeURIComponent(escape(msg)) + '</div>'
  Globals.header.style.height = Globals.defaultHeaderHeight;
  show_message()

$(document).ready ->
  $(document).on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    msg = xhr.getResponseHeader('X-Message')
    type = xhr.getResponseHeader('X-Message-Type')
    show_ajax_message msg, type
  )
