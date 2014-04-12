(function () {
  this.presenter.config(function ($stateProvider) {
    return $stateProvider.state('root', {
      reloadOnSearch: false,
      url: '/:index',
      template: '<slide-loader></slide-loader>'
    });
  });
}.call(this));