var app = angular.module('market', []);
app.controller('urunislemleri', function ($scope,$http) {
    $http.get("https://localhost:44385/api/Product/TumUrunleriGetir")
        .then(function (response) {
            $scope.products = response.data;
        });
    $scope.urunsil = function (silinecekID)
    {
        $http.get("https://localhost:44385/api/Product/UrunSil/", { params: { id: silinecekID } })
            .then(function (response) {
                $scope.products = response.data;
            });
    }
});