class @EventController 
  constructor: (@$scope, $routeParams, calendarService) ->
    day = calendarService.day($routeParams.day)
    @$scope.day = day.public()
    @$scope.Add = () ->
       calendarService.addEvent $scope.event

class @EventListController 
  constructor: (@$scope, $routeParams, calendarService) ->
    @$scope.day = calendarService.fetchDay($routeParams.day)
    
class @EventModalController
	constructor: (@$scope, @$routeParams, @$location, @calendarService, @eventService) ->
		@define_methods()

	define_methods: ->
		@$scope.setModel = @setModel

		@$scope.AddEvent = () =>
			@eventService.save(name: @$scope.name, description: @$scope.description, date: @$routeParams.day)
			angular.element('#eventModal').on "hide", =>
					@$location.path "/calendar/#{@$routeParams.day}/eventss"
			
	setModel: (data) ->
		@$scope.$apply => 
			@$scope.name = data.name
			@$scope.description = data.description