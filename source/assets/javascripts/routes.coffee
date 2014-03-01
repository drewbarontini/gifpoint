@presenter.config ($stateProvider) ->

  $stateProvider.state 'root',
    url: '/:index'
    template: '<slide-loader></slide-loader>'
