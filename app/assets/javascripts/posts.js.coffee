//= require handlebars-1.0.0.beta.6

class CommentsController

  @url = '/posts/{{POST_ID}}/comments'

  constructor: ->
    post_id = document.getElementById('post').getAttribute('data-post-id')
    @url = CommentsController.url.replace '{{POST_ID}}', post_id

    @page = 1
    @offset = 0
    @per_page = 10

    @max_comments = document.getElementById('post-comments').getAttribute('data-comment-count')
    @max_comments = Number @max_comments

    Handlebars.registerHelper 'comment_author', this.comment_author
    Handlebars.registerHelper 'gravatar_url', this.gravatar_url

  lazy_load_template: ->
    unless @template
      template_html = document.getElementById('comment-template').innerHTML
      @template = Handlebars.compile(template_html)

    @template

  fetch_comments: ->
    options = 
      skip: @page * @per_page

    context = this
    $.getJSON @url, options, (comments) ->
      context.receive_comments comments

  receive_comments: (comments) ->
    @page++

    unless (@page * @per_page) < @max_comments
      $('#comment-load-trigger').fadeOut()

    this.render_comments(comments)

  render_comments: (comments) ->
    html = ''

    template = this.lazy_load_template()

    for comment in comments
      html += template comment

    $('#comment-content').append html
    
  comment_author: (comment) ->
    if comment.website
      return '<a href="' + comment.website + '" target="_blank">' + comment.username + '</a>'
    else
      return comment.username

  gravatar_url: (comment) ->
    "//gravatar.com/avatar/" + comment.email_hash + ".png?=60r=pg&d=http://assets.damiangalarza.com/images/icons/avatar-default.png"
    

controller = new CommentsController
$('#comment-load-trigger').bind 'click', (e) ->
  e.preventDefault()
  controller.fetch_comments()
