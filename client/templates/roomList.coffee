Template.roomList.helpers
  rooms : -> Rooms.find {}

#Template.roomList.rendered = ->
#  current = Router.current().params._id
#  console.log current

#Template.roomList.events
#  'click .tab-item' : (event, template) ->
#    activeLink = template.find('.tab-item')
#    if activeLink
#      activeLink.classList.remove 'active'

#    event.currentTarget.classList.add 'active'
#    return

Template.roomList.rendered = ->
  route = Router.current().params._id
  route2 = Router.current()
  tab = $('.' + route)

  #tab.className.replace 'active'
  tab[0].classList.add 'active'

  console.log route
  return

