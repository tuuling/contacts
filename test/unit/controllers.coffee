describe 'Contact list app - ', ->
  describe 'controllers: ', ->

    beforeEach angular.mock.module 'contactList'

    describe 'ContactList Controller', ->
      ContactList = null
      $scope = null
      $modal = null

      beforeEach inject ($rootScope, $controller, $injector) ->

        ContactList = $injector.get 'ContactList'
        $modal = $injector.get '$modal'

        $scope = do $rootScope.$new

        $controller 'ContactListCtrl', {$scope: $scope, $modal: $modal, ContactList: ContactList}

      it 'should bind ContactList services list objet to $scope.contactList object', ->

        expect($scope.contactList).toBe ContactList.list

      it 'should call $modal.open with correct options when $scope.addContact is called', ->

        spyOn $modal, 'open'

        modalOptions =
          templateUrl: "/templates/add_contact.html"
          scope: $scope
          controller: 'AddContactCtrl'

        do $scope.addContact

        expect($modal.open).toHaveBeenCalledWith modalOptions

      it 'should set the ordering by default to be by first name', ->

        expect($scope.predicate).toBe 'firstname'
