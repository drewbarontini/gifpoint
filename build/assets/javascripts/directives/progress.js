(function () {
  this.presenter.directive('progress', function (Progress) {
    return {
      restrict: 'E',
      replace: true,
      scope: {},
      template: '<div class=\'progress\'>\n\n</div>',
      link: function (scope, element, attrs) {
        Progress.registerProgress(function (val) {
          return element.css('width', '' + val * 100 + '%');
        });
        return scope.$on('$destroy', function () {
          return Progress.registerProgress(null);
        });
      }
    };
  });
}.call(this));