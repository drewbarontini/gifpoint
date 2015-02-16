# *************************************
#
#   Progress Service
#
# *************************************

@presenter.factory 'Progress', () ->

  # -------------------------------------
  #   Register Progress
  # -------------------------------------

  registerProgress: ( callback ) =>
    @progressCallback = callback

  # -------------------------------------
  #   Update
  # -------------------------------------

  update: ( number ) =>
    @progressCallback( number )

