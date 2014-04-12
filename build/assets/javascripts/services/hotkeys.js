(function () {
  this.presenter.factory('Hotkeys', function ($document) {
    return {
      keys: {
        'left': 37,
        'right': 39,
        'space': 32,
        'escape': 27
      },
      register: function (_this) {
        return function (key, cb) {
          return $document.keydown(function (e) {
            switch (e.which) {
            case key:
              return cb();
            }
          });
        };
      }(this),
      off: function (_this) {
        return function () {
          return $document.off;
        };
      }(this)
    };
  });
}.call(this));