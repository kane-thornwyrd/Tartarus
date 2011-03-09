# # Fake data store
# All will be stored in ram ;)
ids = 0
db = {}

`var Post = exports = module.exports = function Post(title, body) {
  this.id = ++ids;
  this.title = title;
  this.body = body;
  this.createdAt = new Date;
}`

Post.prototype.save = (callback) ->
	db[@id] = this
	callback()

Post.prototype.validate = (callback) ->

	return callback new Error '_title_ required' unless @title
	return callback new Error '_body_ required' unless @body
	return callback new Error "_body_ should be at least **10** characters long, was only _#{@title.length}_" unless @body.length > 10
	callback()


Post.prototype.update = (data, callback) ->
	@updatedAt = new Date
	for key in data when data[key] is not undefined
		@[key] = data[key]
	@save callback

Post.prototype.destroy = (callback) ->
	exports.destroy @id, callback

exports.count = (callback) ->
	callback null, Object.keys(db).length

exports.all = (callback) ->
	arr = Object.keys(db).reduce (arr, id)->
		arr.push(db[id])
		arr
	, []
	callback null, arr

exports.get = (id, callback) ->
	callback null, db[id]

exports.destroy = (id, callback) ->
	if db[id]
		delete db[id]
		callback()
	else
		callback new Error "post #{id} does not exist"
