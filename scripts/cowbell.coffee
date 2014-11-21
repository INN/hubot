# Description:
#   I got a fever
#
# Commands:
#   hubot more cowbell | hubot I've got a fever - Returns the only cure

module.exports = (robot) ->
  robot.respond /(more cowbell|I've got a fever)/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=UfD9fWt8hrQ"


