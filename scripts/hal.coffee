# Description:
#   Respond with references to 2001 A Space Odyssey.

module.exports = (robot) ->
  robot.respond /do you read me\?$/i, (msg) ->
    msg.send "Affrirmative, Dave. I read you."

  robot.respond /open the pod bay doors/i, (msg) ->
    msg.send "I'm sorry, Dave. I'm afraid I can't do that."

  robot.respond /what(\'s|\sis) (the|your) problem\?/i, (msg) ->
    msg.send "I think you know what the problem is just as well as I do."
