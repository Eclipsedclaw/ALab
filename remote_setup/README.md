First please use terminal to ssh to your new account. Change below command tsuguoaramaki to your own account.(default password aramakilab)
```
$ ssh -p 1412 tsuguoaramaki@129.10.133.195
```

setup your vnc password by typing:
```
$ vncpasswd
```

set up start up file by using command:
```
$ nano ~/.vnc/xstartup
```

after open xstartup, please copy and paste below things into the file
```
#!/bin/sh
# Start Gnome 3 Desktop 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session
```

hit ctrl+x to exit

change ownership of the startup setup
```
$ chmod +x ~/.vnc/xstartup
```

Start the vnc server by typing:
```
$ tigervncserver
```

please check the output on the terminal, remember the port number of your session. Next exit ssh by typing:
```
$ exit
```

change tsuguoaramaki to your own account and change two 5903 to port number just showed on your screen:
```
$ ssh -p 1412 tsuguoaramaki@129.10.133.195 -L 5903:127.0.0.1:5903
```

Leave command window on and go to vncviewe, start a new session with 127.0.0.1:5903(change last four digit to your own port). Then use the password you set earlier to login.
