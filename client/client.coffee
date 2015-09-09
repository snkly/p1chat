Accounts.ui.config passwordSignupFields: 'USERNAME_ONLY'
Meteor.subscribe 'userData'

# Track if a user is signed in and they are on the home page > go to the room list page.
Tracker.autorun ->
  if Meteor.userId()
    if Router.current() and Router.current().route._path is "/"
      Router.go "room"

# user presences optional data
UserPresence.data = ->
  roomId: Session.get 'roomId'
  username : Session.get 'userName'
  avatar: Session.get 'avaTar'