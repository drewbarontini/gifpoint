@presenter.directive 'slideLoader', ['$timeout', ($timeout) ->
  restrict: 'E'
  replace: true
  scope: {}

  template: """
    <div ng-include='indexTemplate'></div>
  """

  link: (scope, element, attrs) ->
    $timeout ->
      scope.indexTemplate = 'index'
]
