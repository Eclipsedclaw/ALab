First please use terminal to ssh to your new account. Change below command **accountname** to your own account.(default password **aramakilab**, recommand change to your own after the end of this procedure)
```
$ ssh -p 1412 accountname@129.10.133.195
```
<img width="737" alt="Screen Shot 2022-10-26 at 3 52 19 PM" src="https://user-images.githubusercontent.com/37788723/198123208-bd32b143-01fd-42dd-aa91-bd86fc755722.png">


setup your vnc password by typing:
```
$ vncpasswd
```
And after typing two times of vnc password, choose no for view-only password
<img width="650" alt="Screen Shot 2022-10-26 at 3 53 26 PM" src="https://user-images.githubusercontent.com/37788723/198123451-1619e1ce-b15c-4989-bc25-75648a5fe4e3.png">

set up start up file by using command:
```
$ vim ~/.vnc/xstartup
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
<img width="641" alt="Screen Shot 2022-10-26 at 3 55 42 PM" src="https://user-images.githubusercontent.com/37788723/198124286-7bcbd665-6dfd-4954-ad5b-a2a128041d43.png">

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
