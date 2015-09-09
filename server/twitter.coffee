Twit = Meteor.npmRequire('twit')
T = new Twit(
  #Add your own Twitter dev account info here
  consumer_key: ''
  consumer_secret: ''
  access_token: ''
  access_token_secret: '')

stream = T.stream("statuses/filter", #track: "mango salad"
  follow: [ 51240452, 54969017, 311434643, 269957637, 22737112, 19529387, 44159806, 89828373, 22730876, 30322683, 15763416, 3196735225  ]
)
stream.on "tweet", Meteor.bindEnvironment((tweet) ->
  hostCheck = JSON.stringify(tweet.user.id)
  hostId = [ '51240452', '54969017', '311434643', '269957637', '22737112', '19529387', '44159806', '89828373', '22730876', '30322683', '15763416', '3196735225' ]
  hostMusers = [ '22737112', '19529387', '15763416' ]
  hostNorm = [ '51240452', '30322683' ]
  hostBaD = [ '311434643', '44159806', '269957637' ]
  hostHardline = [ '54969017', '89828373', '22730876' ]
  console.log hostCheck
  #if tweet.user.id is 51240452 or 54969017 or 311434643 or 269957637 or 22737112 or 19529387 or 44159806 or 89828373 or 22730876 or 30322683 or 15763416
  #if hostCheck in hostId
  #  console.log "inserted Host Tweet"
  #  Tweets.insert
  #    name: tweet.user.screen_name
  #    content: tweet.text
  #    creation_date: new Date()
  #    timestamp: tweet.created_at
  #    avatar: tweet.user.profile_image_url
  #    hosts: all
  #  return
  if hostCheck in hostMusers
    console.log "inserted Musers Tweet"
    Tweets.insert
      name: tweet.user.screen_name
      content: tweet.text
      creation_date: new Date()
      timestamp: tweet.created_at
      avatar: tweet.user.profile_image_url
      hosts: 'musers'
      hostsId: hostMusers
      roomId: 'L8sdWERPkyQrpc8gs' #hardcoded
    return
  else if hostCheck in hostNorm
    console.log "inserted Norm Tweet"
    Tweets.insert
      name: tweet.user.screen_name
      content: tweet.text
      creation_date: new Date()
      timestamp: tweet.created_at
      avatar: tweet.user.profile_image_url
      hosts: 'norm'
      hostsId: hostNorm
      roomId: 'KyGiznXtSuSAaqqHR' #hardcoded
    return
  else if hostCheck in hostBaD
    console.log "inserted BaD Tweet"
    Tweets.insert
      name: tweet.user.screen_name
      content: tweet.text
      creation_date: new Date()
      timestamp: tweet.created_at
      avatar: tweet.user.profile_image_url
      hosts: 'bad'
      hostsId: hostBaD
      roomId: 'fLsAcrYDmRnY5otLD' #hardcoded
    return
  else if hostCheck in hostHardline
    console.log "inserted Hardline Tweet"
    Tweets.insert
      name: tweet.user.screen_name
      content: tweet.text
      creation_date: new Date()
      timestamp: tweet.created_at
      avatar: tweet.user.profile_image_url
      hosts: 'hardline'
      hostsId: hostHardline
      roomId: 'bzasbSZWfbtTTZpMj'#hardcoded
    return
  else
    console.log "Inserted p1 tweet"
    Ptweets.insert
      name: tweet.user.screen_name
      content: tweet.text
      creation_date: new Date()
      timestamp: tweet.created_at
      avatar: tweet.user.profile_image_url
      hostId: hostId
      roomId: 'tGGRSPowacRDxkwnm' #hardcoded
    return
)
