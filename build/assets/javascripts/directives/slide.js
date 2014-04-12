(function () {
  this.presenter.directive('slide', function () {
    return {
      require: '^slides',
      restrict: 'E',
      replace: true,
      scope: {},
      transclude: true,
      template: '<section class=\'slide\' ng-transclude ng-class="{ \'is-active\': activeSlide() }">\n\n</section>',
      link: function (scope, element, attrs, slidesCtrl) {
        scope.index = slidesCtrl.registerSlide(element);
        if (attrs.img != null) {
          element.css('background-image', 'url(' + attrs.img + ')');
        }
        return scope.activeSlide = function () {
          return slidesCtrl.isActive(scope.index);
        };
      }
    };
  });
}.call(this));