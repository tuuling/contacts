(function() {
  var app;

  app = angular.module('contactList', ['ui.bootstrap']);

  app.controller('ContactListCtrl', function($scope, $modal, ContactList) {
    $scope.contactList = ContactList.list;
    return $scope.addContact = function() {
      return $modal.open({
        templateUrl: "/templates/add_contact.html",
        scope: $scope,
        controller: 'AddContactCtrl'
      });
    };
  });

  app.controller('AddContactCtrl', function($scope, $modalInstance, ContactList) {
    $scope.form = {
      firstname: '',
      lastname: '',
      phone: '',
      group: ''
    };
    $scope.submit = function() {
      if ($scope.form.firstname && $scope.form.phone) {
        ContactList.add($scope.form);
        return $modalInstance.close();
      }
    };
  });

  app.service('ContactList', function() {
    this.list = [];
    this.add = function(formData) {
      return this.list.push(angular.copy(formData));
    };
  });

}).call(this);
