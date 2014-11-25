# Description:
#
#
# Commands:
#   hubot drum solo - Searches YouTube and gets you a drum solo

drummers = [
	'Neil Peart',
	'Buddy Rich',
	'animal'
]

module.exports = (robot) ->
  robot.hear /drum solo/i, (msg) ->
    drummer = msg.random drummers
    query = "#{drummer}! drum solo"
    robot.http("http://gdata.youtube.com/feeds/api/videos")
      .query({
        orderBy: "relevance"
        'max-results': 50
        alt: 'json'
        q: query
      })
      .get() (err, res, body) ->
        videos = JSON.parse(body)
        videos = videos.feed.entry

        unless videos?
          msg.send "No drum solo for you"
          return

        video = msg.random videos
        video.link.forEach (link) ->
          if link.rel is "alternate" and link.type is "text/html"
            msg.send link.href



