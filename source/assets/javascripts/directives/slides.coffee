@presenter.directive 'slides', (Hotkeys, Progress) ->
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  controller: ($scope, $stateParams, $state) ->
    $scope.slides = []
    $scope.currentSlide = $stateParams.index || 1

    Hotkeys.register Hotkeys.keys.space, => @nextSlide()
    Hotkeys.register Hotkeys.keys.right, => @nextSlide()
    Hotkeys.register Hotkeys.keys.left,  => @prevSlide()

    @registerSlide = (slide) ->
      $scope.slides.push(slide)
      @updateProgress()
      if slide == $scope.slides[$scope.currentSlide - 1]
        @updateProgress()
        slide.addClass('is-active')
      return

    @nextSlide = () =>
      unless $scope.currentSlide == $scope.slides.length - 1
        $scope.slides[$scope.currentSlide].removeClass('is-active')
        $scope.currentSlide++
        @updateProgress()
        $scope.slides[$scope.currentSlide].addClass('is-active')
      return

    @prevSlide = () =>
      unless $scope.currentSlide == 0
        $scope.slides[$scope.currentSlide].removeClass('is-active')
        $scope.currentSlide--
        @updateProgress()
        $scope.slides[$scope.currentSlide].addClass('is-active')
      return

    @updateProgress = () ->
      Progress.update( parseInt($scope.currentSlide) / ($scope.slides.length - 1) )

    @

  template: """
    <div class='slides' ng-transclude>

    </div>
  """

