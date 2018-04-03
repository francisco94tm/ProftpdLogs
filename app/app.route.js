
angular.module('app')
.config(function ($routeProvider, $locationProvider) {
$routeProvider
    .when('/', {
        templateUrl: 'app/components/dashboard.view.html',
        controller: 'dashCtrl' 
    }) 
    .otherwise({
        redirectTo: '/'
    }); 
    // use the HTML5 History API
    $locationProvider.hashPrefix(''); 
}); 