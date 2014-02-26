@presenter.directive 'progress', (Progress) ->
  restrict: 'E'
  replace: true
  scope: {}

  template: """
    <div class='progress'>

    </div>
  """

  link: (scope, element, attrs) ->

    Progress.registerProgress (val) ->
      element.css('width', "#{val * 100}%")

    scope.$on '$destroy', () ->
      Progress.registerProgress(null)
