app = angular.module 'contactList', ['ui.bootstrap']

app.controller 'ContactListCtrl', ($scope, $modal, ContactList) ->

  $scope.contactList = ContactList.list

  $scope.addContact = () ->
    $modal.open
      templateUrl: "/templates/add_contact.html"
      scope: $scope
      controller: 'AddContactCtrl'

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

  @list = []

  @add = (formData) ->
    @list.push angular.copy formData

  return