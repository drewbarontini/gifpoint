@presenter.directive 'progress', () ->
  controller: 'SlidesCtrl'
  restrict: 'E'
  replace: true
  scope: {}

  template: """
    <div class='progress'>

    </div>
  """

  link: (scope, element, attrs) ->

    element.css('width', scope.progress())
