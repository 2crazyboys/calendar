// Generated by CoffeeScript 1.4.0
var app;

app = angular.module("Calendar", [], function($routeProvider) {
  var month;
  month = moment().format('M');
  return $routeProvider.when('/calendar/event/new', {
    controller: MonthCalendarController,
    templateUrl: '/events/new'
  });
});

this.MonthCalendarController = (function() {

  function MonthCalendarController($scope, $routeParams, $location) {
    $scope.event = {
      title: "tesst"
    };
    $scope.handleClick = function() {
      return $location.path("/calendar/event/new");
    };
  }

  return MonthCalendarController;

})();

this.EventCrontroller = (function() {

  function EventCrontroller($scope, $routeParams, $location) {}

  return EventCrontroller;

})();
