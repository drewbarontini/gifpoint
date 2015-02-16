# *************************************
#
#   YouTube Video Directive
#
# *************************************

@presenter.directive 'ytVideo', ( $sce ) ->

  # -------------------------------------
  #   Properties
  # -------------------------------------

  restrict : 'E'
  replace  : true
  scope    :
    height : '@'
    width  : '@'

  # -------------------------------------
  #   Template
  # -------------------------------------

  template: """
    <iframe width="{{width}}" height="{{height}}" ng-src="{{video}}" frameborder="0" allowfullscreen></iframe>
  """

  # -------------------------------------
  #   Link
  # -------------------------------------

  link: ( scope, element, attrs ) ->
    scope.video = $sce.trustAsResourceUrl( "http://www.youtube.com/embed/#{ attrs.videoSrc }?controls=0&showinfo=0" )
