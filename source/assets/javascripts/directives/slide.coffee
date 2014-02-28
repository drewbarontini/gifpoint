@presenter.directive 'slide', (Hotkeys) ->
  require: '^slides'
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  template: """
    <div class='slide' ng-transclude ng-click='nextSlide()'>

    </div>
  """

  link: (scope, element, attrs, slidesCtrl) ->

    slidesCtrl.registerSlide(element)

    element.css('background-image', "url(#{attrs.img})") if attrs.img?

    scope.nextSlide = () -> slidesCtrl.nextSlide(element)
    scope.prevSlide = () -> slidesCtrl.prevSlide(element)

