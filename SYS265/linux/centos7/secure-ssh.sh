#secure-ssh.sh
#author reece
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
sudo useradd -m -s /bin/bash "$1"

sudo usermod -aG ssh "$1"

sudo cp SYS265/linux/public-keys/id_rsa.pub /home/"$1"/.ssh/authorized_keys
sudo chmod 700 /home/"$1"/.ssh
sudo chmod 600 /home/"$1"/.ssh/authorized_keys
sudo chown -R "$1":"$1" /home/"$1"/.ssh

# What the heck the "remote repo"? Please clarify this

sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

sudo service ssh restart

echo "All good with SSH!"
