# SSH

This chapter, we're going to talk about two commands related to accessing other servers or computers. If you've ever plan on deploying your software to a server, then remote computing is an important skill to have. Luckily, it's not too hard.

First, you're going to want to master the `ssh` command. `ssh` stands for Secure SHell, and it's included on most Unix systems. This kind of command has been around as long as Unix, but this one is important because it encrypts your session, meaning nobody can steal your login credentials, or see what kind of things you're doing on the server. Unfortunately, I can only show you what the commands look like, but if you know a remote host you can connect to (and you have credentials, those are important too), then feel free to follow along.

```
ssh username@hostname
```

It's that easy! Technically the only argument `ssh` needs is the host name. If that's all you supply, then `ssh` assumes your user name on the remote server is the same as your local name. The next thing you'll see, if it's your first time on the server as that user, is a confirmation of the host name.

```
The authenticity of host 'hostname (123.4.567.890)' can't be established.
RSA key fingerprint is 00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff.
Are you sure you want to continue connecting (yes/no)?
```

`ssh` wants to protect you, so it makes sure that that's the computer you're really trying to connect to. Make sure you carefully read this description, since someone could be trying to pull one over on you. If you know you have the right one, then type `yes`.

After that, you'll be prompted for your password. Assuming you have one, go ahead and type it in. Further assuming you're successful, then you'll have a command prompt on the remote host. Celebrate!

Now that you're here, you'll be able to run most commands that you normally could at your own command prompt. Obviously, the file directory will be different, since you're on a different machine. Depending on the system's configuration, you might have your own home directory, separate from all the other users who could access that machine, but more likely is that you share the same home as everyone else. As a result, it's important to be thoughtful whenever your move/remove/create files on the system; you don't want to accidentally delete someone else's stuff (or maybe you do, but just know that I'm always judging you if that's the case).

Okay, that's neat. When you're done, type:

```
exit
```

`exit` finishes your session on the remote server and returns you to wherever you were when you originally typed the `ssh` command. Let's go a little bit deeper now: assume you have a file on your system that you want to put on a remote server. How could you do that?

```
scp test.txt username@hostname:
```

The `scp` command stands for "*S*ecure *C*o*P*y"; it always takes two arguments: the file you want to copy, and the destination for that file. Here you see the same "username@hostname" as above (swap that with your real name and server name, just like last time). That signifies the machine that you want to port your file over to. After you enter the command, you'll be prompted for your password, just like the "ssh" command.

Take note of the colon at the end, because it's pretty important. If you leave it just like that, then your file will have the same name it does locally, and it'll be placed in your home directory on the remote machine.

```
scp ~/test.txt username@hostname:~/temp/party_time.txt
```

Here we're taking a file from your local home directory and putting it up on the remote server under the subdirectory `temp`. At the same time, we're changing the name to `party_time.txt`.

Let's take it in reverse. What if you want to get a file from the server and put it on your local machine?

```
scp username@hostname:~/.ssh/authorized_keys ~/keys.txt
```

This command rips the list of authorized keys from the server and puts it in a text file in your home directory. All we had to do was flip the order of the from/to files. Basically, you're taking the file pointed at by the first argument and putting it in the second argument.

If you have two computers, try taking `scp` and `ssh` for a test drive! All you need to do is figure out your IP address for your target computer, which you can find in your connection settings.

That's all for this week!
