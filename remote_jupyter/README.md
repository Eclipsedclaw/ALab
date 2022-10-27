## This procedure works for setting up jupyter-lab on Aramaki Lab's ubuntu server remotely

First you need to ssh into Aramaki Lab ubuntu server using your own account and port 1412
```
ssh -p 1412 jiancheng@129.10.133.195
```
<img width="478" alt="Screen Shot 2022-10-27 at 2 26 18 PM" src="https://user-images.githubusercontent.com/37788723/198369484-68fd6d0f-6ec3-4276-b964-b993a7bedc2d.png">

It is highly recommanded to start the jupyter server in a separate screen. So please do this
```
screen -S Jupyter
```

Then in the new screen, we could make our server listen to certain port. And this port has to be forwarded. Please see other procedure about how to set up the port forwarding.
```
jupyter lab --no-browser --port=8082
```
<img width="1038" alt="Screen Shot 2022-10-27 at 2 34 33 PM" src="https://user-images.githubusercontent.com/37788723/198371061-dfc0924c-2f72-4a45-9f1e-7bb5e22397da.png">
Once you saw the output like upper picture, you could copy the last address with token included(Here is http://127.0.0.1:8082/lab?token=4947cbd2f815379768d10d39d3a47a3753f155ba7e076bff)

press ctrl+a+d to exit screen, then input:
```
exit
```

Next step is to establish the local connection to the forwarded port(here 8082). example code like this:
```
ssh -p 1412 jiancheng@129.10.133.195 -L 8082:127.0.0.1:8082
```
<img width="645" alt="Screen Shot 2022-10-27 at 2 38 48 PM" src="https://user-images.githubusercontent.com/37788723/198371828-2b5e7ba3-006a-4aff-8bb2-57a82cfe682b.png">
This command demand ssh connect through port 1412, after that we can connect our local port 8082 to the remote port 8082. After this command, you could paste the address from the jupyter server(with token) to your local browser and start to use jupyter lab.
<img width="1440" alt="Screen Shot 2022-10-27 at 2 42 12 PM" src="https://user-images.githubusercontent.com/37788723/198372518-2456eb64-b07f-47fc-9d56-7551c1b88c79.png">

