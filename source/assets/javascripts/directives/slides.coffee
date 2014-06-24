@presenter.directive 'slides', (Hotkeys, Progress) ->
  restrict: 'E'
  replace: true
  scope: {
    activeSlide: '@activeSlide'
  }
  transclude: true

  controller: ($scope, $stateParams, $state, $location) ->
    $scope.slides = []
    $scope.sectionSlides = []
    $scope.currentSlide = $stateParams.index || 1
    $scope.currentSectionSlide = 0
    $scope.activeSlide = false

    Hotkeys.register Hotkeys.keys.space,   => @nextSlide()
    Hotkeys.register Hotkeys.keys.right,   => @nextSlide()
    Hotkeys.register Hotkeys.keys.left,    => @prevSlide()

    unless $scope.sectionSlides.length == 0
      Hotkeys.register Hotkeys.keys.s, => @nextSectionSlide()

    @registerSlide = (slide) =>
      $scope.slides.push(slide)
      @updateProgress()
      if slide == $scope.slides[$scope.currentSlide - 1]
        @updateProgress()
        $scope.activeSlide = !$scope.activeSlide
      $scope.slides.indexOf(slide) + 1

    @registerSectionSlide = (slide) ->
      $scope.sectionSlides.push(slide)

    @nextSlide = () =>
      unless $scope.currentSlide > $scope.slides.length - 1
        $scope.currentSlide++
        @setLocation()
      return

    @prevSlide = () =>
      unless $scope.currentSlide <= 1
        $scope.currentSlide--
        @setLocation()
      return

    @nextSectionSlide = () =>
      unless $scope.currentSectionSlide == $scope.sectionSlides.length - 1
        $scope.currentSectionSlide++
        @setCurrentSectionSlide()
        @setLocation()
      else
        $scope.currentSectionSlide = 0
        @setCurrentSectionSlide()
        @setLocation()
      return

    @setLocation = () =>
      $state.go('root', { index: $scope.currentSlide })
      $location.path("/#{$scope.currentSlide}")
      @updateProgress()
      return

    @setCurrentSectionSlide = () ->
      slide = $scope.sectionSlides[$scope.currentSectionSlide]
      $scope.currentSlide = $scope.slides.indexOf(slide) + 1

    @updateProgress = () ->
      Progress.update( parseInt($scope.currentSlide) / $scope.slides.length )

    @isActive = (index) ->
      index == parseInt($scope.currentSlide)

    $scope.$on '$destroy', () ->
      Hotkeys.off()

    @

  template: """
    <div class='slides' ng-transclude>

    </div>
  """
