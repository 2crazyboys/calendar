app = angular.module("Scheduler")
app.factory "eventService", () ->
  events = [{title: "meeting", date: "01/02/2013"}, {title: "meeting-2", date: "02/02/2013"}, {title: "meeting-3", date: "03/02/2013"}]
  load: (callback) ->
    callback null, events

