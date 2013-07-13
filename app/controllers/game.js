var Game = function () {
  this.index = function (req, resp, params) {

    this.respond(params, {
      format: 'html',
      template: 'app/views/game/index',
      layout: false
    });
  };
};

exports.Game = Game;


