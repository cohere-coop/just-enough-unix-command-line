Command Line Tutorials – Tips &amp; Tricks

Are you ready for some more command line goodness? This week we've got a veritable cornucopia of small tricks and tips to improve your terminal skills. If you're not familiar with this series, [check out some of the older posts]("http://quickleft.com/blog/command-line-tutorials-linking")!

## 1. Alerts for process completion

When you're executing a command that takes a while to finish, you can do something like this:

```
rake db:migrate && say "all done"
```

This is similar to a trick we saw last week. You can execute two commands on the same line by separating them with a semicolon, or you can use a boolean and ('&amp;&amp;'). The second command will only fire if the first one was successful. If your first command finishes without erroring out, the second one will fire – in this case, causing your computer's text-to-speech to say aloud whatever you typed in. While that's a neat trick, your environment might be inappropriate for sound. In that case, you should check out [Growl]("http://growl.info/"), an OSX tool that manages notifications*.

* Also check out [Ruby Growl]("http://segment7.net/projects/ruby/growl/") for notifications, a fantastic suggestion by [Ben Johnson]("https://twitter.com/benbjohnson"). *

## 2. Execute the last command

Let's say you execute a command, and your shell complains that you don't have permission to do that. You could type out the whole command again, prefixed with sudo, or you could do this:

```
sudo !!
```

`!!` grabs the last command you entered and substitutes it into the current text in the command line, giving you a chance to further edit the command before executing it. `!` has other uses too; you can grab the last command you entered that started with `mk` like this:

```
!mk
```

## 3. cd – / pushd / popd

Let's say you accidentally change directories and you don't want to type out the whole filepath to get back to where you were. You can just type:

```
cd - / pushd / popd
```

That'll take you back to the last directory you were in. On a related note, if you're working in multiple directories, you can use the `pushd` and `popd` commands to efficiently manage the directories you're interested in. `pushd` takes the directory you're currently working in, adds it to a stack of directories, then changes to either a directory passed in as a parameter or the directory on top of the stack. `popd` changes you to the directory on the top of the stack, then removes it from the stack. For more information on these two commands, check out [their Wikipedia page]("http://en.wikipedia.org/wiki/Pushd_and_popd"). Try experimenting with them yourself and see if you can get a better feel for their behavior.

## 4. Command-line navigation

If you're like me, you're probably frustrated whenever you realize you made a typo at the beginning of your command. Using the arrow keys to maneuver back to the error and correct it is tedious at best. Fortunately, your prompt has some built in keyboard shortcuts that make it a little bit easier.

To jump to the beginning of the line, use `ctrl + a`. Similarly, to get to the end of the line, type `ctrl + e`. These are easy to remember! The letter 'a' is at the beginning of the alphabet, and end starts with the letter `e`.

To move back and forth between individual characters (just like the left and right arrow keys, but now you don't have to move your hand), use `ctrl + b` and `ctrl + f`. These are also easy to remember: `b` for back, and `f` for forward.

To move between words in the command line, use `esc + b` and `esc + f`. This is a little bit more of a reach for your hand, but the ability to move between words is incredibly useful.

Alright party people, that's it for this week. If you have any favorite command line tidbits of your own, post it in the comments below!
