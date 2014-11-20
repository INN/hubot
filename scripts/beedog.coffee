# Description:
#   Beedogs!
#   http://beedogs.com/
#
# Commands:
#   hubot beedog me -> Displays a beedog

module.exports = (robot) ->

  robot.respond /beedog me/i, (msg) ->

  	rand = Math.floor(Math.random() * (83 - 10 + 1)) + 10
  	msg.send "http://beedogs.com/index_files/image0#{rand}.jpg"