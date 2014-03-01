@presenter.directive 'slide', () ->
  require: '^slides'
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  template: """
    <div class='slide' ng-transclude>

    </div>
  """

  link: (scope, element, attrs, slidesCtrl) ->

    slidesCtrl.registerSlide(element)

    element.css('background-image', "url(#{attrs.img})") if attrs.img?
