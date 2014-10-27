(function() {
  var app = angular.module('gemStore', []);

  app.controller('StoreController', function(){
    this.products = gems;
  });

  var gems = [
    { name: 'Azurite', price: 110.50 },
    { name: 'Bloodstone', price: 5.00 },
    { name: 'Zircon', price: 1110.00 },
  ];
})();
