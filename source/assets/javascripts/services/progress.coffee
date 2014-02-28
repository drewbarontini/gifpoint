@presenter.factory 'Progress', () ->
  currentSlide: 0

  registerProgress: (cb) =>
    @progressCallback = cb

  update: (num) =>
    @progressCallback(num)

