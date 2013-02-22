
app = angular.module "Calendar", [], ($routeProvider) ->
  month = moment().format('M')
  $routeProvider.when('/calendar/event/new', { controller:MonthCalendarController, templateUrl: '/events/new' })

class @MonthCalendarController
  constructor: ($scope, $routeParams, $location) ->
    $scope.event = title: "tesst"
    $scope.handleClick =  () ->
      $location.path("/calendar/event/new")

class @EventCrontroller
  constructor: ($scope, $routeParams, $location) ->
