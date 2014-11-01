(function() {
  var app = angular.module('GemStore');

  app.controller('AdminsController', ['$scope', '$http', '$cookieStore', '$location',
   function($scope, $http, $cookieStore, $location) {
    $scope.admin = {};
    $scope.newAdmin = {};

    $scope.signUp = function(admin) {
      data = { admin: admin };
      $http.post('/admins', data)
        .success(function(data) {
          $scope.newAdmin = {};
          $cookieStore.put('current_admin', data);
          $scope.setForm('');
          $location = '/products';
        })
        .error(function(data, status) {
          console.log(data);
          console.log(status);
        });
    };

    $scope.signIn = function(admin) {
      data = { admin: admin };
      $http.post('/admins/sign_in', data)
        .success(function(data) {
          $scope.admin = {};
          $cookieStore.put('current_admin', data);
          $scope.setForm('');
          $location = '/products';
        })
        .error(function(data, status) {
          console.log(data);
          console.log(status);
        });
    };

    $scope.signOut = function() {
      $http({
        method: 'DELETE',
        url: 'admins/sign_out'
      })
        .success(function() {
          $cookieStore.remove('current_admin');
          $scope.setForm('');
        })
        .error(function(status) {
          console.log(status);
        })
    };

    $scope.setForm = function(form) {
      $scope.form = form;
    };
  }]);
})();
