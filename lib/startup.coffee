Meteor.startup ->
  if Rooms.find().count() == 0
    Rooms.insert (
      name: 'The Musers'
      start: '05:30:00'
      end: '10:00:00'
      short: "musers"
      showNo: 1
      user_count : 0)
    Rooms.insert (
      name: 'Norm Hitzges'
      start: '10:00:00'
      end: '12:00:00'
      short: "norm"
      showNo: 2
      user_count : 0)
    Rooms.insert (
      name: 'BaD Radio'
      start: '12:00:00'
      end: '15:00:00'
      short: "BaD"
      showNo: 3
      user_count : 0)
    Rooms.insert (
      name: 'The Hardline'
      start: '15:00:00'
      end: '19:00:00'
      short: "hardline"
      showNo: 3
      user_count : 0)
    Rooms.insert (
      name: 'General Chat'
      start: null
      end: null
      short: "musers"
      showNo: 4
      user_count : 0)
    return

