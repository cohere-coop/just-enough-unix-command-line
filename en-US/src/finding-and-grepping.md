# Finding & Grepping

We're going to cover a few slightly more advanced topics in this chapter, so strap yourself in and fire up your Terminal!

Your Terminal has a couple built in commands intended for searching, be it for files or for the contents of a file. The first one is find, and it searches a directory for files. Let's say you want to list all the pathnames of all the ".jpg"'s in your home directory. You could type:

```
find ~ -name *.jpg
```

Let's break this down. First, you have the command name, then you have the directory to search (~ in this case). Following that is a flag that specifies a certain way for the command to behave (typically anything following a dash is a flag; there are a few exceptions). In this case, the flag tells find to search specifically for things with the name that follows, which in this case is *.jpg. The "*" is a wildcard, telling find to match any file as long as it ends with ".jpg".

Running `find` without any flags will list all the files in your current directory, and all the files in the subdirectories. `find` is recursive; it keeps drilling down your directory structure until it can't find any more files to process.

Another search command is `grep`, which is a little bit more useful. `grep` will search a given file for an expression, typically a string. Let's see an example:

```
grep "blog" temp.txt
```

This command will return every line in temp.txt that contains the word blog. What's interesting about grep is that it gives you some options for what you search on, allowing you to insert wildcards to increase the range of what gets matched.

```
grep "bl.g" temp.txt
```

The "." is a wildcard; it matches any character just once; for instance, output of this command might look something like:

```
blog
blag
bl&g
```

There are way more wildcards than just "." though. To whet your appetite, take a look at [this site]("http://www.panix.com/~elflord/unix/grep.html").

"grep" provides a few more options too. To search a file for a string that's case insensitive, add the "-i" flag. The following command could match a line containing cats, cATs, CATS, etc.

```
grep -i "cats" ~/cats.txt
```

"grep" is a super useful tool that serves a lot of different purposes. For example, if you know you entered a command recently that you want to use again, but you just don't want to press up a billion times to find it, you can use grep to search your command history! Here's how it's done:

```
history | grep "find"
```

Here we're searching our command line history for all the commands that have find in them. The "|" character is right above the enter key on most keyboards (press shift, then the backslash). The "|" has a special meaning at the command line. Essentially, it takes the output of the command on the left and feeds it to the command on the right. In this case, it's pretty plain to see that we're searching our history. Try typing history to see what exactly we're searching.

You can find your commands this way, but how can you execute them? Bash has another built-in feature that allows you to execute old commands. Once you have the list of commands, you'll see they each have a number in front. By typing:

```
!5
```

…you'll execute the command following the number 5. It's pretty straightforward, and typically beats mashing your up key hoping to find what you're looking for.

Let's look at one more usage of `grep`. If you wanted to take a look at the processes running on your system and the files they currently have open, you can do a little command line wizardry to accomplish just that. First, the command `ps aux` will list all the processes running, but only their process ids (under the PID column). To get that list, type:

```
ps aux
```

You can also use `grep` to search through your processes with `ps aux`.

```
ps aux | grep terminal
```

Now what do we do with that list? Well, we have another command, "lsof", that lists files your system currently has open; you can read a little more about it [here]("http://en.wikipedia.org/wiki/Lsof"). Using the process id from running "ps aux" as above, you can see what exactly that process has open by typing:

```
lsof | grep 1234
```

…replacing `1234` with the appropriate process number.
