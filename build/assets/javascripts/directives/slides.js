(function(){this.presenter.directive("slides",function(Hotkeys,Progress){return{restrict:"E",replace:!0,scope:{activeSlide:"@activeSlide"},transclude:!0,controller:function($scope,$stateParams,$state,$location){return $scope.slides=[],$scope.sectionSlides=[],$scope.currentSlide=$stateParams.index||1,$scope.currentSectionSlide=0,$scope.activeSlide=!1,Hotkeys.register(Hotkeys.keys.space,function(_this){return function(){return _this.nextSlide()}}(this)),Hotkeys.register(Hotkeys.keys.right,function(_this){return function(){return _this.nextSlide()}}(this)),Hotkeys.register(Hotkeys.keys.left,function(_this){return function(){return _this.prevSlide()}}(this)),Hotkeys.register(Hotkeys.keys.s,function(_this){return function(){return _this.nextSectionSlide()}}(this)),this.registerSlide=function(_this){return function(slide){return $scope.slides.push(slide),_this.updateProgress(),slide===$scope.slides[$scope.currentSlide-1]&&(_this.updateProgress(),$scope.activeSlide=!$scope.activeSlide),$scope.slides.indexOf(slide)+1}}(this),this.registerSectionSlide=function(slide){return $scope.sectionSlides.push(slide)},this.nextSlide=function(_this){return function(){$scope.currentSlide>$scope.slides.length-1||($scope.currentSlide++,_this.setLocation())}}(this),this.prevSlide=function(_this){return function(){$scope.currentSlide<=1||($scope.currentSlide--,_this.setLocation())}}(this),this.nextSectionSlide=function(_this){return function(){$scope.currentSectionSlide!==$scope.sectionSlides.length-1?($scope.currentSectionSlide++,_this.setCurrentSectionSlide(),_this.setLocation()):($scope.currentSectionSlide=0,_this.setCurrentSectionSlide(),_this.setLocation())}}(this),this.setLocation=function(_this){return function(){$state.go("root",{index:$scope.currentSlide}),$location.path("/"+$scope.currentSlide),_this.updateProgress()}}(this),this.setCurrentSectionSlide=function(){var slide;return slide=$scope.sectionSlides[$scope.currentSectionSlide],$scope.currentSlide=$scope.slides.indexOf(slide)+1},this.updateProgress=function(){return Progress.update(parseInt($scope.currentSlide)/$scope.slides.length)},this.isActive=function(index){return index===parseInt($scope.currentSlide)},$scope.$on("$destroy",function(){return Hotkeys.off()}),this},template:"<div class='slides' ng-transclude>\n\n</div>"}})}).call(this);