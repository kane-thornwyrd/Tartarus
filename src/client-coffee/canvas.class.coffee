# 
# Classe d'abstraction de la balise HTML 5 `<Canvas>`,
# utile si ça vous ennuis d'employer _50000 methodes_ juste pour tracer un 
# malheureux polygone.
# 
# À noter que, comme toute mes classes, chaque méthode renvoie l'objet,
# ce qui les rend donc **chaînable**.
# 
#
class Canvas2D
# ## constructor
# 
# * elementId : ID de l'élément HTML5 canvas à utiliser pour le rendu.
	constructor: (@elementId) ->
		@context = (document.getElementById @elementId).getContext '2d'


	clear : =>
		@context.clearRect 0, 0, (document.getElementById @elementId).width, (document.getElementById @elementId).height


# ## circle
# Ajoute un cercle au canvas.
# 
# * color : couleur du cercle.
# * left : position depuis la gauche du canvas.
# * top : position depuis le haut du canvas.
# * radius : rayon du cercle.
	circle: (color = '#ffffff', left, top, radius, startAngle = 6, endAngle = Math.PI*2, antiClockwise = true ) =>
		@context.beginPath()
		@context.fillStyle = color
		@context.arc left, top, radius, startAngle, endAngle, antiClockwise
		@context.closePath()
		@context.fill()
		this

# ## rectangle
# Ajoute un quadrilatère régulier au canvas.
# 
# * x : position depuis la gauche du canvas.
# * y : position depuis le haut du canvas.
# * width : largeur.
# * height : hauteur.
# * fill : code hexa de la couleur de remplissage, si *null* créé un "rectangle effaceur". 
# * strokesColor : code hexa de la couleur du contour.
# * strokesWidth : largeur du contour.
	rectangle: ( x, y, width, height, fill, strokesColor, strokesWidth = 1) =>
		if fill is null
			@context.clearRect x, y, width, height
		if strokesColor
			@context.strokeStyle = strokesColor
			@context.lineWidth = strokesWidth
			@context.strokeRect x, y, width, height
		if fill
			@context.strokeRect x, y, width, height
			@context.fillStyle = fill
			@context.fillRect x, y, width, height
		this

# ## polygone
# Ajoute un ensemble de points reliés entre eux au canvas,
# pouvant éventuellement former un polygone quelconque.
# 
# * coordinate : matrice de coodronnées de points de taille (x,2).
# * fillColor : code hexa de la couleur de remplissage. 
# * strokesColor : code hexa de la couleur de contoure.
# * strokesWidth : largeur du contour.
	polygone: (coordinate, fillColor, strokesColor, strokesWidth) =>
		@context.fillStyle = fillColor if fillColor
		@context.strokeStyle = strokesColor if strokesColor
		@context.lineWidth = strokesWidth if strokesWidth
		@context.beginPath()
		first = coordinate.shift()
		@context.moveTo(first[0], first[1])
		@context.lineTo(pointX, pointY) for [pointX, pointY] in coordinate
		@context.fill() if fillColor
		@context.stroke() if strokesWidth && strokesColor
		@context.closePath()
		this
	image: (url, sx, sy, sw..., sh, dx, dy, dw, dh) =>
		img = new Image()
		context = @context
		switch parseInt arguments.length
			when 9 then img.onload = () -> context.drawImage img, sx, sy, sw, sh, dx, dy, dw, dh
			when 5 then img.onload = () -> context.drawImage img, sx, sy, sw, sh
			when 3 then img.onload = () -> context.drawImage img, sx, sy
		img.src = url
		this
