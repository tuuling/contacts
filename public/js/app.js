(function() {
  var app;

  app = angular.module('contactList', []);

  app.controller('appCtrl', function($scope) {
    return $scope.name = 'Testname';
  });

}).call(this);
