@presenter.config ($stateProvider) ->

  $stateProvider.state 'root',
    reloadOnSearch: false
    url: '/:index'
    template: '<slide-loader></slide-loader>'
