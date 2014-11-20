# Description:
#   Beedogs!
#   http://beedogs.com/
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot beedog me -> Displays a beedog
#
# Author:
#   aschweig


module.exports = (robot) ->

  robot.respond /beedog me/i, (msg) ->

  	low  = 10
    high = 83

  	rand = Math.floor(Math.random() * (high - low + 1)) + low
  	msg.send "http://beedogs.com/index_files/image0#{rand}"