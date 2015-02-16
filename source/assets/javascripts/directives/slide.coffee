# *************************************
#
#   Slide Directive
#
# *************************************

@presenter.directive 'slide', ->

  # -------------------------------------
  #   Properties
  # -------------------------------------

  require    : '^slides'
  restrict   : 'E'
  replace    : true
  scope      : {}
  transclude : true

  # -------------------------------------
  #   Template
  # -------------------------------------

  template : """
    <section class='slide' ng-transclude ng-class="{ 'is-active': activeSlide() }" ng-swipe-left='nextSlide()' ng-swipe-right='prevSlide()'>

    </section>
  """

  # -------------------------------------
  #   Link
  # -------------------------------------

  link : ( scope, element, attrs, slidesCtrl ) ->

    scope.index = slidesCtrl.registerSlide( element )

    slidesCtrl.registerSectionSlide( element ) if attrs.section?

    element.css( 'background-image', "url(#{ attrs.img })" ) if attrs.img?
    element.css( 'background-color', attrs.color ) if attrs.color?

    # ----- Active Slide ----- #

    scope.activeSlide = ->
      slidesCtrl.isActive( scope.index )

    # ----- Next Slide ----- #

    scope.nextSlide = ->
      slidesCtrl.nextSlide()

    # ----- Previous Slide ----- #

    scope.prevSlide = ->
      slidesCtrl.prevSlide()
