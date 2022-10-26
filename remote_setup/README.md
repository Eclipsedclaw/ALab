# This procedure is needed only for setup your vnc for the first time!
## please do not reboot/turn off the ubuntu server without telling everyone in the lab!

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
After copy above into the file, input **:wq** to exit text editor
<img width="635" alt="Screen Shot 2022-10-26 at 3 58 10 PM" src="https://user-images.githubusercontent.com/37788723/198124688-e58965c9-a878-49a3-9678-3a81677c2474.png">

change ownership of the startup setup
```
$ chmod +x ~/.vnc/xstartup
```
<img width="626" alt="Screen Shot 2022-10-26 at 3 58 41 PM" src="https://user-images.githubusercontent.com/37788723/198124772-f7f61e58-c53c-433d-9d11-148105b880cc.png">

Start the vnc server by typing:
```
$ tigervncserver
```
please check the output on the terminal, remember the port number of your session(in this case port 5905).
<img width="1372" alt="Screen Shot 2022-10-26 at 3 59 06 PM" src="https://user-images.githubusercontent.com/37788723/198124848-df0d1a97-06cf-4419-a947-b0af547a2383.png">

 Next exit ssh by typing:
```
$ exit
```
<img width="445" alt="Screen Shot 2022-10-26 at 3 59 50 PM" src="https://user-images.githubusercontent.com/37788723/198124972-277af223-47a8-43b3-9489-bef3e87d34df.png">


change **accountname** to your own account and use **your own portnumber** in the below command:
```
$ ssh -p 1412 accountname@129.10.133.195 -L 5905:127.0.0.1:5905
```
using default password aramakilab to login
<img width="985" alt="Screen Shot 2022-10-26 at 4 01 48 PM" src="https://user-images.githubusercontent.com/37788723/198125331-d30ea393-cb12-4cc7-84c1-4f66223c6524.png">

go to vncviewer(download at https://www.realvnc.com/en/connect/download/viewer/), rightclick and select new connection. put 127.0.0.1:5905(**change 5905 to your own port number**) in the VNC server and naming your own session. Then hit ok
<img width="549" alt="Screen Shot 2022-10-26 at 4 04 29 PM" src="https://user-images.githubusercontent.com/37788723/198125839-eb3cb88a-8223-4d57-a9dc-ab29a2739f3e.png">

double click on the connection you just made, then select don't warn me about this again and click continue.
<img width="579" alt="Screen Shot 2022-10-26 at 4 06 03 PM" src="https://user-images.githubusercontent.com/37788723/198126106-55fbafdb-8221-479d-b87d-094a6d0cf6e9.png">

Depending on whether you want to input vnc password each time or not you could selct remember password and then hit ok.
<img width="574" alt="Screen Shot 2022-10-26 at 4 07 11 PM" src="https://user-images.githubusercontent.com/37788723/198126362-c780ef36-2890-4d65-8226-726044773d57.png">

And then you should be able to login to the linux server using the default password! Have fun!
<img width="1249" alt="Screen Shot 2022-10-26 at 4 08 36 PM" src="https://user-images.githubusercontent.com/37788723/198126600-08fea0da-05e3-48e9-98a7-4d825051f2e7.png">

## Second time login
When you already went through steps above, you only need to do two steps to connect to UI interface:
change **accountname** to your own account and use **your own portnumber** in the below command:
```
$ ssh -p 1412 accountname@129.10.133.195 -L 5905:127.0.0.1:5905
```
<img width="985" alt="Screen Shot 2022-10-26 at 4 01 48 PM" src="https://user-images.githubusercontent.com/37788723/198125331-d30ea393-cb12-4cc7-84c1-4f66223c6524.png">

Then go to your vnc viewer, double click the connection that you already set
