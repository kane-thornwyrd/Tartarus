class Perso
	constructor : (id) ->
		@dirs = {
			'top' : {
			dir: top
			op: {}
			}
		}
		@graphic = $ "##{id}"
		@position = {
			top : @grpahic.offset().top - $('#main').offset().top
			left : @grpahic.offset().left - $('#main').offset().left
		}
		@dir = 0

	turn : (dir) ->
		@graphic
