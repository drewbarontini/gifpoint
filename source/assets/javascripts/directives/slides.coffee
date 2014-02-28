@presenter.directive 'slides', (Hotkeys, Progress) ->
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  controller: ($scope) ->
    $scope.slides = []

    @registerSlide = (slide) ->
      $scope.slides.push(slide)

    @nextSlide = (slide) ->
      unless slide.next().length == 0
        @updateProgress(slide)
        slide.removeClass('is-active').next().addClass('is-active')
      return

    @prevSlide = (slide) ->
      unless slide.prev().length == 0
        @updateProgress(slide)
        slide.removeClass('is-active').prev().addClass('is-active')
      return

    @updateProgress = (slide) ->
      Progress.currentSlide = $scope.slides.indexOf(slide)
      Progress.update(($scope.slides.indexOf(slide) + 2) / $scope.slides.length)

    @

  template: """
    <div class='slides' ng-transclude>

    </div>
  """

  link: (scope, element, attrs, slidesCtrl) ->

    #Hotkeys.register Hotkeys.keys.space, ->
      #slidesCtrl.nextSlide( slidesCtrl.slides[Progress.currentSlide] )

