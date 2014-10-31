(function() {
  var app = angular.module('GemStore');

  app.controller('StoreController', ['$http', '$scope', function($http, $scope) {
    $scope.products = [];

    $scope.index = function() {
      var params = window.location.search;
      var path = '/apiv1/products' + params;
      $http.get(path)
        .success(function(data) {
          console.log('index success');
          $scope.products = data['products'];
        })
        .error(function(data, status) {
          console.log('index error');
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };
  }]);
})();
