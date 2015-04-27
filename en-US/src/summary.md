# Summary

## Command Line Basics Pt. 1 and Pt. 2

The first and second chapters described the very basics of command line usage. We covered how to launch your Terminal for the very first time, how to navigate through your directories from the command line,  how to destroy/create both files and folders, how to move and copy files, and how to print the contents of a file out onto your screen.

Commands covered: `cd`, `ls`, `pwd`, `mkdir`, `touch`, `vi`, `rm`, `rmdir`, `mv`, `cp`, `cat

## Finding and Grepping

In the next chapter, we discussed commands intended for searching. The 'find' command searches for filenames, and the `grep` command searches through file contents. We also covered using `grep` in combination with the `history` and `ps aux` commands, in order to find a particular command or process.

Commands covered: `find`, `grep`, `history`, `ps aux`, `lsof`

## Redirection and Pipes

Next, we covered a complex topic: redirection. For a quick refresher, redirection is the act of sending one command's output to a file or another command. We discussed using `<` and `<<`, the redirection output operators to output text to file in either overwrite or append mode. Next, we chained commands together using `|`, the pipe.

Commands/operators covered: `<`, `<<`, `|`, `echo`, `du`, `sort`, `head`

## Scripting

In March, we dove into scripting. We created our first script that simply printed out a phrase. First, we included a "shebang" at the top of the file in order to mark it as a script, but when we tried to execute our script, we got an error. Finally, we had to change the permissions on the file to get it to run.

Commands covered: `bash`, `chmod`

## Profiler and Top

Next, we investigated the systemprofiler and top commands. We used `grep` to search the output of `systemprofiler` to find our computers' serial numbers. After that, we figured out how to `kill` the process that`s consuming the most memory, using `top` to identify that particular process.

Commands covered: `man`, `systemprofiler`, `top`, `kill_`

## SSH

In this chapter, we covered the basics of using the `ssh` and `scp` commands to get access to another server/computer. We discussed logging in (and out) with `ssh`, then running commands remotely. We then used the `scp` command to put move a local file onto a server, then we reversed that process to move a remote file onto our local machine.

Commands covered: `ssh`, `scp`

## IRB and Bash

This chapter showed how to mix basic bash commands with some Ruby goodness. We fired up `irb`, an interactive Ruby REPL (read, evaluate, print, and loop) to repeatedly execute bash commands. We also used `irb` to use more advanced Ruby commands to achieve something that'd be harder in bash.

Commands covered: `irb`

## Curl

Next, we went in-depth on the `curl` command. We used `curl` to grab the source code from google.com, then we cleaned it up with tidy. We also used pbcopy to grab the code and copy it onto our clipboard, so we could paste it into our favorite text editor. Finally, we looked at a practical applications of `curl`, like fetching code from the internet and executing it (WHICH IS *DANGEROUS*, but you knew that already).

Commands covered: `curl`, `tidy`, `pbcopy`

## Path

In this chapter, we learned about environment variables and how to list them using `printenv`. We went pretty deep on the PATH variable, an environment variable that determines where your shell looks for commands. We covered how to add and remove directories from the path. More accurately how to change the contents of an environment variable, both temporarily and permanently by adding it to your shell's profile.

Commands covered: `printenv`, `export`, `which`

## Linking

In July, we learned a little bit more about how the file system operates with links, which are essentially aliases/shortcuts for files on your computer. We covered the difference between hard links and soft links, then we learned how to create each using the `ln` command. This is a pretty complex topic that's unlike anything we've covered, so I definitely recommend checking out that blog again if you have any questions.

Commands covered: `ln` (with various flags)

## Sed & Awk

Stream editors are useful command-line tools for performing operations on data being passed around in "streams" – i.e., data/files being piped between commands. In this chapter, we covered the very basics of the `sed` and `awk` commands, which are probably the most complicated things that we've covered in this series. While there's still a lot to be learned in this area, these chapters are a useful outline to get started.

Commands covered: `sed`, `awk`

## Xargs & Cut

Next, we experimented with a different form of redirection by using the `xargs` command. `xargs` takes a whitespace separated list of arguments and performs a command on each. We looked at a lengthy application of `xargs`, chaining together commands to move all of the text files in the current directory into a hidden folder. Then, we looked at the `cut` command, which is used for slicing up a file into portions that you specify. We looked at a couple different flags in order to specify which part of the file you want, then we used cut in an example to familiarize ourself with it.

Commands covered: `xargs` (with various flags), `cut` (with various flags)

## Tips & Tricks

These chapters covered some smaller odds and ends that didn't merit their own chapter, along with some tips for efficient use of the command line. I encouraged you guys to add some tips of your own, and you guys did not disappoint! I definitely recommend reading the comments on these chapters if you haven't already, because you might learn something new.

Commands/operators covered: `&&`, `!!`, `pushd`, `popd`, `jobs`, `fg`
