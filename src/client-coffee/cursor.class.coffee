class Cursor
	constructor : (@canva, @base = 8) ->
	render_at : (x, y) ->
		@canva.polygone [[x,y],
			[x+(@base * 4), y+(@base * 2)],
			[x+(@base * 2), y+(@base * 2)],
			[x+(@base * 2), y+(@base * 4)],
			[x,y]], '#f00', '#fff', @base/4
		@canva.polygone [[x,y],
			[x+(@base * 2), y+(@base * 2)],
			[x+(@base * 2), y+(@base * 4)],
			[x,y]], '#500', false, 0
