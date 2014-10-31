(function() {
  var app = angular.module('GemStore');

  app.controller('StoreController', ['$http', '$scope', function($http, $scope) {
    $scope.products = [];
    $scope.product = {};
    $scope.product.persisted = false;

    $scope.index = function() {
      var params = window.location.search;
      var path = '/apiv1/products' + params;
      $http.get(path)
        .success(function(data) {
          $scope.products = data['products']
          $scope.products.forEach(function(product) {
            product.persisted = true;
          });
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };

    $scope.create = function(newProduct) {
      product = { product: newProduct }
      $http.post('/apiv1/products', product)
        .success(function(data) {
          data['product'].persisted = true;
          $scope.products.unshift(data['product']);
          $scope.product = {};
          $scope.makingNewProduct = false;
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };

    $scope.update = function(product) {
      sendProduct = { product: product };
      $http({
        method: 'PATCH',
        url: 'apiv1/products/' + product.id,
        data: product
      })
        .success(function(data) {
          product.sidebar = null;
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        })
    };

    $scope.destroy = function(product) {
      $http({
        method: 'DELETE',
        url: 'apiv1/products/' + product.id
      })
        .success(function() {
          product.sidebar = null;
          $scope.products.splice($scope.products.indexOf(product), 1);
        })
    };
  }]);
})();
