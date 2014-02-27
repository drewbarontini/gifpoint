@presenter.directive 'slide', () ->
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

    scope.nextSlide = () ->
      unless element.next().length == 0
        slidesCtrl.updateProgress(element)
        element.removeClass('is-active').next().addClass('is-active')
      return

