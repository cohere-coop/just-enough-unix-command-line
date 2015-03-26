# Command Line Tutorials – System Profiler & Top

Welcome back to our command line studies! Unless of course this is your first time here, in which case you should get acquainted with the [rest of the series]("http://quickleft.com/blog/command-line-tutorials-scripting") first.

Today we're going to cover a couple commands that you should find useful at some point. The first is the `system_profiler` command. Run without any arguments, the command simply spits out a (huge) list of your computer's current configuration. The information includes practically everything about your computer; it's like the "About This Mac" utility on steroids. Type:

```
man system_profiler
```

The `man` command opens up the manual in VIM for the command that follows. Generally, it'll list the different arguments available for the command. Sometimes, it'll give you an example usage. To exit the manual, press `q` (for quit)!

For a quick demonstration, type:

```
system_profiler | grep "Serial Number (system)"
```

Here's our new `system_profiler` command, followed by our good friend `grep`. We're going to search the output of the system_profiler command for the string "Serial Number (system)", which will end up outputting something like this…

```
Serial Number (system): ##########
```

This is the serial number of your computer! Using `system_profiler`, we were able to figure that out without opening anything or turning the computer over. The command has many more uses than that, so it's a good one to keep in your pocket.

Next is the command `top`. This command will show you all of the processes that are running on your system, sorted by their usage of the CPU, with the highest on top.

*Edit (3/30/2012)* – [Mike Pack]("http://www.mikepackdev.com") gave this awesome correction and tip –
"Not every system orders the results of `top` the same. For instance, my system's (OS X 10.7.3) default ordering is by PID. You can find the default ordering in `man top` and scrolling down to to the -o flag. When I want to order by CPU usage, I run `top -o cpu`."

If your computer is running super slow, you can run the top command to see if any single process is consuming more than it should. Type:

```
top
```

This will fill up your Terminal with the list of processes and take away control from you. While it's open, take a note of a couple things. The columns we're interested in are *COMMAND*, *%CPU*, and *PID*. *COMMAND* is obviously the name of the command that's running, and *%CPU* is the percentage of the CPU that command is using. *PID* is the process id, an identifier that's unique for each process in the table.

Okay, that's all we're interested in. In order to take control back from the process, press `Control + C` (this is a pretty standard procedure for taking control back from processes, so you'd do well to remember this key sequence). Now that you know which process/command is hogging up all your memory, what are you gonna do about it? Here's where the `kill` command comes into play. `kill` looks like this:

```
kill [PID]
```

…Where [PID] is a number that represents a process, just like the ones we saw in the table after running top. For a fun exercise and to see kill in action, let's fire up top again. Find the top process in the table and make a note of the `PID`. Once you have that, open up a new Terminal (don't do it in the same one! Taking control back from the process kills it before you can, and that's boring!) session and type the following:

```
kill 1234
```

…substituting `1234` with the `PID` you just found. Switch back to the other Terminal window and you'll see that your table is gone.

Hope you enjoyed checking out these commands! Come back in two weeks time for more command line fun!
