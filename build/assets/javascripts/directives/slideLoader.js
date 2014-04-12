(function () {
  this.presenter.directive('slideLoader', function ($timeout) {
    return {
      restrict: 'E',
      replace: true,
      scope: {},
      template: '<div ng-include=\'indexTemplate\'></div>',
      link: function (scope, element, attrs) {
        return $timeout(function () {
          return scope.indexTemplate = 'index';
        });
      }
    };
  });
}.call(this));