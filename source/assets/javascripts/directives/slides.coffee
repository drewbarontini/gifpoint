@presenter.directive 'slides', () ->
  restrict: 'E'
  replace: true
  scope: {}
  transclude: true

  controller: ($scope, Progress) ->
    $scope.slides = []

    @registerSlide = (slide) ->
      $scope.slides.push(slide)

    @updateProgress = (slide) ->
      Progress.update(($scope.slides.indexOf(slide) + 2) / $scope.slides.length)

    @

  template: """
    <div class='slides' ng-transclude>

    </div>
  """

  link: (scope, element, attrs) ->

