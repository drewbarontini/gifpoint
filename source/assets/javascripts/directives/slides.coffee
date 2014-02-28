@presenter.directive 'slides', (Hotkeys, Progress) ->
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  controller: ($scope, $stateParams, $state) ->
    $scope.slides = []
    $scope.currentSlide = $stateParams.index || 0

    Hotkeys.register Hotkeys.keys.space, => @nextSlide()
    Hotkeys.register Hotkeys.keys.right, => @nextSlide()
    Hotkeys.register Hotkeys.keys.left,  => @prevSlide()

    @registerSlide = (slide) ->
      $scope.slides.push(slide)
      @updateProgress()

      if slide == $scope.slides[$stateParams.index] and $scope.currentSlide != 0
        $scope.slides[$scope.currentSlide - 1].addClass('is-active')
      else
        $scope.slides[$scope.currentSlide].addClass('is-active')

    @nextSlide = () =>
      unless $scope.currentSlide == $scope.slides.length - 1
        $scope.slides[$scope.currentSlide].removeClass('is-active')
        $scope.currentSlide++
        @updateProgress()
        $scope.slides[$scope.currentSlide].addClass('is-active')

    @prevSlide = () =>
      unless $scope.currentSlide == 0
        $scope.slides[$scope.currentSlide].removeClass('is-active')
        $scope.currentSlide--
        @updateProgress()
        $scope.slides[$scope.currentSlide].addClass('is-active')

    @updateProgress = () ->
      Progress.update( ($scope.currentSlide + 1) / $scope.slides.length )

    @

  template: """
    <div class='slides' ng-transclude>

    </div>
  """

