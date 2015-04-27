# Sed & Awk

It's time to  command and conquer! This chapter we're going to take a look at two very important commands for your toolbox – `sed` and `awk`. These two commands are pretty powerful, but as a result, their learning curve can be pretty steep. I'll provide you an outline to get you up to speed on sed and awk, but there's more to these commands than I have room here to cover. Fortunately, there's a ton of information on the internet about these commands, and I encourage you to read up on them once we're done.

The first command we'll discuss is `sed`, which stands for "stream editor" – it gives you a nifty way to perform operations on files you're passing around through pipes. If that sounds confusing, hang on for one second – an example should help clear it up. One of the most common things you'll use sed for is text substitution, i.e. replacing certain text with something else. The syntax for doing that looks like this:

```
echo "it's a trap" | sed s/ra/ar/
```

First we perform an echo on a string, so we have some data to actually work with. That text gets piped to the `sed` command (pipes are super important for sed and awk; if you need a refresher, check out [my post on redirection and pipes]("http://quickleft.com/blog/command-line-tutorials-redirection-pipes")). Let's break apart that `sed` command.

First, we have "s", for substitute. Next is "/", our delimiter for separating the different components of the command (note that you're not limited to just "/"; if what you're searching for contains slashes, it might be more convenient to use an underscore or a colon). After the first delimiter, we have a [regular expression]("http://en.wikipedia.org/wiki/Regular_expression") for the text we'd like to replace. Finally, we have another delimiter, followed by the replacement string (i.e. what you'd like the old text to say after running the command), with a trailing delimiter after that. Phew, that's lengthy!

Try out that command, and you should see "it's a tarp" printed out. Substitution on a basic string isn't too useful, so let's try it out on a file instead. Type the following two commands:

```
echo "how now brown cow" > ~/temp.txt
sed s/ow/aagh/ ~/temp.txt
```


First we create the file, then we perform the substition. You'll see the result fed to the screen, but you should see only the first "ow" got replaced. Why? Only the first match of the regex got replaced. To hit every match, you need to add a flag to the end of the `sed` command, like so:

```
sed s/ow/aagh/g ~/temp.txt
```

That's more like it, but if you check out the file, you'll see that that change wasn't actually saved. You could pipe the output to the same file, but `sed` provides another flag that will do it for you. Try this:

```
sed -ie 's/ow/aagh/g' ~/temp.txt
```

There we go! What else can `sed` do? Deletions are pretty simple. Here's an example that duplicates the functionality of the `head` command.

```
sed '11,$ d' ~/temp.txt
```

Of course, this doesn't actually delete the lines; you're not writing to the file, so it just feeds those lines out to your shell. The "11,$" portion of the command tells `sed` to delete everything from the eleventh line to the end of the file. You're not limited to numbers for that range; instead you can use regular expressions to mark the beginning and end of what you'd like to delete. Or, if you'd like, you can use one expression, causing `sed` to delete everything that matches it. You can use sed to delete comments from a Ruby script like so:

```
sed '/#.*/ d'
```

That regular expression matches every comment in a file – any text that follows a "#".

There's a bunch more to `sed`, but let's move onto `awk` now. `awk` is a utility that's useful for processing text files. The utility considers each file as a set of records, which by default are the lines in the file. `awk` enables you to create a condition and action pair, and for each record that matches the condition, the action will fire. That's really wordy, so hopefully an example will help. First, let's create a file to use for the demo, then let's run a basic `awk` command on that file.

```
ls -la > temp.txt
awk '/root/ {print $1, $9;}' temp.txt
```

Again, let's break it down. Most `awk` commands follow this pattern – you have a condition, followed by an action in curly braces. Our condition in this case is the regular expression /root/, which will match any line that contains "root". The action that follows is written in the AWK language, which could take up an entire series of blog posts, but all you need to know here is that it's printing the first and ninth fields ("columns") of the record (which in our case are the permissions of the file and the filename). You can play around with the expression and see how many matches you can get, and you can also add columns to the action statement. You can also omit the action entirely, like so:

```
awk '/root/' ~/temp.txt
```

The default action for `awk` is to print the entire record, so the previous command will print every line that contains "root". Of course, you can use other conditions; for example, checking whether or not a certain field is above or below a given threshold (i.e. $5 &gt; 2), or checking whether a record has a certain column. Your actions can be varied too, based on the AWK language. You can use `awk` to substitute just like `sed`, by using the AWK `sub` or `gsub commands. Here, I'll change every occurence of "jessica" to "nicelady", but only if the filename starts with a period:

```
awk '$9 ~/^\./ {gsub(/jessica/, "nicelady"); print;}' ~/temp.txt
```

Wow, that's a beefy command. First, the condition checks whether or not `$9`, the ninth field, matches the regular expression `/^./`; in plain people language, does the filename start with a period? Then the action calls the AWK function gsub, for global substitution. Everywhere in the file that matches /jessica/, we substitute the string "nicelady". Then, once that's done, we print the line. If I want to make that change to the file permanent, then the easiest way is to pipe the output straight to the file, adding " | ~/temp.txt" onto the end of the `awk` command.

So for a quick overview, `sed` and `awk` are flexible stream editing utilities. They operate a little differently, but each relies on the power of regular expressions and text matching to do its job. There is SO MUCH MORE to these commands that I hope you take the time to look them up; hopefully this introduction opened your eyes to the world of command line stream editing.

That's all for this week! Post in the comments if you have anything to add, or any questions to ask!
