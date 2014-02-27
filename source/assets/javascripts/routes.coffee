@presenter.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider.state('slides'
    url: '/:index'
    templateUrl: 'index.html'
  )

