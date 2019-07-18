# openvpn access server

This Dockerfile provides a base image for **openvpn-as**

This is a Linux only image, since it's functionality is based on the [Use network host](https://docs.docker.com/network/host/) Docker functionality.

## Version

* openvpn-as **2.7.4**

## References

* [openvpn access server on a linux system](https://openvpn.net/vpn-server-resources/installing-openvpn-access-server-on-a-linux-system/#Installation_requirements_and_preparation)

## Configuration

### Host

There are two constrains that must be fullfilled in the host for the server to start properly.

Check if the following kernel modules have been loaded

```bash
lsmod | grep tun
```

and

```bash
lsmod | grep tap
```

In case of missing modules run

```bash
modprobe tun tap
```

### Container

#### Run

```bash
docker run -ti --network host --privileged --cap-add=NET_ADMIN -p 943:943 5thempire/openvpn bash
```

#### Network host

Use network host and verify all the network devices are available. **NET_ADMIN** should provide access to iptables inside the container.

```bash
ifconfig
```

#### openvpn-as

Configure openvpn-as webui

```bash
sh /usr/local/openvpn_as/bin/ovpn-init
```

Assuming you've chosen **all interfaces** and the **port 943**, you should have been provided with a link similar to the following `http://192.168.0.10:943/admin`. 

Set a password for your _openvpn_ docker user

```bash
passwd openvpn
```

Visit the link, the user is **openvpn** and the password is the one you've just provided.
