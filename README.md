#Tartarus
**BEWARE ! this project is really at experimental step.
Nothing's guaranteed.**

##Index
0. Dependencies
1. Quick start
2. Descriptions (for humans and developpers)
3. SH Scripts bundled
4. Source tree

##Dependencies
* A Brain
* A GNU based distro
* A Shell (not a sea one, more something like Bourne's one)
* Node.js
* Coffeescript
* Node-inspector
* Haml (only SASS in facts…¬¬ )

##Quick start
    $ cd my/project/diretory
    $ ./make.sh
    $ ./run.sh
→ http://localhost:3000

*If you don't understand the previous lines, don't try to run this project for now. Go back to a normal life, turn "ON" your SNES and enjoy a real good game that can run.*

##Descriptions
###For humans
This is supposed to become a game, "Squaresoft's golden age"-like (Illusion of Time, Secret of Mana, Chrono trigger, etc.).

For now that's just a small blob of codes in which one can try to see how far one can go with such cutting edge technics.
###For tech savvy
By "cutting edge technics" I mean using javascript server-side via [Node.js] [Node.js site] & [Express framework] [Express site], with [Jade's template system] [Jade site], [SASS stylesheets] [SASS site] and all the javascript are written in [Coffeescript] [Coffeescript site] (I don't even mention using [JQuery] [JQuery site] on the both sides). At last there will maybe even a [Comet system] [Wiki comet(programming)] (server pushing datas to clients without request from these last ones).

##SH Scripts bundled
###make.sh
As expected, the `make.sh` script build the project from source and put the files in the right places.

__Notice those lines _(near line 42)___ :

    #	sass -t compressed -E utf-8 src/sass/$SASS_TEMP > web/public/css/$tgt
    	sass -t expanded -E utf-8 src/sass/$SASS_TEMP > web/public/css/$tgt

When one is decided to compile the app for "production", one can uncomment the first line and comment the second, the "SASS" will be compiled in a single-line css, not cool for debugging, but great for optimisation.
###run.sh
Just launch the server. Listening at http://localhost:3000 .
###debug.sh
More interesting, start a [Debug session] [Debug session] with a almighty firebug-like tool, able to set breakpoints directly in the application (node-inspector: killer feature !) .


##Source tree

    ├client-coffee
`.coffee` files that will be compiled, concatened and included in the application's main layout.

    ├img
Images sources, artworks, raw scans, `.psd`, `.xcf`, etc.

    ├img-ready
`.png`, `.jpg`, etc. that will be copied in the compiled application to be available via css or `<img \>` tag.

    ├js-lib
`.js` files that will be copied as is in the js folder from the application.

    ├models
`.coffee` describing models for the application (OMG [MVC] [Wiki Model-View-Controler] goodness !)

    ├routes
`.coffee` defining the differents _routes_ availables in the application ([see Express docs & exemples] [Express site])

    ├sass
`.sass` files, there won't be any dynamic CSS in this project. So all the `.sass` placed here will be compiled, concatened and saved as a _main.css_ available in the application.

    ├views
`.jade`'s home, contrary to the `.sass` files, they'll won't compiled, but parsed at runtime, as any other template system do.

    └app.coffee
That's like the *main* of any program, the entry point to launch all the rest.

---------------------------------
_Damn… I couldn't imagine how boring to write README is…_

  [Node.js site]: http://nodejs.org/
  [Jade site]: http://jade-lang.com/
  [SASS site]: http://sass-lang.com/
  [JQuery site]: http://jquery.com/
  [Express site]: http://expressjs.com/
  [Coffeescript site]: http://jashkenas.github.com/coffee-script/
  [Wiki comet(programming)]: http://en.wikipedia.org/wiki/Comet_%28programming%29
  [Wiki Model-View-Controler]: http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
  [Debug session]: http://localhost:8080/debug?port=5858 "http://localhost:8080/debug?port=5858"