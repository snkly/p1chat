Meteor.methods
  # Join a room.
  joinRoom : (roomId) ->
    if not checkIsValidRoom roomId then return
    roomUsers = UserPresences.find "data.roomId" : roomId
    Rooms.update roomId, $set: user_count: roomUsers.count()+1

  # Leave a room.
  leaveRoom : (roomId) ->
    if not checkIsValidRoom roomId then return
    roomUsers = UserPresences.find "data.roomId" : roomId
    roomUsersCount = roomUsers.count()-1
    if roomUsersCount <= 0
      Rooms.update roomId, $set: user_count:roomUsersCount

  # Insert message into the Messages collection.
  createMessage : (params={}) ->
    if not params.roomId or not params.message then return
    Messages.insert
      username: Meteor.user().profile.name
      roomId: params.roomId
      content: params.message
      createdAt: new Date()

UserPresenceSettings
  onDisconnect : (userPresence={}) ->
    if not userPresence.data or not userPresence.data.roomId then return
    roomId = userPresence.data.roomId
    if not checkIsValidRoom roomId then return
    roomUsers = UserPresences.find "data.roomId" : roomId
    roomUsersCount = roomUsers.count()-1
    if roomUsersCount <= 0
      Rooms.update roomId, $set: user_count:roomUsersCount

# Check if the roomId is associated with a valid room
checkIsValidRoom = (roomId) ->
  if not roomId then false
  room = Rooms.findOne _id:roomId
  if not room then false
  return true
