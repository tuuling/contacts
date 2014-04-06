app = angular.module 'contactList', ['ui.bootstrap']

app.controller 'ContactListCtrl', ($scope, $modal, ContactList) ->

  $scope.contactList = ContactList.list

  $scope.addContact = () ->
    $modal.open
      templateUrl: "/templates/add_contact.html"
      scope: $scope
      controller: 'AddContactCtrl'

  $scope.predicate = 'firstname'

  return

app.controller 'ContactCtrl', ($scope) ->

  return

app.controller 'AddContactCtrl', ($scope, $modalInstance, ContactList) ->
  $scope.form =
    firstname: ''
    lastname: ''
    phone: ''
    group: ''

  $scope.submit = () ->
    if $scope.form.firstname and $scope.form.phone
      ContactList.add $scope.form
      do $modalInstance.close

  return



app.service 'ContactList', () ->

  @list = [
    firstname:'Reedik'
    lastname:'Tuuling'
    phone:'53819100'
    group:'work'
  ,
    firstname:'Dave'
    lastname:'Murray'
    phone:'5341351'
    group:'home'
  ,
    firstname:'Steve'
    lastname:'Harris'
    phone:'5234623'
    group:'work'
  ,
    firstname:'Janick'
    lastname:'Gers'
    phone:'6432243'
    group:'home'
  ]

  @add = (formData) ->
    @list.push angular.copy formData

  return