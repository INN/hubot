# Description:
#   In case you need some emergency banjo
#
# Commands:
#   hubot banjo break - Searches YouTube and gets you a banjo video.
#	todo: maybe use a list of famous banjo players, pick a random one and make this more interesting

module.exports = (robot) ->
  robot.respond /banjo break/i, (msg) ->
    robot.http("http://gdata.youtube.com/feeds/api/videos")
      .query({
        orderBy: "relevance"
        'max-results': 100
        alt: 'json'
        q: 'banjo'
      })
      .get() (err, res, body) ->
        videos = JSON.parse(body)
        videos = videos.feed.entry

        unless videos?
          msg.send "No banjo for you"
          return

        video  = msg.random videos
        video.link.forEach (link) ->
          if link.rel is "alternate" and link.type is "text/html"
            msg.send link.href

