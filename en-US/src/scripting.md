# Command Line Tutorials – Scripting

Okay, Command-os (I'm so sorry, the joke had to be made), let's get back to it. This chapter, we're going to look at scripting in a very general sense. Scripting is a complex topic that would be hard to cover in just one post, but it's a handy thing to know the basics. Put simply, scripting is like storing a bunch of commands into a file and executing them one-by-one.

First, from your home directory, type:

```
touch first.sh
```

As you know, we just created a file; the `.sh` extension on the end signifies that it's a bash script. It's not strictly required, but it's a useful convention to adhere to. Next, let's open it up for editing. You can do this by using the "vi" command if you have the chops, or you can open up the file in your favorite text editor.

First things first, we're going to start our script with what's called a `shebang`.

```
#!/bin/bash
```

A what now? The "#" symbol is commonly called a hash, and the "!" is referred to as a bang, and when you jam those symbols together like in that line of code, it's called a "shebang". Yup. But what does this line actually do? It signifies that what follows is a Bash script, and it allows you to execute the whole script at the command line, just like a command! Keep that in your brain, we're going to come back to it soon.

Keeping up so far? Next, in your script, type:

```
echo 'hey world hey'
```

Here's our friend again, the `echo` command. It just prints out what it's told, but in this case it makes our script meaningful; the `shebang` by itself doesn't do anything. So now that our script does something, we're ready to execute it. At the command line (not inside your script), type:

```
bash first.sh
```

What? An error? If you've been following along, you should get an error that says something along the lines of "permission denied". You created a file with read/write privileges, but what it doesn't have is permission to execute. How do you do that? Just ask the computer! Still at the command line, type:

```
chmod u+x first.sh
```

The `chmod` command changes the permissions on a given file; the `u+x` indicates that we want to give the *u*ser e*x*ecution privileges. You can read more about `chmod` and privileges [here]("http://en.wikipedia.org/wiki/Chmod").

Okay, now that's taken care of, let's try executing it again. This time, type:

```
./first.sh
```

I promised I'd come back around, so here's what the `shebang` buys us. The syntax here indicates that we want to execute a command in the current directory, signified by the "." I won't get too far into it, but that's a security feature of Bash that protects you from executing code that you don't want to. This allows you to execute the script without specifying which command should handle it (i.e. Ruby, Python, Bash, etc.)

Did you see the text from your script? If you did, that's great! If you get an error that says something about your syntax, make sure your `shebang` and `echo` statements are correct (Your script should only contain two lines. It's a shorty!). If you still get a permission error, then try executing the `chmod` command again, as above.

That's all for this week! Join me again in two weeks' time for more command line fun!
