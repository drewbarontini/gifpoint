@presenter.directive 'slide', () ->
  controller: 'SlidesCtrl'
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  template: """
    <div class='slide' ng-transclude ng-click='nextSlide()'>

    </div>
  """

  link: (scope, element, attrs) ->

    scope.nextSlide = () ->
      unless element.next() == undefined
        element.removeClass().addClass('is-lastActive').next().addClass('is-active')
      @

    element.css('background-image', "url(#{attrs.img})")
