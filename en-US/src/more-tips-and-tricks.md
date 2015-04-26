# Command Line Tutorials – More Tips &amp; Tricks

## 1. Customizing your prompt

This trick is for everybody still using bash as their shell, because the format is a little bit different for people using zsh [nice, long post](here's a ("http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/") about customizing your zsh prompt). For bash, there are a few different environment variables that are used when determining what your shell prints out for the prompt. The one we're interested in is PS1, so let's check out what's there.

```
echo $PS1
```

If you're using the default bash prompt for OSX, you should see h:W u$ printed out. It only looks like gibberish right now. We can break it down into components to make it more sensible.

First, you have h, which is a special character in this context. It tells the prompt command to spit out the hostname (just the first part); this will be what you named your computer when you took it out of the box, i.e. JaneBook or FancyPants. Sandwiched between h and the next special character is a colon. It doesn't have any special meaning, it's just there as a delimiter. Next is `W`; this prints out the working directory (without any of the parent directories listed; if that's something you want, try using `w`). Finally, you have `u` followed by `$`. u corresponds to your user name, and `$` is an escaped dollar sign; all that gets printed out is a dollar sign.

Remembering all of those special characters can be a drag, so here's [a cheat sheet]("http://ss64.com/bash/syntax-prompt.html") for you to use. Armed with all of that knowledge, let's try building our own prompt.

```
export PS1="[\t \w] $"
```

This will make your prompt look something like this: `[21:51:42 ~] $`. We have the current time, given by `t`, followed by the working directory (`w`), encased in a pair of parentheses, followed up by a dollar sign. To make this change permanent, put that line of code into your `.bashrc` profile.

## 2. Background Tasks

If you've ever run a command that takes ahold of your prompt and won't let go until you terminate it, this trick might be useful for you. To run a command in the background (i.e., without relinquishing control of your shell), append '&amp;' to the end of the command. As an example, we'll use a command we've covered before that takes up your prompt, although it won't be the most useful command to run in the background:

```
top &
```

We've seen top before; we used it to identify which process was consuming the most memory before killing it. Again, it's not the most useful command to run in the background, but it's convenient for us to use here. After running that, you'll get confirmation from your shell that the command's process is up and running, and you'll also get the Pid. Next, try:

```
jobs
```

This command will show you all the commands you have running in the background (which are called jobs! Hence, this command's name). Now, to bring a job back to the foreground, type:

```
fg %1
```

The `fg` command is short for "foreground"; it brings a process forward. The syntax is a little strange; enter `%`, followed by the job number. You should note the job number is separate from the process number. If you add the `-l` flag onto jobs, it'll show you both.

## 3. Control + R

We've seen how you can combine the `grep` and `history` commands to find a particular command, then execute it. We've also seen that you can type !! to execute the last command. Here's the new trick that combines these two. If you press the control key in combination with `r`, then you can perform a backwards search on your history for a given phrase. When you press `control + r`, you'll get a prompt that says `bck-i-search:`. Type in a phrase, and your prompt will be automatically completed with the last command that contained that phrase. If you keep pressing `control + r`, then the search will iterate backwards over your history, finding the next match. Executing the command listed is as simple as pressing enter!
