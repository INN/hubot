# Description:
#   In case you need some emergency banjo
#
# Commands:
#   hubot banjo break - Searches YouTube and gets you a banjo video.

players = [
	'Eddie Adcock',
	'Dock Boggs',
	'Roy Clark',
	'J. D. Crowe',
	'Doug Dillard',
	'Béla Fleck',
	'Roscoe Holcomb',
	'Snuffy Jenkins',
	'Grandpa Jones',
	'Bill Keith',
	'Jens Kruger',
	'Nappy Lamare',
	'Uncle Dave Macon',
	'Wade Mainer',
	'Steve Martin Banjo',
	'Rob McCoury',
	'Alan Munde',
	'Sonny Osborne',
	'Noam Pikelny',
	'Charlie Poole',
	'Don Reno',
	'Earl Scruggs',
	'Pete Seeger',
	'Ralph Stanley',
	'Roni Stoneman',
	'Buck Trent',
	'Tony Trischka',
	'Eric Weissberg'
]

module.exports = (robot) ->
  robot.respond /banjo break/i, (msg) ->
    query = msg.random players
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
          msg.send "No banjo for you"
          return

        video = msg.random videos
        video.link.forEach (link) ->
          if link.rel is "alternate" and link.type is "text/html"
            msg.send link.href



