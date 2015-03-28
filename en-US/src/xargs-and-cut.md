# Command Line Tutorials – Xargs &amp; Cut

Greetings, friends! Welcome back to my ongoing command line series. If this is your first time here, you might want to [check out]("http://quickleft.com/blog/command-line-tutorials-more-tips-tricks") some of the older posts before diving in. Today we're going to talk about the `xargs` command in depth, and then we'll touch on the cut command.

When you chain commands together to achieve a longer effect, you have a few different options. Typically you'll use a [pipe]("http://quickleft.com/blog/command-line-tutorials-redirection-pipes") to accomplish something longer, like so:

```
ps aux | grep rails
```

That should be nothing new, but what if you wanted to chain a command together for multiple arguments? Perhaps you want to move all the files of a certain type in the current directory somewhere else, or you want to print out several files at once to more easily search their contents (something that '[grep]("http://quickleft.com/blog/command-line-tutorials-finding-grepping")' can do by itself, actually. but stick with me). How would I do something like that?

### xargs

Enter the `xargs` command. `xargs` is a command "used to build and execute command lines from standard input". It executes commands that don't accept standard input (i.e. things passed in using a pipe) with the arguments from standard input. If that doesn't make any sense, then maybe an example will help:

```
ls | xargs cat
```

Here's a normal '[ls]("http://quickleft.com/blog/command-line-for-beginners-part-1")' command, being piped into `xargs`. The latter takes a list of white space separated arguments – like the one ls produces – and then executes the command that follows ('("http://quickleft.com/blog/command-line-for-beginners-part-2")[cat]', in this example) on each file listed. This results in having each file in the current directory 'cat'ed out to your screen.

### ALL the flags

Here's how you can use xargs to move all the files of a certain kind somewhere else, like a hidden directory:

```
ls ~/*.txt | xargs -pI text_file mv text_file ~/.temp_txt
```

Oh man. There's a lot of stuff going on in there. First, we have an `ls` for all the files that end in '.txt' inside our home directory. We've seen that [wildcard operator]("http://quickleft.com/blog/command-line-tutorials-finding-grepping") (the '*') before, so that's nothing new. Next, we pipe that list into `xargs`, which now has a pair of flags to go with it. The 'p' flag gives us a prompt before executing each command; when you executed, you'll get a yes or no confirmation for each file it matched.

The 'I' flag is used to give the argument received a name ('text_file' in this case: the name is given immediately after the flag). As you can see, that name gets used later in the `xargs` command, as the first argument to the '[mv]("http://quickleft.com/blog/command-line-for-beginners-part-2")'. That `mv` command is still part of `xargs`; it's where the magic actually happens, so remember that!

Whew, okay. Let's regroup. If you execute that command, you'll be prompted whether or not you'd like to move each text file you have in your home directory, one at a time. That's pretty neat!

### cut

A useful tool for `xargs` is the `cut` command. `cut` takes in a file and extracts certain portions of it – typically either characters or fields. Here's an example that counts up the number of subdirectories inside your current directory:

```
ls -la | cut -c 1 | grep d | wc -l
```

Here we print out the current directory's contents, then we cut only the first character. With the long form (-l) of `ls`, that character will be a "d" if the file is a directory. Then, we `grep` for the letter "d", eliminating everything else, then we use the `wc` command to count up the number of lines. Chaining commands together is fun!

### MOAR flags

The `c` flag for `cut` cuts on characters, and the argument that follows tells `cut` how many characters to grab and from where. To use `cut` to get a whole field, you can do something like this:

```
ls -la | cut -f 1 -d " "
```

The `f` flag is exclusive to the `c` flag; that tells `cut` to grab fields instead of characters. Closely tied to the `f` flag is the `d` flag. That allows you to change the delimiter for `cut`, which is the tab character by default. That command will spit out the permissions for each file in your current directory, which isn't actually useful by itself, but serves as a nice example.

Okay, that's all for this week! Tune in next time for more command line fun times (you're having fun right!?)!
