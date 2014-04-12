(function () {
  this.presenter.directive('ytVideo', function ($sce) {
    return {
      restrict: 'E',
      replace: true,
      scope: {
        height: '@',
        width: '@'
      },
      template: '<iframe width="{{width}}" height="{{height}}" ng-src="{{video}}" frameborder="0" allowfullscreen></iframe>',
      link: function (scope, element, attrs) {
        return scope.video = $sce.trustAsResourceUrl('http://www.youtube.com/embed/' + attrs.videoSrc + '?controls=0&showinfo=0');
      }
    };
  });
}.call(this));