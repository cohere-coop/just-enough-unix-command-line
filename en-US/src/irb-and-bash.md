# IRB & Bash

This chapter we're going to cover some more scripting. We're going to mix up Ruby and bash this week and see if we can do something cool along the way. If you don't know Ruby, don't worry: we won't do anything super complicated. You should have Ruby installed by default if you're using OSX. If not, check out [this site]("http://www.ruby-lang.org/en/downloads/") to download it.

First, type:

```
irb
```

This brings up the "interactive Ruby shell", which gives you a back-and-forth session with Ruby inside your Terminal. This is a great way to immerse yourself with Ruby. Being able to type pure Ruby into the console is invaluable. Also, don't tell anyone, but sometimes I use it as a calculator.

Okay, you should have a Ruby prompt. We're going to tell Ruby to do something 10 times:

```
10.times do |i|
  `touch ~/#{i}.txt`
end
```

Make sure you press enter after each line. If you haven't written Ruby before this may look complicated, but there's not too much going on here. The first line just says that we want to do something 10 times, which makes sense when you read it out loud. The |i| part might make less sense, but it enables us to use the number of times we've repeated so far inside the loop.

Here's where we come to the most interesting part: Ruby lets us type in bash commands, where it executes them. This works not just in irb, but in any full length script you might want to write. Anything encased in backticks (`) will be processed as a bash command. Inside, you should recognize our old friend, the touch command. The file name might look like gibberish right now, so let's break that down too.

We want to create a file inside our home directory (`~/`). Ruby will interpret the next part (`#{i}`) as something different each time the loop gets processed. The first time through, `#{i}` will be replaced by 0, then the next time it'll be replaced by 1, etc., all the way up through 9.

Make sure you type in end, to let Ruby know the loop is being ended; that's all we wanted to do. After you press end and enter, you'll see some feedback from irb. Go check out your home directory – you should see 10 shiny new text files.

Let's do a little cleanup on those files.

```
10.times do |i|
  `rm ~/#{i}.txt`
end
```

This pretty closely resembles the commands above; we want to make sure we delete exactly the same files that we created (otherwise you could just do something like `rm ~/*.txt`, which would delete all `.txt` files in your home directory).

Playing around with the command line and irb a little more, you can do things like:

```
puts `cat ~/temp/test.html`.split.first
```

This grabs the contents of temp/test.html, splits it into chunks based on white space, then prints (`puts`) the first one out to the command line.
