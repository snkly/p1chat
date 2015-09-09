Template.room.helpers
  roomName : ->
    room = Rooms.findOne Session.get "roomId"
    room ?= name : "Current Room"
    room.name
  roomUsers : ->
    UserPresences.find {}, sort : "data.Meteor.user().profile.name":1
  messages : ->
    Messages.find {}, sort : createdAt : 1
  tweets : ->
    #room = Rooms.findOne Session.get "roomId"
    #Tweets.find {roomId : room._id},
    Tweets.find {},
      sort : creation_date : "asc"
      limit: 10

Template.room.events =
  "submit [data-action=create-message]" : (event, template) ->
    event.preventDefault()
    $message = $("[data-value=create-message]")
    if $message.val() is "" then return
    Meteor.call "createMessage",
      roomId : Session.get "roomId"
      message : $message.val()
    container = $('#messages-container')
    container.animate { scrollTop: container.prop('scrollHeight') - container.height() + 100 }, 100
    $message.val ""

Template.room.rendered = ->
  container = $('#messages-container')
  container.animate { scrollTop: container.prop('scrollHeight') - container.height() + 100 }, 100

Tracker.autorun ->
  if Meteor.userId()
    if Router.current() and Router.current().route._path is "/"
      Router.go "rooms"