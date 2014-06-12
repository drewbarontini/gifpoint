(function(){this.presenter=angular.module("Presenter",["ui.router","ngTouch"])}).call(this),function(){this.presenter.config(function($stateProvider){return $stateProvider.state("root",{reloadOnSearch:!1,url:"/:index",template:"<slide-loader></slide-loader>"})})}.call(this),function(){this.presenter.factory("Progress",function(){return{registerProgress:function(_this){return function(cb){return _this.progressCallback=cb}}(this),update:function(_this){return function(num){return _this.progressCallback(num)}}(this)}})}.call(this),function(){this.presenter.factory("Hotkeys",function($document){return{keys:{left:37,right:39,space:32,escape:27},register:function(){return function(key,cb){return $document.keydown(function(e){switch(e.which){case key:return cb()}})}}(this),off:function(){return function(){return $document.off}}(this)}})}.call(this),function(){this.presenter.directive("progress",function(Progress){return{restrict:"E",replace:!0,scope:{},template:"<div class='progress'>\n\n</div>",link:function(scope,element){return Progress.registerProgress(function(val){return element.css("width",""+100*val+"%")}),scope.$on("$destroy",function(){return Progress.registerProgress(null)})}}})}.call(this),function(){this.presenter.directive("slideLoader",function($timeout){return{restrict:"E",replace:!0,scope:{},template:"<div ng-include='indexTemplate'></div>",link:function(scope){return $timeout(function(){return scope.indexTemplate="index"})}}})}.call(this),function(){this.presenter.directive("slides",function(Hotkeys,Progress){return{restrict:"E",replace:!0,scope:{activeSlide:"@activeSlide"},transclude:!0,controller:function($scope,$stateParams,$state,$location){return $scope.slides=[],$scope.currentSlide=$stateParams.index||1,$scope.activeSlide=!1,Hotkeys.register(Hotkeys.keys.space,function(_this){return function(){return _this.nextSlide()}}(this)),Hotkeys.register(Hotkeys.keys.right,function(_this){return function(){return _this.nextSlide()}}(this)),Hotkeys.register(Hotkeys.keys.left,function(_this){return function(){return _this.prevSlide()}}(this)),this.registerSlide=function(_this){return function(slide){return $scope.slides.push(slide),_this.updateProgress(),slide===$scope.slides[$scope.currentSlide-1]&&(_this.updateProgress(),$scope.activeSlide=!$scope.activeSlide),$scope.slides.indexOf(slide)+1}}(this),this.nextSlide=function(_this){return function(){$scope.currentSlide>$scope.slides.length-1||($scope.currentSlide++,$state.go("root",{index:$scope.currentSlide}),$location.path("/"+$scope.currentSlide),_this.updateProgress())}}(this),this.prevSlide=function(_this){return function(){$scope.currentSlide<=1||($scope.currentSlide--,$state.go("root",{index:$scope.currentSlide}),$location.path("/"+$scope.currentSlide),_this.updateProgress())}}(this),this.updateProgress=function(){return Progress.update(parseInt($scope.currentSlide)/$scope.slides.length)},this.isActive=function(index){return index===parseInt($scope.currentSlide)},$scope.$on("$destroy",function(){return Hotkeys.off()}),this},template:"<div class='slides' ng-transclude>\n\n</div>"}})}.call(this),function(){this.presenter.directive("slide",function(){return{require:"^slides",restrict:"E",replace:!0,scope:{},transclude:!0,template:"<section class='slide' ng-transclude ng-class=\"{ 'is-active': activeSlide() }\" ng-swipe-left='nextSlide()' ng-swipe-right='prevSlide()'>\n\n</section>",link:function(scope,element,attrs,slidesCtrl){return scope.index=slidesCtrl.registerSlide(element),null!=attrs.img&&element.css("background-image","url("+attrs.img+")"),null!=attrs.color&&element.css("background-color",attrs.color),scope.activeSlide=function(){return slidesCtrl.isActive(scope.index)},scope.nextSlide=function(){return slidesCtrl.nextSlide()},scope.prevSlide=function(){return slidesCtrl.prevSlide()}}}})}.call(this),function(){this.presenter.directive("ytVideo",function($sce){return{restrict:"E",replace:!0,scope:{height:"@",width:"@"},template:'<iframe width="{{width}}" height="{{height}}" ng-src="{{video}}" frameborder="0" allowfullscreen></iframe>',link:function(scope,element,attrs){return scope.video=$sce.trustAsResourceUrl("http://www.youtube.com/embed/"+attrs.videoSrc+"?controls=0&showinfo=0")}}})}.call(this),function(){}.call(this);