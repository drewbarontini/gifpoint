!function(){this.presenter.directive("ytVideo",function(e){return{restrict:"E",replace:!0,scope:{height:"@",width:"@"},template:'<iframe width="{{width}}" height="{{height}}" ng-src="{{video}}" frameborder="0" allowfullscreen></iframe>',link:function(t,i,r){return t.video=e.trustAsResourceUrl("http://www.youtube.com/embed/"+r.videoSrc+"?controls=0&showinfo=0")}}})}.call(this);