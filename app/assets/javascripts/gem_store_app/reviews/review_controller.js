(function() {
  var app = angular.module('GemStore');

  app.controller('ReviewController', ['$scope', function($scope) {
    $scope.newReview = {};

    $scope.addReview = function(product) {
      product.reviews.push($scope.newReview);

      $scope.newReview = {};
    };
  }]);
})();
