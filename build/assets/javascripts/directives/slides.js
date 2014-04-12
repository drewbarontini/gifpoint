(function () {
  this.presenter.directive('slides', function (Hotkeys, Progress) {
    return {
      restrict: 'E',
      replace: true,
      scope: { activeSlide: '@activeSlide' },
      transclude: true,
      controller: function ($scope, $stateParams, $state, $location) {
        $scope.slides = [];
        $scope.currentSlide = $stateParams.index || 1;
        $scope.activeSlide = false;
        $scope.isPreviewing = false;
        Hotkeys.register(Hotkeys.keys.space, function (_this) {
          return function () {
            return _this.nextSlide();
          };
        }(this));
        Hotkeys.register(Hotkeys.keys.right, function (_this) {
          return function () {
            return _this.nextSlide();
          };
        }(this));
        Hotkeys.register(Hotkeys.keys.left, function (_this) {
          return function () {
            return _this.prevSlide();
          };
        }(this));
        Hotkeys.register(Hotkeys.keys.escape, function (_this) {
          return function () {
            return _this.setPreviewState();
          };
        }(this));
        this.registerSlide = function (_this) {
          return function (slide) {
            $scope.slides.push(slide);
            _this.updateProgress();
            if (slide === $scope.slides[$scope.currentSlide - 1]) {
              _this.updateProgress();
              $scope.activeSlide = !$scope.activeSlide;
            }
            return $scope.slides.indexOf(slide) + 1;
          };
        }(this);
        this.nextSlide = function (_this) {
          return function () {
            if (!($scope.currentSlide > $scope.slides.length - 1)) {
              $scope.currentSlide++;
              $state.go('root', { index: $scope.currentSlide });
              $location.path('/' + $scope.currentSlide);
              _this.updateProgress();
            }
          };
        }(this);
        this.prevSlide = function (_this) {
          return function () {
            if (!($scope.currentSlide <= 1)) {
              $scope.currentSlide--;
              $state.go('root', { index: $scope.currentSlide });
              $location.path('/' + $scope.currentSlide);
              _this.updateProgress();
            }
          };
        }(this);
        this.setPreviewState = function () {
          $scope.isPreviewing = !$scope.isPreviewing;
          return $scope.$apply();
        };
        this.updateProgress = function () {
          return Progress.update(parseInt($scope.currentSlide) / $scope.slides.length);
        };
        this.isActive = function (index) {
          return index === parseInt($scope.currentSlide);
        };
        $scope.$on('$destroy', function () {
          return Hotkeys.off();
        });
        return this;
      },
      template: '<div class=\'slides\' ng-transclude ng-class="{ \'is-previewing\': isPreviewing }">\n\n</div>'
    };
  });
}.call(this));