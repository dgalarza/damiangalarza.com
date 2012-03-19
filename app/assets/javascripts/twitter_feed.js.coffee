class TwitterFeed

  @feed_url = 'http://api.twitter.com/1/statuses/user_timeline.json?callback=?'

  @options =
    screen_name: 'dgalarza'
    count: 3
    include_rts: true

  constructor: (@username) ->
    @feed_url = TwitterFeed.feed_url.replace '{{USERNAME}}', @username

    template_source = document.getElementById('tweet-template').innerHTML
    @template = Handlebars.compile template_source

    @fetch_feed()

  parse_feed: (feed) ->
    context = this
    html_fragment = ''
    for tweet in feed
      do (tweet) ->
        tweet.text = context._parse_urls tweet.text
        tweet.text = context._parse_usernames tweet.text
        tweet.pretty_date = prettyDate tweet.created_at

        html_fragment = html_fragment + context.template(tweet)

    document.getElementById('twitter-feed-content').innerHTML = html_fragment

  fetch_feed: ->
    context = this
    $.getJSON @feed_url, TwitterFeed.options, (feed) ->
      context.parse_feed feed

  _parse_urls: (tweet)->
    tweet.replace /[A-Za-z]+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&\?\/.=]+/g, (url) ->
      return '<a target="_blank" href="' + url + '">' + url + '</a>'

  _parse_usernames: (tweet)->
    tweet.replace /[@]+[A-Za-z0-9-_]+/g, (user) ->
      return '<a target="_blank" href="http://www.twitter.com/' + user + '">' + user + '</a>'


$ -> 
  feed = new TwitterFeed 'dgalarza'
