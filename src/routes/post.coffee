# Module dependencies.
basicAuth = require('express').basicAuth
Post = require '../models/post'

module.exports = (app) ->

# ## Basic auth to all post related routes

	app.all '/post(/*)?', basicAuth (user, pass) ->
		user is 'admin' and pass is 'express'

# Map `:post` to the database, loading
# every time `:post` is present.
	app.param 'post', (req, res, next, id) ->
		Post.get id, (err, post) ->
			return next err if err
			return next new Error 'failed to load post ' + id if (!post)
			req.post = post
			next()

# ## Add a post.
	app.get '/post/add', (req, res) ->
		res.render 'post/form', {
			post : {}
		}

# ## Save a post.
	app.post '/post', (req, res) ->
		data = req.body.post
		post = new Post data.title, data.body

# ### Validation
		post.validate (err) ->
			if (err)
				req.flash 'error', err.message
				res.redirect 'back'

# ### Save
		post.save (err) ->
			req.flash 'info', 'Successfully created post _%s_', post.title
#			res.redirect '/post/' + post.id
			res.redirect '/'

# ## Display
	app.get '/post/:post', (req, res) ->
		res.render 'post', {
			post : req.post
		}

# ## Display the post edit form.
	app.get '/post/:post/edit', (req, res) ->
		res.render 'post/form', {
			post : req.post
		}

# ## Update post
# Typically a data layer would handle this stuff.
	app.put '/post/:post', (req, res, next) ->
		post = req.post
		post.validate (err) ->
			if err
				req.flash 'error', err.message
				res.redirect 'back'
			post.update req.body.post, (err) ->
				return next err if err
				req.flash 'info', 'Successfully updated post'
				res.redirect 'back'
