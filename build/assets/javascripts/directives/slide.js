!function(){this.presenter.directive("slide",function(){return{require:"^slides",restrict:"E",replace:!0,scope:{},transclude:!0,template:"<section class='slide' ng-transclude ng-class=\"{ 'is-active': activeSlide() }\">\n\n</section>",link:function(e,i,n,t){return e.index=t.registerSlide(i),null!=n.img&&i.css("background-image","url("+n.img+")"),e.activeSlide=function(){return t.isActive(e.index)}}}})}.call(this);