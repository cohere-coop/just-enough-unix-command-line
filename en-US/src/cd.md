# cd

```
cd /
```

`cd` works by switching to the directory immediately after the command itself. If you've been following along, you'll know that this command will switch you to your root directory. After you switch, try executing `pwd`, and confirm that you have actually changed directories. A common practice is to change to a new folder, use `ls` to see what's inside, then use `cd` to change to a subdirectory. An alternative is to type `cd`, then a space, then press the tab key. Your shell will then print a list of folders and files that you can change to. You can also tab through this list and press enter when you find the file or folder you're interested in. That will type it for you in your prompt (which can be a faster way to get to where you're going).

Pressing tab at any time will auto-complete your input, meaning your computer will take its best guess at what which folder/file you're trying to get at (with the computer's selection limited to the working directory, of course). If you're in the middle of typing a command, like if you type `cd` without a space after, bash will instead attempt to find other commands that start with `cd` instead of finding available files and folders.

Now, try typing this:

```
cd ~/Desktop
```

No matter where you are buried in your computer's files, this will bring you straight to your Desktop. This is an example of chaining folders on – in this example we are using `home/Desktop`, `home` of course being signified by the `~`. If you have any files or folders on your Desktop, you should be able to use the `cd ` + tab trick and see it all in your terminal. From there, you can choose available folders to `cd` into.

Additionally, all the commands you enter into Terminal are saved. If you make a typo or type something the computer doesn't like (for instance, `cd`ing into a text file), then you can access the old command to fix it by pressing the up arrow. Pressing the up arrow again will take you further back into your old commands, and pressing down will show you newer commands.
