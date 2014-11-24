'use strict';

var modules = ['ui.router'];

var scrollToTop = function () {
  $('html, body').animate({ scrollTop: 0 }, 10);
}

var apprenticeship = angular.module('apprenticeship', modules)
  .controller('appController', ['$scope', function($scope) {
  }])

apprenticeship.config(function($locationProvider) {
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  });
});

apprenticeship.config(function($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
    .state('/', {
      url: "/",
      templateUrl: "views/index.html",
      onEnter: scrollToTop
    })
    .state('developer_programs', {
      url: "/dev_programs",
      templateUrl: "views/dev_programs.html",
      onEnter: scrollToTop
    })
    .state('designer_programs', {
      url: "/designer_programs",
      templateUrl: "views/designer_programs.html",
      onEnter: scrollToTop
    })
    .state('developer_apply', {
      url: "/developer_apply",
      templateUrl: "views/applicant_form_dev.html",
      onEnter: scrollToTop
    })
    .state('designer_apply', {
      url: "/designer_apply",
      templateUrl: "views/applicant_form_designer.html",
      onEnter: scrollToTop
    })
    .state('success', {
      url: "/success",
      templateUrl: "views/success.html",
      onEnter: scrollToTop
    });
});
