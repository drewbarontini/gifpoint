@presenter.factory 'Progress', () ->

  registerProgress: (cb) =>
    @progressCallback = cb

  update: (num) =>
    @progressCallback(num)

