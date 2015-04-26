# Command Line Tutorials – Curl

![Olympic Curling](https://quickleft.com/wp-content/uploads/main_b8efeaf9-cdf2-4ebe-b09c-0c4968a2c55b.jpeg)

In this chapter we're going to cover one command in depth, since it's a pretty important one. We're going to learn about `curl`, and if time permits – curling!

`curl` is "a command line tool for getting or sending files using URL syntax." It might help to read it as cURL, in order to help remind yourself what it does. First, to get some information, type:

```
man curl
```

As we've previously learned, most commands that come with your system have what's called a `man` page, short for manual; by typing in that command, you've opened the system's help page for the `curl` command. To move around, use your arrow keys. I don't expect you to read the whole thing (and if you already did, then wow, I'm sorry), but just know that this page exists and can be a handy resource to refer to. When you're done, press `Q` to quit.

So to see it in action, type:

```
curl http://www.google.com
```

Oops! Now your shell is filled with the response that Google spits back at us. `curl` went out, made an http GET request against the website we supplied, then brought back everything it found and threw it into your command prompt. Let's refine that a little bit:

```
curl http://www.google.com | tidy -i
```

This passes `curl`'s output into a command we haven't seen before: `tidy`. `tidy` will nicely format any code we pass to it, and it's configurable to boot (check out the `man` page!). The only option we're setting is for indentation, since that'll make it look nice and pretty. After running the command, you should see some feedback from `tidy` containing the formatted code. That's a step forward, but I think we can do better.

```
curl http://www.google.com | pbcopy
```

Here, we're feeding the response retrieved by `curl` into another new command, `pbcopy`. This is a little bit nicer on the eyes and the brain, since it just puts the `curl` results straight to your clipboard, which allows you to paste straight into your favorite text editor. No code will be printed in your Terminal, only a confirmation graph of `curl`'s download.

We can also use redirection with `curl` to copy it straight to a file, skipping the middleman.

```
curl http://www.google.com &gt;&gt; ~/google.txt
```

This will append the response into `google.txt`, located in your home directory. You could also use a single '&gt;' to obliterate what's in that file, leaving only Google's source in the file.

Curl also works with grep: let's single out the title of Google's homepage:

```
curl http://www.google.com | grep "&lt;title&gt;"
```

With this combination of commands, we're searching for any line that contains the phrase &lt;title&gt;; Google has mashed a lot of things onto the same line with the title, but you should see the part you're interested in appear in a different color, thanks to grep.

Coders will often use `curl` and pipes to execute code off the internet. Here, we're going to grab someone's Ruby "Hello World!" script from GitHub with `curl` and pass it into the ruby command:

```
curl https://raw.github.com/leachim6/hello-world/master/r/ruby.rb | ruby
```

*WARNING WARNING WARNING*: Just because you *can* doesn't mean you *should*. *Always read the 3rd party code before executing locally*.

After downloading the source (you'll get the chart again (charts are neat)), you should see the output of the script. That's a very simple application of using `curl` and ruby, but you get the picture. If you've installed RVM before, you used `curl` to retrieve a bash script, that you then passed into bash. Check out [the RVM install page]("https://rvm.io/rvm/install/"), and peep the first command. It should make a lot more sense to you, now that you know what `curl` is!

That's all for today! Maybe we can get to curling in the next chapter.
