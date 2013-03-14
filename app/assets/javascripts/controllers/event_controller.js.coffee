class @EventController 
  constructor: (@$scope, $routeParams, calendarService) ->
    day = calendarService.day($routeParams.day)
    @$scope.day = day.public()
    @$scope.Add = () ->
       calendarService.addEvent $scope.event

EventController.$inject = ["$scope", "$routeParams", "calendarService"]

class @EventListController 
  constructor: (@$scope, $routeParams, calendarService) ->
    @$scope.day = calendarService.fetchDay($routeParams.day)

EventListController.$inject = ["$scope", "$routeParams", "calendarService"]    
    
class @EventModalController
	constructor: (@$scope, @$location, @calendarService, @eventService) ->
		@define_methods()

	define_methods: ->
		@$scope.setModel = @setModel

		@$scope.AddEvent = () =>
			@calendarService.addEvent(@$scope.date, { name: @$scope.name, description: @$scope.description, date: @$scope.date })
			@eventService.save(name: @$scope.name, description: @$scope.description, date: @$scope.date)
			
	setModel: (data) ->
		@$scope.$apply => 
			@$scope.name = data.name
			@$scope.description = data.description
			@$scope.date = data.date

EventModalController.$inject = ["$scope", "$location", "calendarService", "eventService"]