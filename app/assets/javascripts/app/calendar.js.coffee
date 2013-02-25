angular.module "Scheduler", [], ($routeProvider) ->
  $routeProvider.when('/calendar/:day/event/new', 
      controller: EventCrontroller 
      templateUrl: '/events/new')
    .when('/calendar/:month/month',
      controller: MonthController
      templateUrl: '/calendar/month/table'
    )
