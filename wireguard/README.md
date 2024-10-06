# Wireguard setup with NetworkManager

## 1. Generate Wireguard-Config (in OPCsense under VPN/WireGuard/Peer generator)

The file should be looking like this:
```
[Interface]
PrivateKey = xxxxxxxx=
Address = 10.0.1.1/32 #Address of the peer.
DNS = 10.0.0.1 #DNS-Server of the router.

[Peer]
PublicKey = xxxx=
Endpoint = 1.1.1.1:51820 # Public IP of the router.
AllowedIPs = 0.0.0.0/0,::/0 #What IP-Ranges are allowed to be routed.
```

## 2. Load config into NetworkManager

```
nmcli connect import type wireguard file <filename>.conf
```

## 3. Start connection

```
nmcli connect up <filename>
```