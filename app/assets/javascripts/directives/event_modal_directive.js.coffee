angular.module("Scheduler").directive "openDialog", ->
  openDialog = 
  	restrict: "A",
  	link: (scope, element, attrs) ->
    openDialog = ->
      console.log scope.$eval(attrs.openDialog)
      modal = angular.element("#eventModal")
      ctrl = modal.controller()
      ctrl.setModel(name: "Joao", description: "Thiago")
      modal.modal("show")
    element.bind("click", openDialog)

  openDialog