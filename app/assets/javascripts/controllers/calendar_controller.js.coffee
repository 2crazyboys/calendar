class @MonthController 
 
  constructor: (@$scope, @$location, @eventService, $routeParams, calendarService) ->
    @calendar = calendarService
    @define_methods @calendar
    @load_events()
  
  load_events: (callback) ->
    calendar = @calendar
    events = @eventService.list (events)->
        _.each events, (event) ->
            calendar.addEvent event


  define_methods: (calendar) ->
    @$scope.registerEvent = (line, column) =>
      day = @calendar.dayFrom(line, column)
      @$location.path "/calendar/#{day.id()}/events"

    @$scope.eventsByDay = (line, column) =>
      calendar.eventsFrom(line,column)

    @$scope .columns = () ->
      calendar.columns()

    @$scope.lines =  () ->
      calendar.lines()
