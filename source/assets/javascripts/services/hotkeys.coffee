@presenter.factory 'Hotkeys', ($document) ->
  keys: {
    'left'  : 37
    'right' : 39
    'space' : 32
  }

  register: (key, cb) =>
    $document.keydown (e) =>
      switch e.which
        when key then cb()

  off: () =>
    $document.off

