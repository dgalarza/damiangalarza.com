//= require handlebars-1.0.0.beta.6.js

class GithubFeed

  @feed_url = 'https://api.github.com/users/{{USERNAME}}/repos?callback=?'

  constructor: (@username) ->
    @feed_url = GithubFeed.feed_url.replace '{{USERNAME}}', @username

    template_source = document.getElementById('github-project-template').innerHTML
    @template = Handlebars.compile template_source

    @fetch_feed()

  parse_feed: (feed) ->
    context = this
    html_fragment = ''

    for project in feed.data
      do (project) ->
        html_fragment = html_fragment + context.template(project)
        
    document.getElementById('github-feed-content').innerHTML = html_fragment

  fetch_feed: ->
    context = this
    $.getJSON @feed_url, (feed) ->
      context.parse_feed feed

$ ->
  feed = new GithubFeed 'dgalarza'
