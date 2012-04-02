doc = document
win = window

class Notification
  @build_notification: (type, content) ->
    div = document.createElement 'div'
    div.className = ['notification', type].join(' ')

    console.log content
    div.innerHTML = content

    div

  constructor: (type, content) ->
    @notice = Notification.build_notification type, content
    $('#notification-center').append(@notice)

    notice = @notice
    timeout = ->
      $(notice).css({
        bottom: 0
      })

    setTimeout(timeout, 250)

win.Notification = Notification
