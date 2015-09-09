Meteor.publish "allRooms", -> Rooms.find()
Meteor.publish "roomMessages", (roomId) -> Messages.find roomId:roomId
Meteor.publish "roomUsers", (roomId) -> UserPresences.find "data.roomId" : roomId
Meteor.publish "roomTweets", -> Tweets.find()
Meteor.publish "tweeta", -> Tweets.find()
Meteor.publish "ptweeta", -> Ptweets.find()

Meteor.publish 'userData', ->
  if @userId
    return Meteor.users.find({ _id: @userId }, fields:
      'services.twitter.profile_image_url': 1)
  else
    @ready()
  return
