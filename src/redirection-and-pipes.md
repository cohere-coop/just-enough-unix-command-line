# Command Line Tutorials – Redirection &amp; Pipes

Hey there, hackers! By now, you're becoming pretty proficient at the command line, but if this is your first time here, you should check out the [previous parts]("http://quickleft.com/blog/command-line-tutorials-finding-grepping") in this series.

Today we're going to look at a few basic operators that your shell supports. The operators we're examining allow you to send a command's output to different places, like files or even other commands. Formally, this is called "redirection", and it's one of Bash's coolest features.

For a quick example, let's try putting our current directory's filepath into a file, just for safekeeping:

```
pwd &gt; directory_path
```

What's happening here? First, we have the command whose output we want, pwd. Then, we have our operator, &gt;. It grabs the output from the command on the left and feeds it to the file on the right, which in this case is directory_path.

Did it work? Try printing the contents of the directory_path file by typing

```
cat directory_path
```

Success! A couple notes: the &gt; operator will create the file if it doesn't exist, and it will overwrite it if it does exist. What if you don't want that? Then you have the &gt;&gt; operator. Let's see it in action:

```
echo 'Hello, cruel world!' &gt;&gt; directory_path
```

The "echo" command simply outputs the text that you feed it. Cat that file again, as above, to see what exactly happened. You should see that the output of the list command was appended to the file we created above, giving you a file that contains your current directory's location and the phrase we entered using "echo". It looks like this:

```
/Users/jessica
Hello, cruel world!
```

The command &gt;&gt; is a little nicer to your files; if the file specified doesn't exist, it gets created and modified, but if it does exist, then the output from your command gets added to the end of that file's contents.

Okay, let's delve a little deeper. We got a brief taste of the pipe operator in last week's edition, but now we're going to cover it a little bit more in depth. The best way to learn how the pipe works is to look at some examples. Let's look at one now:

```
du | sort -nr | head
```

Here, we have three commands separated by "|", which is the pipe operator. This is located above the enter key on most keyboards. The first command is "du", which is short for disk usage. It tells you how much memory each subdirectory or file contained inside your current directory is using, listing the size of each, along with the name. We pass the output of that command to the command on the right using the pipe.

The next command, `sort`, normally sorts the input in ascending order, but with the `-r` flag we pass in, will reverse the order to descending (the -n flag tells sort to do so numerically). At this point, our output would be a list of all the files in our current directory sorted by how much memory they're using, from highest to lowest. However, we have one more pipe and one more command.

The final command is `head`, which is similar to the `cat` command we use to print files to the Terminal. `head` is a little different; it's designed to print just the first few lines of a file. By default, it will only print 10, so unless you tell it otherwise, that's all you'll get. So in the chain of commands that we have above, `head` was passed the sorted list of files, and it takes the top 10 and chops off the rest. Our end result will be a list of the 10 most memory-consuming files inside our current directory. From my root directory, it looks something like this:

```
94543224  .
46532448    ./Music
46532432    ./Music/iTunes
44352472    ./Music/iTunes/iTunes Music
28346504    ./Library
24024488    ./Library/Application Support
21787536    ./Library/Application Support/Steam
21719184    ./Library/Application Support/Steam/SteamApps
10770008    ./Downloads
3540216 ./Music/iTunes/iTunes Music/Podcasts
```

Okay, that's a lot to take in, but let's try it all together at the same time. Try thinking like your shell, and consider the various inputs and outputs being passed from command to command in the line of code below:

```
ls -la | head &gt;&gt; new_file
```

First, we're listing the contents of our directory, then we're grabbing the top 10 listed and adding them to the file "new_file".

That's all for this week! Try out some of these operators on your own, and post some of the cool commands you write in the comments below!
