class @MonthController 
 
  constructor: (@$scope, @$location, @eventService, $routeParams, Calendar) ->
    @calendar = Calendar.month
    calendar = @calendar
    @define_methods calendar
    cb = (err,events) ->
      _.each events, (event) ->
        calendar.addEvent event

    @eventService.load(cb)

  define_methods: (calendar) ->
    @$scope.registerEvent = (line, column) =>
      index = @calendar.index(line, column)
      @$location.path "/calendar/#{index}/event/new"

    @$scope.eventsByDay = (line, column) =>
      calendar.eventsFrom(line,column)

    @$scope .columns = () ->
      calendar.columns()

    @$scope.lines =  () ->
      calendar.lines()
