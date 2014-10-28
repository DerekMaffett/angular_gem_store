//= require_self
//= require_tree ./gem_store_app

(function() {
  var app = angular.module('gemStore', ['store-directives']);

  app.controller('StoreController', ['$http', '$scope', function($http, $scope) {
    $scope.products = [];

    $http.get('/products.json').success(function(data) {
      $scope.products = data;
    });
  }]);

  app.controller('ReviewController', function() {
    this.review = {};

    this.addReview = function(product) {
      product.reviews.push(this.review);

      this.review = {};
    };
  });
})();
