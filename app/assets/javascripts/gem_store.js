//= require_self
//= require_tree ./gem_store_app

(function() {
  var app = angular.module('GemStore', ['StoreDirectives', 'ngRoute', 'ngCookies']);

  app.run(['$rootScope', '$cookieStore', function($rootScope, $cookieStore) {

    $rootScope.isLoggedIn = function() {
      return $cookieStore.get('current_admin') ? true : false;
    };

    $rootScope.current_user = function() {
      return $cookieStore.get('current_admin').email;
    };
  }])
})();
