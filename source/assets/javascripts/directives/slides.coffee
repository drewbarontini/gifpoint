# *************************************
#
#   Slides Directive
#
# *************************************

@presenter.directive 'slides', ( Hotkeys, Progress ) ->

  # -------------------------------------
  #   Properties
  # -------------------------------------

  restrict      : 'E'
  replace       : true
  scope         :
    activeSlide : '@activeSlide'
  transclude    : true

  # -------------------------------------
  #   Template
  # -------------------------------------

  template: """
    <div class='slides' ng-transclude>

    </div>
  """

  # -------------------------------------
  #   Controller
  # -------------------------------------

  controller: ( $scope, $stateParams, $state, $location ) ->
    $scope.slides              = []
    $scope.sectionSlides       = []
    $scope.currentSlide        = $stateParams.index || 1
    $scope.currentSectionSlide = 0
    $scope.activeSlide         = false

    Hotkeys.register Hotkeys.keys.space,   => @nextSlide()
    Hotkeys.register Hotkeys.keys.right,   => @nextSlide()
    Hotkeys.register Hotkeys.keys.left,    => @prevSlide()
    Hotkeys.register Hotkeys.keys.s,       => @nextSectionSlide()

    # ----- Register Slide ----- #

    @registerSlide = ( slide ) =>
      $scope.slides.push( slide )
      @updateProgress()

      if slide == $scope.slides[ $scope.currentSlide - 1 ]
        @updateProgress()
        $scope.activeSlide = !$scope.activeSlide

      $scope.slides.indexOf(slide) + 1

    # ----- Register Section Slide ----- #

    @registerSectionSlide = ( slide ) ->
      $scope.sectionSlides.push( slide )

    # ----- Next Slide ----- #

    @nextSlide = =>
      unless $scope.currentSlide > $scope.slides.length - 1
        $scope.currentSlide++
        @setLocation()
      return

    # ----- Previous Slide ----- #

    @prevSlide = =>
      unless $scope.currentSlide <= 1
        $scope.currentSlide--
        @setLocation()
      return

    # ----- Next Section Slide ----- #

    @nextSectionSlide = =>
      unless $scope.sectionSlides.length == 0
        unless $scope.currentSectionSlide == $scope.sectionSlides.length - 1
          $scope.currentSectionSlide++
          @setCurrentSectionSlide()
          @setLocation()
        else
          $scope.currentSectionSlide = 0
          @setCurrentSectionSlide()
          @setLocation()
      return

    # ----- Set Location ----- #

    @setLocation = =>
      $state.go( 'root', { index: $scope.currentSlide } )
      $location.path( "/#{ $scope.currentSlide }" )
      @updateProgress()
      return

    # ----- Set Current Section Slide ----- #

    @setCurrentSectionSlide = ->
      slide = $scope.sectionSlides[ $scope.currentSectionSlide ]
      $scope.currentSlide = $scope.slides.indexOf( slide ) + 1

    # ----- Update Progress ----- #

    @updateProgress = ->
      Progress.update( parseInt( $scope.currentSlide ) / $scope.slides.length )

    # ----- Is Active ----- #

    @isActive = ( index ) ->
      index == parseInt($scope.currentSlide)

    # ----- Destroy ----- #

    $scope.$on '$destroy', () ->
      Hotkeys.off()

    @
