@presenter.directive 'slides', (Hotkeys, Progress) ->
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  controller: ($scope, $stateParams, $state, $timeout) ->
    $scope.slides = []
    $scope.currentSlide = $stateParams.index || 1

    Hotkeys.register Hotkeys.keys.space, => @nextSlide()
    Hotkeys.register Hotkeys.keys.right, => @nextSlide()
    Hotkeys.register Hotkeys.keys.left,  => @prevSlide()

    @registerSlide = (slide) =>
      $scope.slides.push(slide)
      @updateProgress()
      if slide == $scope.slides[$scope.currentSlide - 1]
        @updateProgress()
        $timeout -> slide.addClass('is-active')
      return

    @nextSlide = () =>
      unless $scope.currentSlide > $scope.slides.length - 1
        $scope.currentSlide++
        $state.go('root', { index: $scope.currentSlide })
        @updateProgress()
      return

    @prevSlide = () =>
      unless $scope.currentSlide <= 1
        $scope.currentSlide--
        $state.go('root', { index: $scope.currentSlide })
        @updateProgress()
      return

    @updateProgress = () ->
      Progress.update( parseInt($scope.currentSlide) / $scope.slides.length )

    $scope.$on '$destroy', () ->
      Hotkeys.off()

    @

  template: """
    <div class='slides' ng-transclude>

    </div>
  """
