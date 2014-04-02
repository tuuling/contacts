(function() {
  var app;

  app = angular.module('contactList', []);

  app.controller('ContactListCtrl', function($scope) {
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
      return console.log('addcontanct');
    };
  });

}).call(this);
