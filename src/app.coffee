app = angular.module 'contactList', ['ui.bootstrap']

app.controller 'ContactListCtrl', ($scope, $modal) ->

  $scope.contactList = [
    firstname: 'Reedik'
    lastname: 'Tuuling'
    phone: '53241'
    group: 'work'
  ,
    firstname: 'Kaisa'
    lastname: 'Tuuling'
    phone: '53241'
    group: 'home'
  ,
    firstname: 'Oliver'
    lastname: 'Tuuling'
    phone: '53241'
    group: 'work'
  ]

  $scope.addContant = () ->
    $modal.open
      template: "<span>Modal opened</span>"