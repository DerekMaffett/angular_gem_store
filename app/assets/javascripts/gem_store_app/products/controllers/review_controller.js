(function() {
  var app = angular.module('gemStore');

  app.controller('ReviewController', ['$scope', function($scope) {
    $scope.review = {};

    $scope.addReview = function(product) {
      product.reviews.push($scope.review);

      $scope.review = {};
    };
  }]);
})();
