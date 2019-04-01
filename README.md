smib-commands
=============

[smib][] is the So Make It bot, implemented using [smib.pl][] for IRC and [smib.py](https://github.com/somakeit/slack-smib/) for Slack. He hangs
around on the Space [slack server](http://slack.somakeit.org.uk) or #SoMakeIt and #SoutHACKton on irc.freenode.net and keeps us up
to date. You can also send him commands...

Running a command
-----------------

Simply prefix the command name with a `?` and write it into a channel
smib is in. E.g. `?debug Testing testing 123`

You can see the list of commands in this repository, or have a look on
[smib's wiki page][smib].

Writing a command
-----------------

A command is a simple script and can be written in any language that
[Toad][] understands. Don't forget to make the script executable (e.g.
`chmod +x scriptname`) and to add a [shebang][] at the top (e.g.
`#!/usr/bin/env python`). Take a look at the example [debug.sh][]
script.

The extension of your command does not affect how your command runs 
(we use the shebang), but it **must** be present and it **should** 
represent the language the script is written in - e.g. `.sh` for bash,
`.py` for python, `.coffee` for CoffeeScript.

The command is sent 3 or 4 arguments\*:

  1. Nick - the nick name of the user invoking us
  2. Channel - the channel over which the request was sent (or blank if
     it was a private message)
  3. Sender - the Channel if there was one, otherwise the Nick.
  4. Args - the text sent by the user after the command (if any)

Try to send as few lines as possible - preferably one but no more than
4. (Any more than this will be rate limited.)

\*A full list of arguments is maintained on the [smib.pl][] documentation.

Installing a command
--------------------

If you have commit access to this repository then simply commit and
push your script, then issue the `?pull` command in a channel
containing smib.

Who maintains smib?
-------------------

Anyone with push/commit access to this repository.

[Toad]: https://wiki.somakeit.org.uk/wiki/Toad
[smib]: https://wiki.somakeit.org.uk/wiki/smib
[smib.pl]: https://github.com/somakeit/smib
[shebang]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[debug.sh]: https://github.com/somakeit/smib-commands/blob/master/debug.sh
[Benjie]: https://wiki.somakeit.org.uk/wiki/User:Benjie
