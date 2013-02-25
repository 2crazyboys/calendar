angular.module "Scheduler", ["ngResource"], ($routeProvider) ->
  $routeProvider.when(
      '/calendar/:day/event/new', 
      controller: EventListController 
      templateUrl: '/events')

    # .when(
    #   '/calendar/:day/events/new', 
    #   controller: EventCreateController 
    #   templateUrl: '/events/new')
  
    # .when(
    #   '/calendar/:day/events/:id', 
    #   controller: EventEditController 
    #   templateUrl: '/events/edit')
  
    # .when(
    #   '/calendar/:month/month',
    #   controller: MonthController
    #   templateUrl: '/calendar/month/table'
    # )
