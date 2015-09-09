Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "home"
  waitOn: ->
    Meteor.subscribe "allRooms"

Router.map ->
    @.route "/",
      template : "home"

    @.route "/rooms",
      template : "roomList"
      waitOn : ->
        Meteor.subscribe "tweeta"
        Meteor.subscribe "ptweeta"
      action : ->
        Session.set "roomId", null
        @.render()

    @.route "/room/:_id",
      template : "room"
      waitOn : ->
        Meteor.subscribe "roomUsers", @.params._id
        Meteor.subscribe "roomMessages", @.params._id
        Meteor.subscribe "roomTweets"
        Meteor.subscribe "tweeta", @.params._id
      action : ->
          Session.set "userName", Meteor.user().profile.name
          Session.set "avaTar", Meteor.user().services.twitter.profile_image_url
          Meteor.call "joinRoom", @.params._id
          Session.set "roomId", @.params._id
          @.render()
      unload : ->
        Meteor.call "leaveRoom", @.params._id
        Session.set "roomId", null

    @.route "/board",
      template : "board"
      waitOn : ->
        Meteor.subscribe "tweeta"
        Meteor.subscribe "ptweeta"

    @.route "/shows",
      template : "shows"
      waitOn : ->
        Meteor.subscribe "tweeta"
        Meteor.subscribe "ptweeta"
        Meteor.subscribe "roomUsers", @.params._id
        Meteor.subscribe "roomMessages", @.params._id
        Meteor.subscribe "tweeta", @.params._id

Router.onBeforeAction ->
  if not Meteor.userId()
    @.render "home"
  else
    @.next()