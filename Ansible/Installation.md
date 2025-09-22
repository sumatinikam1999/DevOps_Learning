
#### Steps to Set Up Ansible with 1 Master and 3 Slave Servers

## Create 4 Servers:

# 1 Master Server (for Ansible)

# 3 Slave Servers (to be managed by Ansible)

# Install Ansible on Master Server:

# On the Master Server, install Ansible.

# For Amazon Linux:

```
sudo yum install ansible -y

```


# Create ansible User on All Servers:

# On all 4 servers (Master and Slaves), run:
```
sudo useradd ansible
```

# Disable Password Authentication on All Servers:

# Edit the SSH config on all servers to disable password authentication.
```
sudo vi /etc/ssh/sshd_config
```
```
Set the following:
PasswordAuthentication no
```


# Restart SSH on all servers:
```
sudo systemctl restart sshd
```

# Generate SSH Key on Master Server:

# On the Master Server, generate the SSH key:
```
ssh-keygen -t rsa 
```

# This will create the files id_rsa (private) and id_rsa.pub (public).

# Copy Public Key to All Slave Servers:

# On the Master Server, copy the public key:
```
cat ~/.ssh/id_rsa.pub
```
Log in to each Slave Server and run:
```
sudo mkdir -p /home/ansible/.ssh
sudo echo "paste-your-public-key-here" >> /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo chmod 700 /home/ansible/.ssh
sudo chmod 600 /home/ansible/.ssh/authorized_keys
```

# Replace paste-your-public-key-here with the public key you copied from the Master Server.

# Test SSH from Master to Slaves:

# From the Master Server, try SSHing into the Slave Servers:

```
ssh ansible@slave_server_ip
```

# Configure Ansible Inventory on Master Server:

# Edit the inventory file on the Master Server to add the Slave Servers:

```
sudo vi /etc/ansible/hosts
```

# Add the slave servers (replace IPs with actual):

```
[slaves]
slave1 ansible_host=slave1_ip
slave2 ansible_host=slave2_ip
slave3 ansible_host=slave3_ip
```

# Test Ansible Connectivity:

# Run this on the Master Server to check if Ansible can reach all Slave Servers:

```
ansible all -m ping -u ansible
```

# You should see a "pong" response from each slave.

# Run Playbooks:

# Now you can run Ansible playbooks to manage the slaves:

```
ansible-playbook -i /etc/ansible/hosts your_playbook.yml
```