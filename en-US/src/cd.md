# cd

`cd` works by switching to the directory you type immediately after the command itself.

```
cd /
```

This will switch you to your root directory. After you switch, try executing `pwd`, and confirm that you have actually changed to the root directory. A common practice is to use `ls` to see what's inside your current directory, then use `cd` to change to a subdirectory. An alternative is to type `cd`, then a space, then press the tab key twice. Your shell will then print a list of directories that you can change to.

After you've started typing a directory into your prompt, pressing tab will auto-complete your input. This means that your computer will take its best guess at which directory you're trying to change to (limited to subdirectories within the current directory). If you're in the middle of typing a command, like if you type `cd` without a space after, bash will instead attempt to find other commands that start with `cd` instead of finding available directories.

Now, try typing this:

```
cd ~/Desktop
```

This is an example of chaining directories. In this example we are using `~/Desktop` (remember - `~` is a shortcut for your Home directory). No matter where you are buried in your computer's files, this will bring you straight to your Desktop.  If you have any directories on your Desktop, you should be able to use the `cd ` + tab trick and see them in your terminal. From there, you can choose available directories to `cd` into.

Additionally, all the commands you enter into Terminal are saved. If you make a typo or type something the computer doesn't like (for instance, `cd`ing into a text file), then you can access the old command to fix it by pressing the up arrow. Pressing the up arrow again will take you further back into your old commands, and pressing down will show you newer commands.
