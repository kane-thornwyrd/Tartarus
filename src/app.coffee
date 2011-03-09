
# Expose modules in ./support for demo purposes
require.paths.unshift __dirname + '/../../support'
require.paths.unshift __dirname + '/../lib'

# Module dependencies.
express = require 'express'
v8_profiler = require 'v8-profiler'
messages = require 'express-contrib/messages'
app = module.exports = express.createServer()

# ## Config

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

# ## mount hook

app.mounted (other)->
	console.log 'Application montée !'

# ## Flash message helper provided by express-contrib
# voir `$ npm install express-contrib`

app.dynamicHelpers {
	messages : messages
	base : ->
# return the app's mount-point
# so that urls can adjust. For example
# if you run this example /post/add works
# however if you run the mounting example
# it adjusts to /blog/post/add
		if app.route is '/' then '' else app.route
}

# ## Middleware

app.configure ()->
	app.use express.logger '\x1b[33m:method\x1b[0m \x1b[32m:url\x1b[0m :response-time'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser()
	app.use express.session {
		secret : 'keyboard cat'
	}
	app.use app.router
	app.use express.static __dirname + '/public'
	app.use express.static __dirname + '/docs'
	app.use express.errorHandler {
		dumpExceptions : true
		showStack: true
	}

# ## Routes

require('./routes/site') app
require('./routes/post') app
require('./routes/docs') app

if not module.parent
	app.listen 3000
	console.log 'Tartarus on http://localhost:3000'
