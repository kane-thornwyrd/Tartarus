
module.exports = (app) ->
	fs = require 'fs'

	app.get '/docs', (req, res) ->
		fs.readdir './public/docs', (err, files) ->
		console.dir fs.readdir
		res.render 'docs', {
			docs : {
				'app' : {
				link : '/docs/app.html'
				name : 'app'
				}
				'post' : {
				link : '/docs/post.html'
				name : 'post'
				}
			}
		}
