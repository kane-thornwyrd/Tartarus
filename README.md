#Tartarus
**BEWARE ! this project is really at experimental step.
Nothing's guaranteed.**

##Index
1. Quick start
2. SH Scripts bundled
3. Source tree
4. Workflow

##Quick start
    $ cd my/project/diretory
    $ ./make.sh
    $ ./run.sh
→ http://localhost:3000

*If you don't understand the previous lines, don't try to run this project for now. Go back to a normal life, turn "ON" your SNES and enjoy a real good game that can run.*

##SH Scripts bundled
<dl>
<dt>make.sh</dt>
<dd>As expected, the `make.sh` script build the project from source and put the files in the right places.</dd>
<dt>run.sh</dt>
<dd>Just launch the server.</dd>
<dt>debug.sh</dt>
<dd>More interesting, start a [debug session]  [1] with a firebug-like tool, able to set breakpoints directly in the application (OMG I'm in love with node-inspector !) .</dd>
</dl>

##Source tree
##Workflow

[1]: http://localhost:8080/debug?port=5858 "debug session"