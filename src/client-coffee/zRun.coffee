# C'est en quelque sorte le _main_ du programme.
# Le _z_ au début du nom permettant de la placer tout en bas de la 
# concaténation effectuée par le compilateur CoffeeScript.

# g = new Game()


focusTaken = false

canva	=	new Canvas2D 'screen'

drawPointer = (e) ->
	canva.clear()
	y = e.pageY - $('#main').offset().top
	x = e.pageX - $('#main').offset().left
	curs = new Cursor(canva, 4).render_at x, y
	true

$('#main').bind {
	mouseenter : (e) ->
		focusTaken = true
		drawPointer e
	mouseout : (e) ->
		focusTaken = false
		canva.clear()
	mousemove : (e) ->
		drawPointer e
}

$(document).bind {
	keypress : (e) ->
		if focusTaken
			e.preventDefault()
			console.log e.which
			
			false
	keydown : (e) ->
		if focusTaken
			e.preventDefault()
			console.log e.which
			false
}

$('#main').append '<div id="perso"/>'
$('#perso').css {
	'z-index' : 0
}

$('#screen').css {
	'z-index' : 10
}

#window.onEachFrame g.run()
