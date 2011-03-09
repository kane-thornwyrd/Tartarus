#
# Thx to [NoKarma](http://nokarma.org/2011/02/02/javascript-game-development-the-game-loop/index.html "Javascript Game Development - The Game Loop")
#

###
(() ->
	onEachFrame
	if window.webkitRequestAnimationFrame
		onEachFrame = (cb) ->
			_cb = () ->
				cb()
				webkitRequestAnimationFrame(_cb)
			_cb()
	else if window.mozRequestAnimationFrame
		onEachFrame = (cb) ->
			_cb = () ->
				cb()
				mozRequestAnimationFrame(_cb)
			_cb()
	else
		onEachFrame = (cb) ->
			setInterval cb, (1000/60)
	window.onEachFrame = onEachFrame
)()

class Game
	constructor : (@canva_id) ->
		@context = $(@canva_id).shift().getContext '2d'
		@entities = []
		@loops = 0
		@fps = 50
		@skipTicks = 1000 / @fps

	draw : (interpolation) ->
		entity.draw(@context, interpolation) for entity in @entities

	run : () ->
		@maxFrameSkip = 10
		@nextGameTick = (new Date).getTime()
		@lastGameTick
		() ->
			loops = 0
			while (new Date).getTime() > @nextGameTick
				Game.update()
				@nextGameTick += @skipTicks
				loops++
			if not loops
				Game.draw (@nextGameTick - (new Date).getTime()) / @skipTicks
			else
				Game.draw(0)
###
