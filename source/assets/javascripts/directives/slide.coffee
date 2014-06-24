@presenter.directive 'slide', () ->
  require: '^slides'
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  template: """
    <section class='slide' ng-transclude ng-class="{ 'is-active': activeSlide() }" ng-swipe-left='nextSlide()' ng-swipe-right='prevSlide()'>

    </section>
  """

  link: (scope, element, attrs, slidesCtrl) ->

    scope.index = slidesCtrl.registerSlide(element)
    slidesCtrl.registerSectionSlide(element) if attrs.section?

    element.css('background-image', "url(#{attrs.img})") if attrs.img?
    element.css('background-color', attrs.color) if attrs.color?

    scope.activeSlide = ->
      slidesCtrl.isActive(scope.index)

    scope.nextSlide = ->
      slidesCtrl.nextSlide()

    scope.prevSlide = ->
      slidesCtrl.prevSlide()

