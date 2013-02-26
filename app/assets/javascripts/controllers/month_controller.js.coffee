class @MonthController 
  constructor: (@$scope, @$location, @eventService, $routeParams, calendarService) ->
    calendarService.setup($routeParams.month, $routeParams.year)
    @calendar = calendarService
    @define_methods @calendar
    @load_events()
  
  load_events: () ->
    calendar = @calendar
    @eventService.between @calendar.first_day(), @calendar.last_day(), (events) ->
      _.each events, (event) ->
        calendar.addEvent moment(event.date).format("YYYY-MM-DD"), event

  define_methods: (calendar) ->
    @$scope.showEvents = (day) =>
      @$location.path "/calendar/#{day}/events"
    
    @$scope.weeks = () =>
      @calendar.weeks()


