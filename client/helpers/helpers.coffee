Handlebars.registerHelper 'moments', (date) ->
  moment(date).format 'h:mm a - MMMM Do YYYY'