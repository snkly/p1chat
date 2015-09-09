Template.layout.helpers
  hasRoomId : -> if Meteor.userId() and Session.get("roomId") then true else false
  isLoggedIn: -> if Meteor.userId() then true else false
