!function(){this.presenter.factory("Hotkeys",function(t){return{keys:{left:37,right:39,space:32},register:function(n,e){return t.keydown(function(t){switch(t.which){case n:return e()}})},off:function(){return t.off}}})}.call(this);