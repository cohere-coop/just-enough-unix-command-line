# Command Line for Beginners Part 1

If there's one thing that separates code masters from the unknowing masses, it's their ability to use the command line effectively. When I began coding, I quickly realized that by utilizing the command line, many tasks became easier and faster. Your computer is smart; you just have to learn to speak its language.

This is the first installment of a bi-weekly series designed to make you a command line master. We'll start off slow, getting you accustomed to navigating your computer using the Terminal application, but as we go, you'll learn more and more commands, along with some bonus efficiency tips and exciting command line theory! Remember, it's important to take it slow and build a solid foundation, but soon you'll be hacking away like a pro.

Before we begin, I'm going to assume that you're using OSX. Command line in a Windows environment isn't too different, but for simplicity's sake, we'll stick with the Mac. I'm also going to assume you're using bash for a shell. Personally, I use zsh, but most computers are configured with bash to start out with. (You can look at Brent's post [here](http://quickleft.com/blog/switching-from-bash-to-zsh-in-os-x) for a guide). Either way, you'll be able to follow along with this guide.

Start by firing up your Terminal. If you've never done that before, you can use Spotlight to search for it (press Command and the space bar, then type "Terminal" and press enter). Make sure you pin it to your dock for easy access in the future. If you're successful, you'll have a command prompt!

A quick side note: if you're like most users, Terminal will place you in your home directory, which is denoted by the tilde ("~"). Typing "~" anywhere you would input a folder name will reference your home directory, just like a shortcut. There's a similar shortcut for your "root directory", which is represented by the forward slash ("/").

I'll touch on a few basic commands for navigating your file system, along with some other basic commands. For your first command, type:

```
pwd
```

This will tell you what current directory you're in. In fact, `pwd` is short for "print working directory", which is nerd speak for asking the computer to tell you where you are currently. After pressing enter, your computer will answer your question. Next, try typing:

```
ls
```

This command asks the computer to show you what's in the current directory; ls is short for "list". After you hit enter, you should see all the files and subdirectories inside your working directory. That's all well and good, but how can you move around the different folders on your computer? That's done by using the `cd` command, or in English, "change directory". Type:

```
cd /
```

`cd` works by switching to the directory immediately after the command itself. If you've been following along, you'll know that this command will switch you to your root directory. After you switch, try executing another "pwd", and confirm that you have actually changed directories. A common practice is to change to a new folder, use "ls" to see what's inside, then use `cd` to change to a subdirectory. A super sweet alternative is to type `cd`, then a space, then press the tab key. Your shell will then print a list of folders and files that you can change to. You can also tab through this list and press enter when you find the file or folder you're interested in. That will type it for you in your prompt (which can be a faster way to get to where you're going).

Pressing tab at any time will auto-complete your input, meaning your computer will take its best guess at what which folder/file you're trying to get at (with the computer's selection limited to the working directory, of course). If you're in the middle of typing a command, like if you type `cd` without a space after, bash will instead attempt to find other commands that start with `cd` instead of finding available files and folders.

Now, try typing this:

```
cd ~/Desktop
```

No matter where you are buried in your computer's files, this will bring you straight to your Desktop. This is an example of chaining folders on – in this example we are using `home/Desktop`, `home` of course being signified by the `~`. If you have any files or folders on your Desktop, you should be able to use the `cd ` + tab trick and see it all in your terminal. From there, you can choose available folders to `cd` into.

Additionally, all the commands you enter into Terminal are saved. If you make a typo or type something the computer doesn't like (for instance, `cd`ing into a text file), then you can access the old command to fix it by pressing the up arrow. Pressing the up arrow again will take you further back into your old commands, and pressing down will show you newer commands.

That's all for this post. Turn in two weeks from now for more information on creating, deleting, and moving files. Happy trails, command line trainees!