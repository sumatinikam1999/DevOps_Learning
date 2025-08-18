```
1. What makes an IP “private”
RFC 1918 says there are three blocks reserved for private networks:

Range	CIDR	Address Count	Example Usage
10.0.0.0 – 10.255.255.255	/8	16,777,216	Large enterprise/VPCs
172.16.0.0 – 172.31.255.255	/12	1,048,576	Medium networks
192.168.0.0 – 192.168.255.255	/16	65,536	Home/office LANs

If your CIDR falls in one of these ranges, it’s private by definition, regardless of IGW/NAT.
```

```
10.1.0.0 is inside the 10.0.0.0/8 private block.

That means it’s not globally routable — the internet will ignore it.

To reach the internet from such IPs, you must pass through a gateway device (like an IGW or NAT).
```

```
IGW (Internet Gateway) lets resources with public IPs reach the internet directly.

NAT (Network Address Translation Gateway) lets resources in private subnets (no public IP) reach the internet outbound only.

Whether an address is private/public has nothing to do with having an IGW — IGW just provides internet connectivity.
```

```
7. Tenancy
Refers to who’s running the hardware your instances are on.

Types:

Default tenancy — Your instances share physical hardware with other AWS customers (but isolated logically).

Dedicated tenancy — Your instances run on hardware only you use (more expensive, sometimes required for compliance).

Host tenancy — You bring your own physical server into AWS’s control (special cases).
```

