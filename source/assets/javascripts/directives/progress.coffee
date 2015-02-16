# *************************************
#
#   Progress Directive
#
# *************************************

@presenter.directive 'progress', ( Progress ) ->

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
    <div class='progress'>

    </div>
  """

  # -------------------------------------
  #   Link
  # -------------------------------------

  link : ( scope, element, attrs ) ->

    Progress.registerProgress ( value ) ->
      element.css( 'width', "#{ value * 100 }%" )

    scope.$on '$destroy', () ->
      Progress.registerProgress( null )
