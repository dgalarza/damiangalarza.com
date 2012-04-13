#= require admin/admin_notification

# Ensure all ajax requests send the CSRF token in the header
$.ajaxSetup
  beforeSend: (xhr) ->
    xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')

get_comment_id = ->
  $(this).parents('tr').attr('data-comment-id')

spam_delegate = ->
  method = if this.value == 'false' then 'spam' else 'unspam'
  comment_id = get_comment_id.apply this
  $.ajax
    url: '/admin/comments/' + comment_id + '/' + method
    type: 'put'

  return false

delete_comment_delegate = ->
  comment_id = get_comment_id.apply this
  context = this
  $.ajax
    url: '/admin/comments/' + comment_id
    type: 'delete'
    success: ->
      new AdminNotification 'success', 'Comment removed'
      $(context).parents('tr').fadeOut 'fast', ->
        $(this).remove()

  return false


# Comment spam handling
$comments_table = $ '.comments-table'
$comments_table.on 'change', 'input[type=radio]', spam_delegate
$comments_table.on 'click', '.delete-trigger', delete_comment_delegate
