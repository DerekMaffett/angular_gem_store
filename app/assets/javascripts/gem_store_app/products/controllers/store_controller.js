(function() {
  var app = angular.module('GemStore');

  app.controller('StoreController', ['$http', '$scope', function($http, $scope) {
    $scope.products = [];

    $scope.index = function() {
      var params = window.location.search;
      var path = '/apiv1/products.json' + params;
      $http.get(path)
        .success(function(data) {
          $scope.products = data['products'];
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };
  }]);
})();
