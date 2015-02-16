# *************************************
#
#   Slide Loader Directive
#
# *************************************

@presenter.directive 'slideLoader', ( $timeout ) ->

  # -------------------------------------
  #   Properties
  # -------------------------------------

  restrict : 'E'
  replace  : true
  scope    : {}

  # -------------------------------------
  #   Template
  # -------------------------------------

  template : """
    <div ng-include='indexTemplate'></div>
  """

  # -------------------------------------
  #   Link
  # -------------------------------------

  link : ( scope, element, attrs ) ->
    $timeout ->
      scope.indexTemplate = 'index'
