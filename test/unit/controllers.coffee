describe 'Contact list app - ', ->
  beforeEach angular.mock.module 'contactList'

  describe 'controllers: ', ->
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
          templateUrl: "templates/contact_form.html"
          scope: $scope
          controller: 'AddContactFormCtrl'

        do $scope.addContact

        expect($modal.open).toHaveBeenCalledWith modalOptions

      it 'should set the ordering by default to be by first name', ->

        expect($scope.predicate).toBe 'firstname'

    describe 'Contact Controller', ->
      $scope = null
      $modal = null
      $q = null
      contact =
        firstname: 'Reedik'
        lastname: 'Tuuling'
        phone: '53810100'
        group: 'work'

      beforeEach inject ($rootScope, $controller, $injector) ->

        $modal = $injector.get '$modal'

        $q = $injector.get '$q'

        $scope = do $rootScope.$new

        $scope.contact = contact

        $controller 'ContactCtrl', {$scope: $scope, $modal: $modal}

      it 'should open up the modal with correct options', ->
#       because the $modal returns a promise, we have to create our own and return that
        deferred = $q.defer()

        spyOn($modal, 'open').and.returnValue
          result: deferred.promise

        modalOptions =
          templateUrl: "templates/contact_form.html"
          scope: $scope
          controller: 'EditContactFormCtrl'

        do $scope.editContact
#       we take the resolve object from the actual implementation because there is no other way to compare
        modalOptions.resolve = $modal.open.calls.mostRecent().args[0].resolve

#       we make sure that the contact object returns what we expect
        expect(do modalOptions.resolve.contact).toEqual $scope.contact

        expect($modal.open).toHaveBeenCalledWith modalOptions

      it 'should update the contact info after we have finished editing the form', ->

        deferred = $q.defer()

        newContact =
          firstname: 'Kaisa'
          lastname: 'Tuuling'
          phone: '53810100'
          group: 'work'

        spyOn($modal, 'open').and.returnValue
          result: deferred.promise

        do $scope.editContact

#       we resolve the promise by providing a new contact information
        deferred.resolve newContact
#       we have to run a digest because promises are async
        do $scope.$digest

        expect($scope.contact).toBe newContact

    describe 'AddContactForm Controller', ->
      $scope = null
      ContactList = null
      $modalInstance = null

      beforeEach inject ($rootScope, $controller, $injector) ->

        ContactList = $injector.get 'ContactList'

        $modalInstance =
          close: () ->

        $scope = do $rootScope.$new

        $controller 'AddContactFormCtrl', {$scope: $scope, $modalInstance: $modalInstance, ContactList: ContactList}

      it 'should set the $scope.form with default data', ->
        expect($scope.form).toEqual
          firstname: ''
          lastname: ''
          phone: ''
          group: ''

      it 'should set the $scope.action value correctly', ->
        expect($scope.action).toEqual 'Add'

      it 'should only add the new contact and close the modal when first name and phone are inserted', ->
        spyOn(ContactList, 'add')
        spyOn($modalInstance, 'close')

        do $scope.submit

        expect(ContactList.add).not.toHaveBeenCalled()
        expect($modalInstance.close).not.toHaveBeenCalled()

        $scope.form.firstname = 'Reedik'

        do $scope.submit

        expect(ContactList.add).not.toHaveBeenCalled()
        expect($modalInstance.close).not.toHaveBeenCalled()

        $scope.form.phone = '5381911101'

        do $scope.submit

        expect(ContactList.add).toHaveBeenCalled()
        expect($modalInstance.close).toHaveBeenCalled()

      it 'should pass the form data to ContactList service add method', ->
        spyOn(ContactList, 'add')
        spyOn($modalInstance, 'close')

        formData =
          firstname: 'Reedik'
          lastname: 'Tuulnig'
          phone: '324242'
          group: 'work'

        $scope.form = formData

        do $scope.submit

        expect(ContactList.add).toHaveBeenCalledWith formData
        expect($modalInstance.close).toHaveBeenCalled()

    describe 'EditContactForm Controller', ->
      $scope = null
      $modalInstance = null
      contact = null

      beforeEach inject ($rootScope, $controller, $injector) ->

        contact =
          firstname: 'Reedik'
          lastname: 'Tuulnig'
          phone: '324242'
          group: 'work'

        $modalInstance =
          close: () ->

        $scope = do $rootScope.$new

        $controller 'EditContactFormCtrl', {$scope: $scope, $modalInstance: $modalInstance, contact: contact}

      it 'should set the form data to be the contact information that is passed to the controller', ->
        expect($scope.form).toEqual contact

      it 'should set the $scope.action value correctly', ->
        expect($scope.action).toEqual 'Edit'

      it 'should only edit the contact and close the modal when first name and phone are inserted', ->
        spyOn($modalInstance, 'close')

        $scope.form.firstname = ''
        $scope.form.phone = ''

        do $scope.submit

        expect($modalInstance.close).not.toHaveBeenCalled()

        $scope.form.firstname = 'Reedik'

        do $scope.submit

        expect($modalInstance.close).not.toHaveBeenCalled()

        $scope.form.phone = '5381911101'

        do $scope.submit

        expect($modalInstance.close).toHaveBeenCalled()

      it 'should close the modal and resolve it with the form data', ->
        spyOn($modalInstance, 'close')

        do $scope.submit

        expect($modalInstance.close).toHaveBeenCalledWith contact

  describe 'services: ', ->
    describe 'ContactList service', ->
      ContactList = null

      beforeEach inject ($injector) ->

        ContactList = $injector.get 'ContactList'

      it 'should set a list parameter as an array', ->

        expect(angular.isArray ContactList.list).toBe true

      it 'should push a new item to the array when add method is called', ->

        newContact =
          firstname: 'Reedik'
          lastname: 'Tuulnig'
          phone: '324242'
          group: 'work'

        ContactList.add(newContact)

        expect(ContactList.list).toContain newContact
