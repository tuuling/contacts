app = angular.module 'contactList', ['ui.bootstrap']

app.controller 'ContactListCtrl', ($scope, $modal, ContactList) ->

  $scope.contactList = ContactList.list

  $scope.addContact = () ->
    $modal.open
      templateUrl: "templates/contact_form.html"
      scope: $scope
      controller: 'AddContactFormCtrl'

  $scope.predicate = 'firstname'

  return

app.controller 'ContactCtrl', ($scope, $modal) ->

  $scope.editContact = () ->
    modalInstance = $modal.open
      templateUrl: "templates/contact_form.html"
      scope: $scope
      controller: 'EditContactFormCtrl'
      resolve:
        contact: () ->
          $scope.contact

    modalInstance.result.then (result) ->
      $scope.contact = result

  return

app.controller 'AddContactFormCtrl', ($scope, $modalInstance, ContactList) ->
  $scope.form =
    firstname: ''
    lastname: ''
    phone: ''
    group: ''

  $scope.action = 'Add'

  $scope.submit = () ->
    if $scope.form.firstname and $scope.form.phone
      ContactList.add $scope.form
      do $modalInstance.close

  return

app.controller 'EditContactFormCtrl', ($scope, $modalInstance, contact) ->
  $scope.form = angular.copy contact

  $scope.action = 'Edit'

  $scope.submit = () ->
    if $scope.form.firstname and $scope.form.phone
      $modalInstance.close $scope.form

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