
First please use terminal to ssh to your new account

$ ssh -p 1412 tsuguoaramaki@129.10.133.195    #change tsuguoaramaki to your own account

$ vncpasswd   #setup your vnc password

$ vim ~/.vnc/xstartup   #after open this file, please copy and paste below things into the file

,,,
#!/bin/sh
# Start Gnome 3 Desktop 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session
,,,

$ chmod +x ~/.vnc/xstartup    #change ownership of the startup setup

$ tigervncserver

#please check the output on the terminal, remember the port number of your session. Next exit ssh

$ exit

$ ssh -p 1412 tsuguoaramaki@129.10.133.195 -L 5903:127.0.0.1:5903   #change tsuguoaramaki to your own account and change two 5903 to port number just showed

