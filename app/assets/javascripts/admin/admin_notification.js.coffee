doc = document
win = window

class AdminNotification
  @build_notification: (type, content) ->
    div = document.createElement 'div'
    div.className = ['notification', type].join(' ')

    div.innerHTML = content

    div

  constructor: (type, content) ->
    @notice = Notification.build_notification type, content
    $('#notification-center').append(@notice)

    notice = @notice
    timeout = ->
      $(notice).css
        bottom: 0

      hide_timeout = ->
        $(notice).css
          bottom: -50

      setTimeout hide_timeout, 1500

    setTimeout(timeout, 250)

win.AdminNotification = AdminNotification
