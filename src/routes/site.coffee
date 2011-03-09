# Module dependencies.
Post = require '../models/post'

module.exports = (app) ->
	app.get '/', (req, res) ->
		Post.count (err, count) ->
			Post.all (err, posts) ->
				res.render 'index', {
					count : count
					posts : posts
				}
