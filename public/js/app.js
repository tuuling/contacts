(function() {
  var app;

  app = angular.module('contactList', ['ui.bootstrap']);

  app.controller('ContactListCtrl', function($scope, $modal, ContactList) {
    $scope.contactList = ContactList.list;
    $scope.addContact = function() {
      return $modal.open({
        templateUrl: "/templates/contact_form.html",
        scope: $scope,
        controller: 'AddContactFormCtrl'
      });
    };
    $scope.predicate = 'firstname';
  });

  app.controller('ContactCtrl', function($scope, $modal) {
    $scope.editContact = function() {
      var modalInstance;
      modalInstance = $modal.open({
        templateUrl: "/templates/contact_form.html",
        scope: $scope,
        controller: 'EditContactFormCtrl',
        resolve: {
          contact: function() {
            return $scope.contact;
          }
        }
      });
      return modalInstance.result.then(function(result) {
        return $scope.contact = result;
      });
    };
  });

  app.controller('AddContactFormCtrl', function($scope, $modalInstance, ContactList) {
    $scope.form = {
      firstname: '',
      lastname: '',
      phone: '',
      group: ''
    };
    $scope.action = 'Add';
    $scope.submit = function() {
      if ($scope.form.firstname && $scope.form.phone) {
        ContactList.add($scope.form);
        return $modalInstance.close();
      }
    };
  });

  app.controller('EditContactFormCtrl', function($scope, $modalInstance, contact) {
    $scope.form = angular.copy(contact);
    $scope.action = 'Edit';
    $scope.submit = function() {
      if ($scope.form.firstname && $scope.form.phone) {
        return $modalInstance.close($scope.form);
      }
    };
  });

  app.service('ContactList', function() {
    this.list = [
      {
        firstname: 'Reedik',
        lastname: 'Tuuling',
        phone: '53819100',
        group: 'work'
      }, {
        firstname: 'Dave',
        lastname: 'Murray',
        phone: '5341351',
        group: 'home'
      }, {
        firstname: 'Steve',
        lastname: 'Harris',
        phone: '5234623',
        group: 'work'
      }, {
        firstname: 'Janick',
        lastname: 'Gers',
        phone: '6432243',
        group: 'home'
      }
    ];
    this.add = function(formData) {
      return this.list.push(angular.copy(formData));
    };
  });

}).call(this);
