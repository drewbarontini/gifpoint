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
    element.css('background-image', "url(#{attrs.img})")

    scope.nextSlide = () ->
      unless element.next() == undefined
        slidesCtrl.updateProgress(element)
        element.addClass('is-lastActive').next().addClass('is-active')
      return

    scope.previousSlide = () ->
      unless element.prev() == undefined
        slidesCtrl.updateProgress(element)
        element.addClass('is-lastActive').prev().addClass('is-active')
      return

