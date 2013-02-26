angular.module "Scheduler", ["ngResource"], ($routeProvider) ->
  $routeProvider.when(
      '/calendar/month/:month/:year/',
      controller: MonthController
      templateUrl: '/calendar/month.html')
    .when(
      '/calendar/:day/events',
      controller: EventListController 
      templateUrl: '/events/index.html')
    .otherwise( {redirectTo: "/calendar/month/#{moment().month() + 1 || 1}/#{moment().year()}" })
    
    # .when(
    #   '/calendar/:day/events/:id', 
    #   controller: EventEditController 
    #   templateUrl: '/events/edit')
  
    # .when(
    #   '/calendar/:month/month',
    #   controller: MonthController
    #   templateUrl: '/calendar/month/table'
    # )
