(function() {
  var app = angular.module('GemStore');

  app.controller('ReviewController', ['$scope', '$http', function($scope, $http) {
    $scope.newReview = {};

    $scope.addReview = function(product) {
      review = { review: $scope.newReview };
      $http.post('/apiv1/products/' + product.id + '/reviews', review)
        .success(function(data) {
          product.reviews.push(data['review']);
          $scope.newReview = {};
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };
  }]);
})();
