# Command Line Tutorials – Linking

This chapter we're going to talk about links, both soft and hard!

So what's a soft link? For that matter, what's a hard link? Let's backtrack a little bit before we answer that. Your operating system has a filepath for every file on your system; you already know that most commands need a filepath to do their thing — think `ls`, `mv`, `cp`, etc. Filepaths are crucial to your computer's basic operation. To that end, your computer gives you a couple options for creating links to files; not necessarily changing the filepath itself, but enabling you to create an alias, or a shortcut to the file.

Armed with that knowledge, let's delve into hard links. When you create a hard link, you're essentially giving a file another name; another filepath. After you create the hard link, you can use either name to refer to the exact same file. For instance, you could edit one file with `vi`, then `cat` the contents of the other file and see your changes.

![Command Line Tutorials - Links]("https://quickleft.com/wp-content/uploads/main_dca7d98b-7361-43aa-94fa-d842010253ce.png")

By comparison, a soft link (aka a "symbolic link", or "symlink") doesn't link to a file — it links to a file name. Woah. Inception. This sounds crazy, but maybe an example will help. Recently, I converted to Sublime Text from TextMate. One thing I loved about TextMate was its command line tool, which made it super easy to open a file in TextMate from a command prompt. I wanted that behavior with Sublime, so I followed [this guide]("http://www.sublimetext.com/docs/2/osx_command_line.html") from the Sublime Text documentation. The first command in the guide is:

```
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```

The `ln` command, with the `-s` option, creates a soft link with the first argument (`"/Applications/Sublime Text 2…"`) as the source file and the second argument (`~/bin/subl`) as the target file (essentially just the name of your soft link). The source file in the example above is Sublime's built-in command line tool. You can execute it by typing out that long file path, but you don't want to do that every time. After creating the soft link, and assuming `~/bin` is in my `PATH` (callback!), I'll be able to execute the subl command from anywhere! For example, when I type:

```
subl ~/puppies.txt
```

…my shell locates the subl command (inside `~/bin`), sees it's a soft link, then follows it to the command contained inside the Sublime Text application and executes the command, which opens the file `~/puppies.txt` inside Sublime.

In case you don't use Sublime Text, let's do another example to get some more practice with links. Follow along! Type:

```
touch ~/Desktop/kittens.txt; echo "just kidding, puppies for life" > ~/Desktop/kittens.txt
```

Here's something we haven't seen before: we can execute multiple commands on the same line by separating them with a semicolon. After that line, you should see a new file on your desktop. Now, let's create a pair of links (hard links are also created using `ln`, without the `-s` option).

```
ln ~/Desktop/kittens.txt ~/Desktop/hard
ln -s ~/Desktop/kittens.txt ~/Desktop/soft
```

Okay, so now we have three files on our desktop: the original `kittens.txt`, a hard link, and a soft link to that file. Let's make sure we have everything correct:

```
ls -l ~/Desktop
```

When you give the `ls` command the `-l` option, it takes all of the soft links in the directory and shows you where they point to, i.e. the source file used when the link was created. You should see soft pointing towards `kittens.txt`, and no text next to the hard link. If you don't, try creating the links again. Otherwise, let's move on and edit the file using a link:

```
echo "knuckle tat: dawg life" > hard
```

Now, check the original file. You should see the contents have been replaced with your new tattoo idea!

Now, here's an important note about OSX and hard links: if you use a text editor like TextEdit, TextMate, or Sublime to edit the hard link, it'll break the link! The two files will then have different content, which defeats the entire purpose of using a link. For more information on why that occurs, [check out this Super User post]("http://superuser.com/questions/302051/how-do-you-create-a-working-hard-link-in-osx"). You can edit the hard link using `vi` or `echo` (like above) freely, plus you'll earn bonus command line points.
