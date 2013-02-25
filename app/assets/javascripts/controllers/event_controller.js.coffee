class @EventCrontroller 
  constructor: (@$scope, Calendar) ->
    @$scope.Add = () ->
       Calendar.month.addEvent $scope.event
    