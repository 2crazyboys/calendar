
app = angular.module "Calendar", ["ngResource"], ($routeProvider, $locationProvider) ->
  month = moment().format('M')
  $routeProvider
    .when('/calendar/:month' , 
      controller: MonthCalendarController
      templateUrl: '/calendar/month/template')
    .when('/calendar/:day/event/new' , 
      controller: MonthCalendarController
      templateUrl: '/event/new'
    )
    .otherwise { redirectTo: "/calendar/#{moment().format('M')}" }

app.factory "eventService", ($resource) ->
  events = [ ]
  load: () ->
    console.log "Load events from server"
  delete: (id) ->
    console.log "Delete Event"
  save: (event) ->
    console.log "Event"  


class @MonthCalendarController 
  constructor: ($scope, eventService, $routeParams, $location) ->
    $scope.loadEvents =  ->
      $scope.events = [
                  "01/01/2013":
                    title: "Meeting",
                  "02/01/2013":
                    title: "ix"  
                  ]

   $scope.newEvent = (day) ->
      $location.path "/event/new"


