# *************************************
#
#   Hotkeys Service
#
# *************************************

@presenter.factory 'Hotkeys', ( $document ) ->

  # -------------------------------------
  #   Keys
  # -------------------------------------

  keys:
    'left'   : 37
    'right'  : 39
    'space'  : 32
    'escape' : 27
    's'      : 83

  # -------------------------------------
  #   Register
  # -------------------------------------

  register: ( key, callback ) =>
    $document.keydown ( event ) =>
      switch event.which
        when key then callback()

  # -------------------------------------
  #   Off
  # -------------------------------------

  off: =>
    $document.off
