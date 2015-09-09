Template.twitta.helpers
  tweets : -> Tweets.find {},
    sort : creation_date : 'asc'
    limit: 10