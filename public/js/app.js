(function() {
  var app;

  app = angular.module('contactList', ['ui.bootstrap']);

  app.controller('ContactListCtrl', function($scope, $modal) {
    $scope.contactList = [
      {
        firstname: 'Reedik',
        lastname: 'Tuuling',
        phone: '53241',
        group: 'work'
      }, {
        firstname: 'Kaisa',
        lastname: 'Tuuling',
        phone: '53241',
        group: 'home'
      }, {
        firstname: 'Oliver',
        lastname: 'Tuuling',
        phone: '53241',
        group: 'work'
      }
    ];
    return $scope.addContant = function() {
      return $modal.open({
        template: "<span>Modal opened</span>"
      });
    };
  });

}).call(this);
