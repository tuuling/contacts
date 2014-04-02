app = angular.module 'contactList', []

app.controller 'ContactListCtrl', ($scope) ->

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
    console.log('addcontanct')