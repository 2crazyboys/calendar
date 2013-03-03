angular.module("Scheduler").directive "openDialog", ->
  openDialog = link: (scope, element, attrs) ->
    openDialog = ->
      modal = angular.element("#eventModal")
      ctrl = modal.controller()
      ctrl.setModel(name: "scope.name", description: "scope.description")
      modal.modal("show")
    element.bind("click", openDialog)

  openDialog