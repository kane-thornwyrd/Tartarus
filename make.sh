#!/bin/bash

#	-c, --compile			compile to JavaScript and save as .js files
#	-i, --interactive	run an interactive CoffeeScript REPL
#	-o, --output			 set the directory for compiled JavaScript
#	-j, --join				 concatenate the scripts before compiling
#	-w, --watch				watch scripts for changes, and recompile
#	-p, --print				print the compiled JavaScript to stdout
#	-l, --lint				 pipe the compiled JavaScript through JSLint
#	-s, --stdio				listen for and compile scripts over stdio
#	-e, --eval				 compile a string from the command line
#	-r, --require			require a library before executing your script
#	-b, --bare				 compile without the top-level function wrapper
#	-t, --tokens			 print the tokens that the lexer produces
#	-n, --nodes				print the parse tree that Jison produces
#			--nodejs			 pass options through to the "node" binary
#	-v, --version			display CoffeeScript version
#	-h, --help				 display this help message


rm -Rf web/public/js/*.js
coffee -b -o web/ -c src/*.coffee
coffee -b -o web/models/ -c src/models/*.coffee
coffee -b -o web/routes/ -c src/routes/*.coffee
coffee -j -o web/public/js  -c src/client-coffee/*.coffee
mv web/public/js/concatenation.js web/public/js/main.js
rm -Rf web/public/docs
docco src/*.coffee
docco src/models/*.coffee
docco src/routes/*.coffee
docco src/client-coffee/*.coffee
mv docs web/public/

cp src/js-lib/*.js web/public/js

cp src/img-ready/* web/public/img/.

mkdir -p web/public/css
mkdir -p web/public/img
for SASS_TEMP in $(ls -AB src/sass | grep -e ".sass")
do
	tgt=$(echo $SASS_TEMP | sed -e "s/sass/css/")
#	sass -t compressed -E utf-8 src/sass/$SASS_TEMP > web/public/css/$tgt
	sass -t expanded -E utf-8 src/sass/$SASS_TEMP > web/public/css/$tgt
done

cp -R src/views web/
