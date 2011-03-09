fs = require 'fs'
sys = require 'sys'

option '-s', '--source [DIR]', 'directory for raw sourcecode'
option '-o', '--output [DIR]', 'directory for compiled code'

var_dump = (obj...) ->
	console.dir obj

indent = (str, sep = '-', length = 20) ->
	tab = length-str.length
	if tab > 0
		str += sep for [1..tab]
	str

memory_usage = (data = 'all') ->
	if data is 'all'
		for k, data of process.memoryUsage()
			do (k, data) ->
				k = indent k, '_', 10
				console.log "#{k}: #{Math.round(data/800000)}mio"
	else
		process.memoryUsage()[data]


task 'render:haml', 'Render the HAML templates in HTML', (options) ->
	require 'haml'
	options.source or= 'src'
	options.output or= 'web'
	fs.readdir(options.source, (err, files) ->
		for file in files
			fs.readFile options.source+'/'+file, 'utf-8', (err,fd) ->
				var_dump Haml
	)
#	src = 
#	code	= require('./lib/grammar').parser.generate()
#	dir		= options.output or 'lib'
#	fs.writeFile "#{dir}/parser.js", code


task 'render:jade', 'Render the JADE templates in HTML', (options) ->
	require 'jade'
