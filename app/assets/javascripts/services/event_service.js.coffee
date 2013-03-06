app = angular.module("Scheduler")

eventService = app.factory "eventService", ["$resource", ($resource) ->
  class RestService 
    constructor: () ->
      @resource = $resource("/events/:id/:date_path/:date/:from_path/:from/:to_path/:to", 
        {id: "@id"},
         update:   { method: "PUT" },
         between:   { method: "GET", isArray: true  ,  params: { from_path: "from", to_path: "to", from: "@from", to: "@to" }},
         from:      { method: "GET", isArray: true  ,  params: { from_path: "from", from: "@from" }},
         to:        { method: "GET", isArray: true  ,  params: { to_path:   "to", to: "@to" }},
         by_date:   { method: "GET", isArray: true  ,  params: { date_path: "date", date: "@date" }})

    list: (callback) ->
      @resource.query(callback)
    save: (event) ->
      @resource.save event
    update: (event) ->
      @resource.update event
    between: (from, to, callback) ->
      @resource.between {from: from, to: to}, callback
 
  return new RestService
]