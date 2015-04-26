# Command Line Tutorials – Path

This chapter we're gonna talk a little bit about your path variable and some related commands.

*Just for a quick note – these directory structures are reflective of OSX. If you are using a different operating system, these paths might not be correct.*

First, type

```
echo $PATH
```

You know what `echo` does, so what's `$PATH`? That's an environment variable! These are set for you when your shell session starts up. To get a full list of all the defined environment variables, type:

```
printenv
```
*\* (You can also use the command "env" to print the same list)*

You should see a list of all the variables, with their names on the left and their values on the right. And hey, there's the `PATH` variable! Let's talk a little bit about what `PATH` does for you. `PATH` is a colon-separated list of directories that contain executable programs. This is where some (but not all) of your commands are actually located on the system. When you execute a command, your computer looks through `PATH` until it finds that command, then it runs the code (usually). You can add or remove directories to the list as you see fit. Here's an example of adding a directory:

```
PATH=$PATH:/tmp/cmd
```

This adds the /tmp/cmd directory onto the end of your `PATH` variable; the colon is key, since that's how directories are split up inside the `PATH` variable. Try the `echo` command above again, and you should see your change. That's how you add a directory, but what about removing one? I'll get back to that. For now, quit your Terminal session and restart it. Try `echo` on your path again. You should see that /tmp/cmd is no longer on the end of your path. Wait, what?

Setting an environment variable like above is only temporary. It won't last between sessions (or even between multiple tabs within the same application). So what are you supposed to do? There are a couple options. First, you can add a path export function to your shell's profile, located in your home directory. If you're using zsh, you would place the following line of code in the file `~/.zshrc`. If you're running bash, then they can go in `~/.bash_profile` (If you're still using bash, check out [this post](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html) for more information on your profile files, for there's two of them you see).

```
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/
local/bin:/usr/X11/bin:/usr/local/git/bin:/tmp/cmd
```

Put that line in your profile, then in every shell that you start, that will be your new `PATH` variable. If that seems a little messy, then you might prefer the second way, which has to do with how your computer even populated that `PATH` variable with directories in the first place. Type:

```
cat /etc/paths
```

What's printed is a list of the default directories your computer adds to `PATH`. But wait, there's more! Type:

```
ls /etc/paths.d
```

Here's a list of files that contain even more entries for your `PATH`! If you have one in there, then you should try `cat on that file; you'll see that it has even more directories for `PATH`. Try comparing `PATH`'s contents with all of the entries you've found. Here's the trick – when you want to add a directory onto your `PATH` variable, you can add it to either /etc/paths or you can wrap it in a file inside /etc/paths.d – your shell will correctly build the `PATH` variable for you when you start your session.

Okay, one more thing: check out this command:

```
which printenv
```

The 'which' command tells you where the command on the right lives. For `printenv`, you should see `/usr/bin/printenv`. This is useful for debugging – if you try to execute a command and your shell barks at you, telling you it can't find it, then try using 'which' to locate the command in question. Usually this happens when I think a command is in my path, but it's really not – that's when I edit `PATH` using one of the two methods above.
